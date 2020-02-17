//
//  SimpleOutput.swift
//

import Foundation

public struct SimpleOutput {
    public var onFinish: (() -> Void)?
    
    public init(onFinish: (() -> Void)?) {
        self.onFinish = onFinish
    }
}
