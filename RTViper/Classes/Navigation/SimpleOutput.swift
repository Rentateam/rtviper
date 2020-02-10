//
//  SimpleOutput.swift
//

import Foundation

public struct SimpleOutput {
    var onFinish: (() -> Void)?
    
    public init(onFinish: (() -> Void)?) {
        self.onFinish = onFinish
    }
}
