//
//  AbstractCoordinator.swift
//

import Foundation

open class AbstractCoordinator: NSObject {

    private(set) var modulesInStack: Int = 0
    
    var isModulesStackEmpty: Bool {
        return modulesInStack == 0
    }
    
    var navigator: Navigating

    init(navigator: Navigating) {
        self.navigator = navigator
    }
    
    var childCoordinators: [AnyObject] = []

    open func isCanBeSwiped() -> Bool {
        return true
    }

    func start() {}
    
    func push(_ module: Presentable, animated: Bool) {
        modulesInStack += 1
        navigator.push(module, animated: animated)
    }

    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?) {
        modulesInStack += 1
        navigator.push(module, animated: animated, completion: completion)
    }

    func popModule(animated: Bool) {
        modulesInStack -= 1
        navigator.popModule(animated: animated)
    }

    func popModule(animated: Bool, completion: (() -> Void)?) {
        modulesInStack -= 1
        navigator.popModule(animated: animated, completion: completion)
    }

    func popAllModules(animated: Bool) {
        navigator.unwind(count: modulesInStack, offset: 0, animated: animated)
        modulesInStack = 0
    }
    
    // add only unique object
    func addDependency(_ coordinator: AnyObject) {
        for element in childCoordinators {
            if element === coordinator {
                return
            }
        }
        childCoordinators.append(coordinator)
    }

    func popDependency() {
        removeDependency(childCoordinators.last)
    }

    func removeDependency(_ coordinator: AnyObject?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
