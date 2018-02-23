//
//  UITableView+Compatible.swift
//  JoUIKit
//
//  Created by Django Lee on 08/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

extension JoUIKit where Base: UITableView {
    
    public func dequeueReusableCell(_ cellClass: UITableViewCell.Type) -> UITableViewCell? {
        return base.dequeueReusableCell(withIdentifier: NSStringFromClass(cellClass))
    }
    
    public func dequeueReusableCell(_ cellClass: UITableViewCell.Type, for indexPath: IndexPath) -> UITableViewCell {
        return base.dequeueReusableCell(withIdentifier: NSStringFromClass(cellClass), for: indexPath)
    }
    
    public func dequeueReusableHeaderFooterView(aClass: UITableViewHeaderFooterView.Type) -> UITableViewHeaderFooterView?  {
        return base.dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(aClass))
    }
    
    public func register(cell cellClass: UITableViewCell.Type) {
        base.register(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }

    public func register(headerFooter aClass: UITableViewHeaderFooterView.Type) {
        base.register(aClass, forHeaderFooterViewReuseIdentifier: NSStringFromClass(aClass))
    }
}
