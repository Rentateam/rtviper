//
//  Coordinatable.swift
//

import Foundation

protocol Coordinatable: class {
    associatedtype DeepLink
    associatedtype Output

    var output: Output? {get set}
    func start(with option: DeepLink, animated: Bool)
    func start(with option: DeepLink, animated: Bool, completion: (() -> Void)?)
}

extension Coordinatable {
    func start(with option: DeepLink, animated: Bool) {
        start(with: option, animated: animated, completion: nil)
    }
}
