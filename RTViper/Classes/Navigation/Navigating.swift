//
//  Navigating.swift
//

import UIKit

public protocol Navigating: Presentable {
    var delegate: NavigatorDelegate? { get set }
    
    var isPresenting: Bool { get }
    
    func present(_ module: Presentable, animated: Bool)
    
    func presentModally(_ module: Presentable, animated: Bool,
                        presentationStyle: UIModalPresentationStyle,
                        transitionStyle: UIModalTransitionStyle?,
                        completion: (() -> Void)?)
    func presentModally(_ module: Presentable, animated: Bool,
                        presentationStyle: UIModalPresentationStyle,
                        transitionStyle: UIModalTransitionStyle?,
                        shouldPreventDismissGesture: Bool,
                        completion: (() -> Void)?)
    
    func presentCustomModally(_ module: Presentable, animated: Bool)

    func isCanBePresentedModallyAtTop() -> Bool
    func presentModallyAtTop(_ module: Presentable, animated: Bool,
                             presentationStyle: UIModalPresentationStyle,
                             transitionStyle: UIModalTransitionStyle?)
    func presentModallyAtTop(_ module: Presentable, animated: Bool,
                             presentationStyle: UIModalPresentationStyle,
                             transitionStyle: UIModalTransitionStyle?,
                             shouldPreventDismissGesture: Bool)
    
    func presentAtTop(_ module: Presentable, presentationStyle: UIModalPresentationStyle?, animated: Bool)
    func presentAtTop(_ module: Presentable, presentationStyle: UIModalPresentationStyle?, animated: Bool, shouldPreventDismissGesture: Bool)
    
    func push(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    
    func popModule(animated: Bool)
    func popModule(animated: Bool, completion: (() -> Void)?)
    
    func dismissModule(animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func dismissModuleAtTop(animated: Bool)
    func dismissModuleAtTop(animated: Bool, completion: (() -> Void)?)
    
    func popToRootModule(animated: Bool)

    func unwind(count: Int, offset: Int, animated: Bool)
    func unwind(to module: Presentable, animated: Bool)
    
    func clearNavigationStack()

    func currentPresentable() -> Presentable?
}

extension Navigating {
    func presentModallyOverCurrent(_ module: Presentable, animated: Bool) {
        presentModally(module, animated: animated,
                       presentationStyle: .overCurrentContext,
                       transitionStyle: .crossDissolve,
                       completion: nil)
    }
    
    public func presentModally(_ module: Presentable, animated: Bool,
                        presentationStyle: UIModalPresentationStyle,
                        transitionStyle: UIModalTransitionStyle?,
                        completion: (() -> Void)?) {
        presentModally(module,
                       animated: animated,
                       presentationStyle: presentationStyle,
                       transitionStyle: transitionStyle,
                       shouldPreventDismissGesture: true,
                       completion: completion)
    }
    
    public func presentModallyAtTop(_ module: Presentable, animated: Bool,
                                    presentationStyle: UIModalPresentationStyle,
                                    transitionStyle: UIModalTransitionStyle?) {
        presentModallyAtTop(module,
                            animated: animated,
                            presentationStyle: presentationStyle,
                            transitionStyle: transitionStyle,
                            shouldPreventDismissGesture: true)
    }
    
    public func presentAtTop(_ module: Presentable, presentationStyle: UIModalPresentationStyle?, animated: Bool) {
        presentAtTop(module,
                     presentationStyle: presentationStyle,
                     animated: animated,
                     shouldPreventDismissGesture: true)
    }
}
