//
//  AnyCoordinatable.swift
//

import Foundation

final public class AnyCoordinatable<DeepLink, Output>: Coordinatable {
    private let setOutputClosure: (Output?) -> Void
    private let getOutputClosure: () -> Output?
    private let startClosure: (DeepLink, Bool, (() -> Void)?) -> Void

    public init<T: Coordinatable>(_ coordionator: T) where T.DeepLink == DeepLink, T.Output == Output {
        startClosure = { (deepLink, animated, completion) in
            coordionator.start(with: deepLink, animated: animated, completion: completion)
        }

        getOutputClosure = { () -> Output? in
            return coordionator.output
        }

        setOutputClosure = { output in
            coordionator.output = output
        }
    }

    public func start(with deepLink: DeepLink, animated: Bool, completion: (() -> Void)?) {
        startClosure(deepLink, animated, completion)
    }

    public var output: Output? {
        get {
            return getOutputClosure()
        }

        set {
            setOutputClosure(newValue)
        }
    }
}
