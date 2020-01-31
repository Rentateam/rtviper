//
//  UITableView+.swift
//  Copyright © 2019 Rentateam. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerClassCell<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableTypedCell<CellType>(withIdentifier identifier: String,
                                            for indexPath: IndexPath,
                                            cellType: CellType.Type) -> CellType {
        let dequeuedCell = self.dequeueReusableCell(withIdentifier: identifier,
                                                    for: indexPath)
        
        guard let cell = dequeuedCell as? CellType else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }

        return cell
    }
    
    func register<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.defaultNibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let identifier = T.defaultReuseIdentifier
        
        let dequeuedCell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        guard let cell = dequeuedCell as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }
        
        return cell
    }

    func redraw() {
        DispatchQueue.main.async {
            UIView.setAnimationsEnabled(false)
            self.beginUpdates()
            self.endUpdates()
            UIView.setAnimationsEnabled(true)
        }
    }

    func reloadData(animated: Bool) {
        if !animated {
            UIView.setAnimationsEnabled(false)
        }

        reloadData()

        if !animated {
            UIView.setAnimationsEnabled(true)
        }
    }
}
