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
  @IBOutlet private var firstButton: UIButton!
  @IBOutlet private var secondButton: UIButton!
  @IBOutlet private var thirdButton: UIButton!
  
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
    topLabel.font = topLabel.customFontStyle(style: FontStyle.JetBrainsMonoMedium.name)
    
    // Label Style Test
//    startLabel.textColor = .turquoiseGreen
//    startLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
//    startLabel.font = UIFont(name: FontStyle.JetBrainsMonoRegular.name, size: 20)
    
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
