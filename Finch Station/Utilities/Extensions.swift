//
//  Extensions.swift
//  Finch Station
//
//  Created by Jeniean on 07/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import Foundation
import UIKit

// MARK: - NSMutableAttributedString
extension NSMutableAttributedString {
    @discardableResult func customTextWithColor(text: String, size: CGFloat = 14.0, fontName:String, _ color:UIColor = UIColor.black) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: size)!, .foregroundColor:color]
        let string = NSMutableAttributedString(string:text, attributes: attrs)
        append(string)
        return self
    }
}

// MARK: - String
extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}

// MARK: - UIView
extension UIView {

    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(self)
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
}
