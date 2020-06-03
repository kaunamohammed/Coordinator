# Coordinator

[![License](https://img.shields.io/cocoapods/l/CoordinatorLibrary.svg?style=flat)](https://cocoapods.org/pods/CoordinatorLibrary)
[![Platform](https://img.shields.io/cocoapods/p/CoordinatorLibrary.svg?style=flat)](https://cocoapods.org/pods/CoordinatorLibrary)
![GitHub Release Date](https://img.shields.io/github/release-date/kaunamohammed/Coordinator.svg)

## Coordinator

Coordinators are actually just as the name suggest, Coordinators. They are designed to abstract away the navigation logic from view controllers and help with better seperation of concerns. Overall, the Coordinator consists of Three protocols, to clearly define responsibilities of each type conforming to them and allow for some protocol composition.

### Coordinatable
This protocol has one requirement ```start()```. This is the method where you should set up the Coordinators ViewController.

### NavigationCoordinatable
This protocol has only one requirement. Types conforming to it should have a ```presenter``` which can be any subclass of ```UINavigationController```. It also has some extensions to abstract away implementation details of presenting another screen in your app. 

```swift
public func navigate(to viewController: UIViewController, with presentationStyle: PresentationStyle, animated: Bool)
```

### ChildCoordinatable
This protocol has four requirements.

```swift
var children: [String: Coordinatable] { get set } 
    
func add(child coordinator: Coordinatable, key: String)
    
func remove(coordinator: Coordinatable)
    
func removeAllChidren()
 ```
**Note:** They have been implemented as protocol extensions so you do not have to when you're adopting the protocol.

**Note on adopting Coordinator protocols:** While you're within your right to use these protocols on your own and compose them how you see fit, I would advice checking out the convinience classes that have abstracted some of the ways in which you might want to use Coordinators protocols. Continue reading below to have a look.

### App Coordinator

```swift
open class AppCoordinator: Coordinatable, ChildCoordinatable
```

App Coordinator is a base class that is in charge of starting the application navigation. It would typically reside in the ```AppDelegate``` where it kicks-off coordinating to it's children based on some custom logic. 

**Note:** ```AppCoordinator``` is meant to be subclassed. This is because based on your app or business requirements you may want to handle coordinating to children differently. It is also a convinience class designed to abstract away dealing with setting up the application window. This allows you to focus on exactly what matters, configuring your application navigation logic. 

For example, here's how you might subclass the ```AppCoordinator``` and customize navigation. In a real world use-case this would probably be based on if the current user is signed in or not.

```swift
class CoordinatorExampleAppCoordinator: AppCoordinator {
    
    override func start() {
        Bool.random() ? startChildA() : startChildB()
    }
    
}
```

### Navigation Coordinators

```swift
open class NavigationCoordinator<T: UIViewController>: NavigationFlowCoordinator
```
Navigation Coordinators are a specialized generic base class for dealing with navigating to and from a view controller in the navigation stack.

### Child Coordinators

```swift
open class ChildCoordinator<T: UIViewController>: NavigationCoordinator<T>, ChildCoordinatable
```
Child Coordinators are a specialized generic base class for dealing with adding/removing a child coordinator from it's parent. 
Child Coordinators inherit from ```NavigationFlowCoordinator```.

When we subclass ```ChildCoordinator``` we are then able to handle adding and removing a child coordinator from it's parent as illustrated here.

```swift
 child = ViewControllerBCoordinator(presenter: presenter)
 add(child: child)
 child.start()
 child.movingFromParent { [weak self] in self?.removeChild() }
 func removeChild() {
    remove(child: child)
 }
```
**Note:** You would need to call `movingFromParent` to be notified when the back button has been pressed on the navigation controller. At this point you can do anything you'd like. For example, as illustrated above, calling `remove(child:)` in the closure removes the child coordinator from its parents child hierachy, freeing up memory.


**Note:** There are two ways in which you can get notified when a child is being removed from its parent, either you subclass a specialized view controller called `CoordinatorViewController` which handles dispatching `movingFromParent` notifications or you can implement this below in your own view controller if you don't want to opt in for that free behavior: 

```swift

private unowned let coordinator: RemoveAction
    
public init(coordinator: RemoveAction) {
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
}

open override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     if isMovingFromParent {
         coordinator.movingFromParent?()
     }
}

```
By default, any class inheriting from `NavigationFlowCoordinator` would already implement the `RemoveAction` protocol requirements and all you have to do it pass in `self` as an argument using an initializer or you can do property injection.
 
### Communication
Communication between Coordinators is a 1:1 Parent -> Child relationship. There are two ways to handle this communication namely; Delegation and Closures. Personally, I prefer to handle communication with Closures because they tend to be simpler to introduce and reduce tight coupling between Parent -> Child.

In this example, the ViewControllerACoordinator holds a reference to ViewControllerA which has a closure being called everytime the button in ViewControllerA was tapped. ``` didTapButton: (() -> Void)? ``` In response to receiving the event, the Coordinator will spin-up ViewControllerBCoordinator and call ``` start() ``` to make the transition to ViewControllerB

```swift

class ViewControllerACoordinator: ChildCoordinator<ViewControllerA> {
    
    override func start() {
        viewController = ViewControllerA()
        navigate(to: viewController, with: .push, animated: true)
        
        viewController.didTapButton = { [startViewCoordinatorB] in
            startViewCoordinatorB()
        }
    }
    
    private func startViewCoordinatorB() {
        let child = ViewControllerBCoordinator(presenter: presenter)
        add(child: child)
        child.start()
    } 
    
}

```

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding Coordinator as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kaunamohammed/Coordinator.git")
]
```

## Author

kaunamohammed, kaunamohammed@gmail.com

## License

CoordinatorLibrary is available under the MIT license. See the LICENSE file for more info.
=======
# CoordinatorLibrary

## Where to go from here

Coordinators, can be hard to grasp initially, but it is a surprisingly simple and extensible architecture when you cross that initial step of starting. There's some great articles on the web that I recommend reading to flesh out your understanding of how coordinators work.
- [The Coordinator](http://khanlou.com/2015/01/the-coordinator/)
- [Coordinator Redux](http://khanlou.com/2015/10/coordinators-redux/)
- [An iOS Coordinator Pattern](https://will.townsend.io/2016/an-ios-coordinator-pattern)

Additionally there's a [fantastic video from NSSpain](https://vimeo.com/144116310) where the guy behind the recent push for coordinators, Soroush Khanlou, talks about how he uses them in his application.

## Contributing

Have an issue? Open an issue! Have an idea? Open a pull request!

If you like the library, please :star: it!

Cheers mate :beers:
