//
//  Presentable.swift
//

import UIKit

public protocol Presentable: AnyObject {
    func toPresent() -> UIViewController
}
