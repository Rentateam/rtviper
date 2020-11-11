//
//  UICollectionView+.swift
//  Copyright © 2019 RentaTeam. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.defaultNibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerClass<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableTypedCell<CellType>(withIdentifier identifier: String,
                                            for indexPath: IndexPath,
                                            cellType: CellType.Type) -> CellType {
        let dequeuedCell = self.dequeueReusableCell(withReuseIdentifier: identifier,
                                                    for: indexPath)
        
        guard let cell = dequeuedCell as? CellType else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }
        
        return cell
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let identifier = T.defaultReuseIdentifier
        
        let dequeuedCell = dequeueReusableCell(withReuseIdentifier: identifier,
                                               for: indexPath)
        
        guard let cell = dequeuedCell as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }
        
        return cell
    }
}
