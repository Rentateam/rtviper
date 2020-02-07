//
//  CustomNavigationController.swift
//

import UIKit

final class CustomNavigationController: UINavigationController {
    
    func clearNavigationStack() {
        setViewControllers([], animated: false)
    }
    
    // Nav stack with custom completion block
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func popViewController(animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
}
