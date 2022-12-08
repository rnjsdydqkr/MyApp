//
//  SLStyle.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/18.
//

import UIKit

public typealias SKFont = SLStyle.SKFont

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
    case buttonBackgroundClearBlueColor, buttonBackgroundClearBlueAlphaColor
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
      return .clearBlue
    case .buttonBackgroundClearBlueAlphaColor:
      return .clearBlue.withAlphaComponent(0.5)
    }
  }
}

extension SLStyle {
  // MARK: - FontStyles
  public enum FontWeight {
    case regular, medium, semiBold, bold
  }
  
  public struct SKFont {
    public var font: UIFont
    var lineHeight: CGFloat
    var letterSpacing: CGFloat
    
    init(_ font: UIFont, lineHeight: CGFloat, letterSpacing: CGFloat = 0) {
      self.font = font
      self.lineHeight = lineHeight
      self.letterSpacing = letterSpacing
    }
  }
  
  private func fontWeight(_ fontStyle: FontWeight) -> UIFont.Weight {
    switch fontStyle {
    case .regular:
      return .regular
    case .medium:
      return .medium
    case .semiBold:
      return .semibold
    case .bold:
      return .bold
    }
  }
  
  public func title() -> SKFont {
    switch fontSet {
    case .regular:
      return SKFont(UIFont.font(size: 26, style: .semibold), lineHeight: 35, letterSpacing: -20.0)
    case .medium:
      return SKFont(UIFont.font(size: 30, style: .semibold), lineHeight: 40, letterSpacing: -20.0)
    case .large:
      return SKFont(UIFont.font(size: 34, style: .semibold), lineHeight: 45, letterSpacing: -20.0)
    }
  }
  
  public func body(style: FontWeight) -> SKFont {
    let fontStyle = fontWeight(style)
    switch fontSet {
    case .regular:
      return SKFont(UIFont.font(size: 17, style: fontStyle), lineHeight: 24)
    case .medium:
      return SKFont(UIFont.font(size: 22, style: fontStyle), lineHeight: 30)
    case .large:
      return SKFont(UIFont.font(size: 26, style: fontStyle), lineHeight: 35, letterSpacing: -20.0)
    }
  }

  public func subBody(style: FontWeight) -> SKFont {
    let fontStyle = fontWeight(style)
    switch fontSet {
    case .regular:
      return SKFont(UIFont.font(size: 15, style: fontStyle), lineHeight: 22)
    case .medium:
      return SKFont(UIFont.font(size: 17, style: fontStyle), lineHeight: 24)
    case .large:
      return SKFont(UIFont.font(size: 20, style: fontStyle), lineHeight: 28)
    }
  }

  /// navigationBar
  public func navigationBar() -> SKFont {
    switch fontSet {
    case .regular:
      return SKFont(UIFont.font(size: 20, style: .semibold), lineHeight: 28)
    case .medium:
      return SKFont(UIFont.font(size: 22, style: .semibold), lineHeight: 30)
    case .large:
      return SKFont(UIFont.font(size: 24, style: .semibold), lineHeight: 32)
    }
  }
  
  /// buttonLabel
  public func buttonLabel() -> SKFont {
    switch fontSet {
    case .regular:
      return SKFont(UIFont.font(size: 17, style: .semibold), lineHeight: 24)
    case .medium:
      return SKFont(UIFont.font(size: 20, style: .semibold), lineHeight: 28)
    case .large:
      return SKFont(UIFont.font(size: 22, style: .semibold), lineHeight: 30)
    }
  }

  /// notifcation
  public func notification() -> SKFont {
    switch fontSet {
    case .regular:
      return SKFont(UIFont.font(size: 15, style: .semibold), lineHeight: 22)
    case .medium:
      return SKFont(UIFont.font(size: 17, style: .semibold), lineHeight: 24)
    case .large:
      return SKFont(UIFont.font(size: 20, style: .semibold), lineHeight: 28)
    }
  }
  
}
