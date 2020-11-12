//
//  AbstractCoordinator.swift
//

import Foundation

open class AbstractCoordinator: NSObject, NavigatorDelegate {

    private(set) var modulesInStack: Int = 0
    
    public var isModulesStackEmpty: Bool {
        return modulesInStack == 0
    }
    
    public var navigator: Navigating

    public init(navigator: Navigating) {
        self.navigator = navigator
    }
    
    public var childCoordinators: [AnyObject] = []

    open func isCanBeSwiped() -> Bool {
        return true
    }

    public func start() {}
    
    public func push(_ module: Presentable, animated: Bool) {
        modulesInStack += 1
        navigator.push(module, animated: animated)
    }

    public func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?) {
        modulesInStack += 1
        navigator.push(module, animated: animated, completion: completion)
    }

    public func popModule(animated: Bool) {
        modulesInStack -= 1
        navigator.popModule(animated: animated)
    }

    public func popModule(animated: Bool, completion: (() -> Void)?) {
        modulesInStack -= 1
        navigator.popModule(animated: animated, completion: completion)
    }

    public func popAllModules(animated: Bool) {
        navigator.unwind(count: modulesInStack, offset: 0, animated: animated)
        modulesInStack = 0
    }
    
    // add only unique object
    public func addDependency(_ coordinator: AnyObject) {
        for element in childCoordinators {
            if element === coordinator {
                return
            }
        }
        childCoordinators.append(coordinator)
    }

    public func popDependency() {
        removeDependency(childCoordinators.last)
    }

    public func removeDependency(_ coordinator: AnyObject?) {
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
    
    open func willFinishSwipeModule() {
        modulesInStack -= 1
    }
    
    public func presentAtTop(_ controller: UIViewController, presentationStyle: UIModalPresentationStyle?, animated: Bool = true) {
        navigator.presentAtTop(controller, presentationStyle: presentationStyle, animated: true)
    }
    
    public func dismissModuleAtTop() {
        navigator.dismissModuleAtTop(animated: true)
    }
}
