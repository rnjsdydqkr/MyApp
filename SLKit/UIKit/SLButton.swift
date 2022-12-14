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
  
  public override var isEnabled: Bool {
    didSet {
      if isEnabled {
        updateStyle()
        imageView?.alpha = 1
      } else {
        backgroundColor = backgroundColor?.withAlphaComponent(0.3)
        imageView?.alpha = 0.3
      }
      layoutIfNeeded()
    }
  }
  
  public override var isHighlighted: Bool {
    didSet {
      guard imageView?.image == nil else {
        imageView?.alpha = isHighlighted ? 0.5 : 1
        return
      }
    }
  }
  
  /// button 내부 insets 적용하기 위해서는 button style default 설정 필요
  /// iOS 15.0 이하 버전에서 button image로 만들 시 button type custom 변경 필요
  /// image button만 기본 UIButton 사용 / 나머지는 style plain에서 default로 변경
  private func updateStyle() {
    tintColor = .clear
    titleLabel?.tintColor = .clear
    
    switch style {
    case .solidButton:
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
      backgroundColor = .clear
      updateBorder(width: 0, color: .clear)
      setTitleColor(.clear, for: .normal)
      setTitle("", for: .normal)
      if #available(iOS 15.0, *) {
        configurationUpdateHandler = { button in
          var config = self.configuration
          config?.image = self.isSelected ? UIImage(named: "buttonswitchon") : UIImage(named: "buttonswitchoff")
          self.configuration = config
        }
      } else {
        /// button type custom
        setImage(UIImage(named: "buttonswitchoff"), for: .normal)
        setImage(UIImage(named: "buttonswitchon"), for: .selected)
      }
      NSLayoutConstraint.activate([
        widthAnchor.constraint(equalToConstant: 51),
        heightAnchor.constraint(equalToConstant: 44)
      ])
    case .checkButton:
      backgroundColor = .clear
      updateBorder(width: 0, color: .clear)
      setTitleColor(.clear, for: .normal)
      setTitle("", for: .normal)
      if #available(iOS 15.0, *) {
        configurationUpdateHandler = { button in
          var config = self.configuration
          config?.image = self.isSelected ? UIImage(named: "buttoncheckon") : UIImage(named: "buttoncheckoff")
          self.configuration = config
        }
      } else {
        /// button type custom
        setImage(UIImage(named: "buttoncheckoff"), for: .normal)
        setImage(UIImage(named: "buttoncheckon"), for: .selected)
      }
      NSLayoutConstraint.activate([
        widthAnchor.constraint(equalToConstant: 44),
        heightAnchor.constraint(equalToConstant: 44)
      ])
    case .clearBlueTextButton:
      contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      backgroundColor = .clear
      titleLabel?.font = SLStyle.shared.buttonLabel().font
      setTitleColor(.clearBlue, for: .normal)
      setTitleColor(.clearBlue, for: .selected)
    case .noneButton:
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
