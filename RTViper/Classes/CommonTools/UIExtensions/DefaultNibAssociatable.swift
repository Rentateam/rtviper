//
//  DefaultNibAssociatable.swift
//  Copyright © 2019 RentaTeam. All rights reserved.
//

import UIKit

public protocol DefaultNibAssociatable: AnyObject {
    static var defaultNibName: String { get }
}

public extension DefaultNibAssociatable where Self: UIView {
    static var defaultNibName: String {
        guard let name = NSStringFromClass(self).components(separatedBy: ".").last else {
            fatalError("Wrong nib name")
        }
        
        return name
    }
}
