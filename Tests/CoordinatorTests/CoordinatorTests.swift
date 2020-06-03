import XCTest
@testable import Coordinator

final class CoordinatorTests: XCTestCase {
    
    class CoordinatorA: BaseChildCoordinator<UIViewController, NoRoute> {}
    
    func testChildCoordinatorAdded() {
        let coordinatorA = CoordinatorA()
        let coordinatorB = CoordinatorA()
        coordinatorA.add(coordinatorB)

        XCTAssertTrue(!coordinatorA.children.isEmpty)
    }
    
    func testChildKeyAutomaticAssigning() {
        let coordinatorA = CoordinatorA()

        XCTAssertTrue(coordinatorA.key == "CoordinatorA")
    }

    func testOnlyOneInstanceOfChildCoordinator() {
        let coordinatorA = CoordinatorA()
        let coordinatorB = CoordinatorA()
        coordinatorA.add(coordinatorB)
        coordinatorA.add(coordinatorB)
        coordinatorA.add(coordinatorB)
        
        XCTAssertTrue(coordinatorA.children.values.count == 1)
    }
    
    func testChildCordinatorRemoved() {
        let coordinatorA = CoordinatorA()
        let coordinatorB = CoordinatorA()
        coordinatorA.add(coordinatorB)
        coordinatorA.remove(coordinatorB)
        
        XCTAssertTrue(coordinatorA.children.isEmpty)
    }
    
    func testRemoveAllChildCoordinators() {
        let coordinatorA = CoordinatorA()
        let children = [CoordinatorA(), CoordinatorA(), CoordinatorA()]
        children.forEach { coordinatorA.add($0) }
        coordinatorA.removeAll()
        
        XCTAssertTrue(coordinatorA.children.isEmpty)
    }
}
