//
//  UIFont+Additions.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/18.
//

import UIKit

extension UIFont {
  class func font(size: CGFloat, style: UIFont.Weight) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: style)
  }
}
