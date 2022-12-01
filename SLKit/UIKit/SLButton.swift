//
//  SLButton.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/29.
//

import UIKit

@IBDesignable open class SLButton: UIButton {
  public enum Style {
    case largeSolidButton
    case largeLineButton
    case smallSolidButton
    case smallSolidArrowButton
    case navConfirmButton
    case switchButton
    case checkButton
    case filterButton
    case none
    case text
    case filterText
  }
  
  public var title: String? {
    didSet {
      setTitle(title, for: .normal)
    }
  }
  
  public var style: Style = .none {
    didSet {
      
    }
  }
  
}
