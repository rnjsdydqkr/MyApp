//
//  SLButton.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/29.
//

import UIKit

public class SLButton: UIButton {
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
    switch style {
    case .solidButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .largeSolidButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .lineButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = .clear
      updateBorder(width: 1, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(color, for: .normal)
    case .largeLineButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = .clear
      updateBorder(width: 1, color: color)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(color, for: .normal)
    case .solidArrowButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color, cornerRadius: 4)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .largeSolidArrowButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
      let color = SLStyle.shared.color(type: .buttonBackgroundClearBlueColor)
      backgroundColor = color
      updateBorder(width: 0, color: color, cornerRadius: 4)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.white, for: .normal)
    case .navConfirmButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.black, for: .normal)
      setTitleColor(.black.withAlphaComponent(0.5), for: .highlighted)
    case .switchButton:
      backgroundColor = .clear
      updateBorder(width: 0, color: .clear)
      setTitleColor(.clear, for: .normal)
      setTitle("", for: .normal)
      setImage(UIImage(named: "buttonswitchoff"), for: .normal)
      setImage(UIImage(named: "buttonswitchon"), for: .selected)
      NSLayoutConstraint.activate([
        widthAnchor.constraint(equalToConstant: 51),
        heightAnchor.constraint(equalToConstant: 44)
      ])
    case .checkButton:
      break
    case .filterButton:
      break
    case .clearBlueTextButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      backgroundColor = .clear
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.clearBlue, for: .normal)
      setTitleColor(.clearBlue, for: .selected)
    case .noneButton:
      tintColor = .clear
      titleLabel?.tintColor = .clear
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
