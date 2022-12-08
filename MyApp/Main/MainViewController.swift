//
//  MainViewController.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class MainViewController: SLViewController {
  
  @IBOutlet private var topLabel: SLLabel!
  @IBOutlet private var startLabel: SLLabel!
  @IBOutlet private var firstButton: SLButton!
  @IBOutlet private var secondButton: SLButton!
  @IBOutlet private var thirdButton: SLButton!
  
  let viewModel = MainViewModel()
  
  override func setupObserver() {
    addKeyValueObserverList([
      viewModel.output.observe(\.errorMessage) { [weak self] output, _ in
        
      },
      viewModel.output.observe(\.needLoading) { [weak self] output, _ in
        
      },
      viewModel.output.observe(\.startString) { [weak self] output, _ in
        self?.startLabel.text = output.startString
      }
    ])
    debugPrint("[MainViewController] setupObserver")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    debugPrint("[MainViewController] viewDidLoad")
  }
  
  override func setupViewStyle() {
    debugPrint("[MainViewController] setupViewStyle")
    
    topLabel.skFont = SLStyle.shared.body(style: .regular)
//    topLabel.text = I18N.common_confirm_button
//    topLabel.change(targetString: "확", font: SLStyle.shared.title())
//    topLabel.change(targetString: "인", color: .clearBlue)
//    topLabel.font = topLabel.customFontStyle(style: FontStyle.JetBrainsMonoMedium.name)
    
    // Button Test
    firstButton.title = "firstButtonOOO"
    firstButton.title = "확인"
    firstButton.style = .switchButton
    firstButton.isSelected = true
//    firstButton.isSelected = true
    secondButton.title = "secondButtonOOO"
    secondButton.contentEdgeInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
//    secondButton.tintColor = .clear
//    secondButton.titleLabel?.tintColor = .clear
    let color = SLStyle.shared.color(type: .textOrange)
    secondButton.backgroundColor = color
    secondButton.titleLabel?.font = SLStyle.shared.buttonLabel().font
    secondButton.setTitleColor(.black, for: .normal)
//    secondButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
    thirdButton.title = "thirdButtonOOO"
    thirdButton.style = .largeLineButton
//    thirdButton.isSelected = true
    
//    secondButton.tintColor = .orangeyRed
//    thirdButton.titleLabel?.tintColor = .rosyPink
//    secondButton.imageView?.alpha = 1
//    secondButton.imageView?.image = UIImage(named: "splash")
    
//    firstButton.contentEdgeInsets = UIEdgeInsets(top: 100, left: 100, bottom: 50, right: 50)
    
    
//    firstButton.layer.layoutIfNeeded()
    
//    guard let underlineLayer = secondButton.layer.sublayers?.filter({ $0.name == "underline" }) else { return }
//    for layer in underlineLayer {
//      layer.removeFromSuperlayer()
//    }
//    let borderColor: CGColor = UIColor.rosyPink.cgColor
//    let borderWidth: CGFloat = 2.0
//    let border = CALayer()
//    border.name = "underline"
//    border.borderColor = borderColor
//    border.frame = CGRect(x: 0, y: view.frame.size.height-borderWidth,
//                          width: view.frame.size.width, height: view.frame.size.height)
//    border.borderWidth = borderWidth
//    secondButton.layer.addSublayer(border)
//    secondButton.layer.masksToBounds = true
    
    // =====================================
    
//    secondButton.backgroundColor = .clear
//    secondButton.setTitleColor(.clear, for: .normal)
//    secondButton.setTitle("", for: .normal)
//    secondButton.setImage(UIImage(named: "no_selected"), for: .normal)
//    secondButton.setImage(UIImage(named: "selected"), for: .selected)
//    secondButton.isSelected = true
    
//    secondButton.configuration = .plain()
//    NSLayoutConstraint.activate([
//      secondButton.widthAnchor.constraint(equalToConstant: 44),
//      secondButton.heightAnchor.constraint(equalToConstant: 44)
//    ])
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    debugPrint("[MainViewController] viewWillAppear")
    
  }
  
  @IBAction func didPressed(button: UIButton) {
    switch button {
    case firstButton:
      viewModel.output.startString = "[PROD] requestPopularMovieInfo API 호출]"
      viewModel.requestPopularMovieInfo()
    case secondButton:
      viewModel.output.startString = "start Label\nstart Label\nstart Label"
    case thirdButton:
      viewModel.output.startString = "[DEV, TEST] requestMainList API 호출"
      viewModel.requestMainList()
    default:
      debugPrint("[MainViewController] didPressed default")
    }
  }

}
