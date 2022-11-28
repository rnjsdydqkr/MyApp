//
//  SLLabel.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/22.
//

import UIKit

public class SLLabel: UILabel {
  private var _skFont: SKFont = SLStyle.shared.body(style: .regular)
  
  private var lineHeight: CGFloat = 0
  private var letterSpacing: CGFloat = 0
  
  public var skFont: SKFont {
    get {
      return _skFont
    }
    set {
      _skFont = newValue
      font = newValue.font
      lineHeight = newValue.lineHeight
      letterSpacing = newValue.letterSpacing
      updateParagraphStyle()
      
    }
  }
  override public var text: String? {
    get {
      return super.text
    }
    set {
      super.text = newValue
      updateParagraphStyle()
    }
  }
  
  private func updateParagraphStyle() {
    let attributedString = NSMutableAttributedString(string: text ?? "")

    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.maximumLineHeight = lineHeight
    paragraphStyle.minimumLineHeight = lineHeight
    paragraphStyle.lineHeightMultiple = 0
    paragraphStyle.alignment = textAlignment
    paragraphStyle.lineSpacing = 0

    attributedString.addAttributes([.paragraphStyle: paragraphStyle,
                                    .kern: letterSpacing/100.0],
                                   range: NSRange(location: 0, length: attributedString.length))
    attributedText = attributedString
  }
  
  // MARK: - change color string
  open func change(targetString: String, color: UIColor) {
    guard !targetString.isEmpty else {
      return
    }

    let attributedString = attributedText == nil ? NSMutableAttributedString(string: text ?? "") : NSMutableAttributedString(attributedString: attributedText!)

    let range = attributedString.mutableString.range(of: targetString,
                                                     options: .caseInsensitive)

    if range.location != NSNotFound {
      attributedString.addAttributes([.foregroundColor: color],
                                     range: range)
    }
    attributedText = attributedString
  }

  public func change(targetString: String, font: SKFont) {
    guard !targetString.isEmpty else {
      return
    }

    let attributedString = attributedText == nil ? NSMutableAttributedString(string: text ?? "") : NSMutableAttributedString(attributedString: attributedText!)

    let range = attributedString.mutableString.range(of: targetString,
                                                     options: .caseInsensitive)

    if range.location != NSNotFound {
      attributedString.addAttributes([.font: font.font],
                                     range: range)
    }
    attributedText = attributedString
  }
  
  /// FontStyle
  public func customFontStyle(style: String, size: CGFloat = 17) -> UIFont {
    return UIFont(name: style, size: size) ?? UIFont.font(size: 17, style: .regular)
  }
  
}
