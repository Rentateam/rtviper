//
//  CustomNavigationController.swift
//

import UIKit

final public class CustomNavigationController: UINavigationController {
    
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
