//
//  UIView+LoadFromNib.swift
//  Copyright © 2019 RentaTeam. All rights reserved.
//

import UIKit

public extension UIView {
    
    static func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
