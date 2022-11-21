//
//  UIColor+Additions.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/18.
//

import UIKit

extension UIColor {
  
  // MARK: - System Color
  class var white: UIColor {
    return UIColor(white: 1.0, alpha: 1.0)
  }
  
  class var black: UIColor {
    return UIColor(white: 0.0, alpha: 1.0)
  }
  
  class var black05: UIColor {
    return UIColor(white: 0.0, alpha: 0.05)
  }
  
  class var black10: UIColor {
    return UIColor(white: 0.0, alpha: 0.1)
  }
  
  class var black15: UIColor {
    return UIColor(white: 0.0, alpha: 0.15)
  }
  
  class var black30: UIColor {
    return UIColor(white: 0.0, alpha: 0.3)
  }
  
  class var black50: UIColor {
    return UIColor(white: 0.0, alpha: 0.5)
  }
  
  public class var paleGrey: UIColor {
    return UIColor(red: 246.0 / 255.0, green: 246.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
  }

  public class var paleSkyBlue: UIColor {
    return UIColor(red: 195.0 / 255.0, green: 225.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
  }

  public class var iceBlue: UIColor {
    return UIColor(red: 235.0 / 255.0, green: 245.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
  }

  public class var pumpkinOrange: UIColor {
    return UIColor(red: 1.0, green: 130.0 / 255.0, blue: 0.0, alpha: 1.0)
  }

  public class var clearBlue: UIColor {
    return UIColor(red: 30.0 / 255.0, green: 150.0 / 255.0, blue: 1.0, alpha: 1.0)
  }

  public class var orangeyRed: UIColor {
    return UIColor(red: 1.0, green: 59.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
  }
  
  // MARK: - Component Color
  public class var tangerine: UIColor {
    return UIColor(red: 1.0, green: 150.0 / 255.0, blue: 0.0, alpha: 1.0)
  }

  public class var rosyPink: UIColor {
    return UIColor(red: 1.0, green: 100.0 / 255.0, blue: 135.0 / 255.0, alpha: 1.0)
  }

  public class var cornflower: UIColor {
    return UIColor(red: 110.0 / 255.0, green: 110.0 / 255.0, blue: 1.0, alpha: 1.0)
  }

  public class var turquoiseGreen: UIColor {
    return UIColor(red: 0.0, green: 225.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
  }

  public class var azure: UIColor {
    return UIColor(red: 39.0 / 255.0, green: 179.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
  }
  
}
