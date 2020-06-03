import XCTest
@testable import Coordinator

final class CoordinatorTests: XCTestCase {
    class CoordinatorA: BaseChildCoordinator<UIViewController> {}
    
    class CoordinatorB: Coordinator {
        func start() {
            print("MockB started")
        }
    }
    
    func testChildCoordinatorAdded() {
        let coordinatorA = CoordinatorA()
        let coordinatorB = CoordinatorB()
        coordinatorA.add(coordinator: coordinatorB, key: "coordinator_b")

        XCTAssertTrue(!coordinatorA.children.isEmpty)
    }
    
    func testChildKeyAutomaticAssigning() {
        let coordinatorA = CoordinatorA()
        let coordinatorB = CoordinatorB()
        let coordinatorC = CoordinatorB()
        let coordinatorD = CoordinatorB()
        let coordinatorE = CoordinatorB()
        let coordinatorF = CoordinatorB()

        coordinatorA.add(coordinator: coordinatorB)
        coordinatorA.add(coordinator: coordinatorC)
        coordinatorA.add(coordinator: coordinatorD)
        coordinatorA.add(coordinator: coordinatorE)
        coordinatorA.add(coordinator: coordinatorF)

        XCTAssertTrue(coordinatorA.children["4"]! === coordinatorF)
    }

    func testOnlyOneInstanceOfChildCoordinator() {
        let coordinatorA = CoordinatorA()
        let coordinatorB = CoordinatorB()
        coordinatorA.add(coordinator: coordinatorB, key: "coordinator_b")
        coordinatorA.add(coordinator: coordinatorB, key: "coordinator_b")
        coordinatorA.add(coordinator: coordinatorB, key: "coordinator_b")
        
        XCTAssertTrue(coordinatorA.children.values.count == 1)
    }
    
    func testChildCordinatorRemoved() {
        let coordinatorA = CoordinatorA()
        let coordinatorB = CoordinatorB()
        coordinatorA.add(coordinator: coordinatorB, key: "coordinatorB")
        coordinatorA.remove(coordinator: coordinatorB)
        
        XCTAssertTrue(coordinatorA.children.isEmpty)
    }
    
    func testRemoveAllChildCoordinators() {
        let coordinatorA = CoordinatorA()
        let children = ["child1": CoordinatorB(), "child2": CoordinatorB(), "child3": CoordinatorB()]
        children.forEach { coordinatorA.add(coordinator: $0.value, key: $0.key) }
        coordinatorA.removeAll()
        
        XCTAssertTrue(coordinatorA.children.isEmpty)
    }
}
