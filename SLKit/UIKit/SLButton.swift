//
//  SLButton.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/29.
//

import UIKit

@IBDesignable open class SLButton: UIButton {
  public enum Style {
    case solidButton
    case largeSolidButton
    case lineButton
    case largeLineButton
    case solidArrowButton
    case largeSolidArrowButton
    case navConfirmButton
    case switchButton
    case checkButton
    case filterButton
    case clearBlueTextButton
    case noneButton
  }
  
  public var title: String? {
    didSet {
      setTitle(title, for: .normal)
    }
  }
  
  public var style: Style = .noneButton { didSet { updateStyle() } }
  
  public required init(style: Style) {
    super.init(frame: .zero)
    
    self.style = style
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    
    self.style = .noneButton
  }
  
  public override var isSelected: Bool {
    didSet {
      updateStyle()
    }
  }
  
  private func updateStyle() {
    tintColor = .clear
    titleLabel?.tintColor = .clear
    if imageView?.image == nil {
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    switch style {
    case .solidButton:
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .largeSolidButton:
      contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .lineButton:
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = .clear
      updateBorder(width: 1, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(color, for: .normal)
    case .largeLineButton:
      contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = .clear
      updateBorder(width: 1, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(color, for: .normal)
    case .solidArrowButton:
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color, cornerRadius: 4)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .largeSolidArrowButton:
      contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color, cornerRadius: 4)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .navConfirmButton:
      contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.black, for: .normal)
      setTitleColor(.black.withAlphaComponent(0.5), for: .highlighted)
    case .switchButton:
//      backgroundColor = .clear
//      updateBorder(width: 0, color: .clear)
//      setTitleColor(.clear, for: .normal)
//      setTitle("", for: .normal)
//      setImage(UIImage(named: "buttonswitchoff"), for: .normal)
//      setImage(UIImage(named: "buttonswitchon"), for: .selected)
//      NSLayoutConstraint.activate([
//        widthAnchor.constraint(equalToConstant: 51),
//        heightAnchor.constraint(equalToConstant: 44)
//      ])
      break
    case .checkButton:
      break
    case .filterButton:
      break
    case .clearBlueTextButton:
      backgroundColor = .clear
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.clearBlue, for: .normal)
      setTitleColor(.clearBlue, for: .selected)
    case .noneButton:
      backgroundColor = .clear
      updateBorder(width: 0, color: .clear)
      setTitleColor(.clear, for: .normal)
      setTitle("", for: .normal)
    }
  }
  
  private func updateBorder(width: CGFloat, color: UIColor, cornerRadius: CGFloat = 8.0) {
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    layer.cornerRadius = cornerRadius
    layer.masksToBounds = true
  }
  
}
