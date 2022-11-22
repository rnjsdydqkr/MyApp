//
//  SLStyle.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/18.
//

import UIKit

public class SLStyle {
  public static let shared: SLStyle = SLStyle()
  public var fontSet: FontSet = .regular
  
  public enum FontSet {
    case regular, medium, large
    
    public init(size: Int) {
      switch size {
      case 0:
        self = .regular
      case 1:
        self = .medium
      case 2:
        self = .large
      default:
        self = .regular
      }
    }
  
  }
}

extension SLStyle {
  // MARK: - Colors
  public enum ComponentType {
    case text, textWhite, textRed, textBlue, textOrange
    case buttonBackgroundClearBlueColor
  }
  
  public func color(type: ComponentType) -> UIColor {
    switch type {
    // text
    case .text:
      return .black
    case .textWhite:
      return .white
    case .textRed:
      return .orangeyRed
    case .textBlue:
      return .clearBlue
    case .textOrange:
      return .pumpkinOrange
    // button
    case .buttonBackgroundClearBlueColor:
      return .clearBlue.withAlphaComponent(0.5)
    }
  }
}

extension SLStyle {
  
}
