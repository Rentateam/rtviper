//
//  CustomNavigationController.swift
//

import UIKit

final public class CustomNavigationController: UINavigationController {
    
    public weak var interactivePopDelegate: InteractivePopDelegate?
    private var viewControllersCount = 0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    public func clearNavigationStack() {
        setViewControllers([], animated: false)
    }
    
    // Nav stack with custom completion block
    public func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    public func popViewController(animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
}

extension CustomNavigationController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController,
                                     willShow viewController: UIViewController,
                                     animated: Bool) {
        
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges { [weak self] context in
                if !context.isCancelled {
                    self?.interactivePopDelegate?.willFinishInteractivePop()
                }
            }
        }
    }
}
