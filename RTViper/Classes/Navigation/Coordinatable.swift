//
//  Coordinatable.swift
//

import Foundation

public protocol Coordinatable: AnyObject {
    associatedtype DeepLink
    associatedtype Output

    var output: Output? {get set}
    func start(with option: DeepLink, animated: Bool)
    func start(with option: DeepLink, animated: Bool, completion: (() -> Void)?)
}

public extension Coordinatable {
    func start(with option: DeepLink, animated: Bool) {
        start(with: option, animated: animated, completion: nil)
    }
}
