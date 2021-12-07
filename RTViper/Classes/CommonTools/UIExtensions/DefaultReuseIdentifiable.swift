//
//  DefaultReuseIdentifiable.swift
//  Copyright © 2019 RentaTeam. All rights reserved.
//

import UIKit

public protocol DefaultReuseIdentifiable: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public extension DefaultReuseIdentifiable where Self: UIView {
    static var defaultReuseIdentifier: String {
        let identifier = String(describing: type(of: self))
        return identifier
    }
}
