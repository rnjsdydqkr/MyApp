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
  @IBOutlet private var zeroButton: SLButton!
  @IBOutlet private var firstButton: SLButton!
  @IBOutlet private var secondButton: SLButton!
  @IBOutlet private var thirdButton: SLButton!
  
//  var userInfoModel = UserInfo(name: "김김김", status: "시도")
  
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
    topLabel.text = I18N.common_confirm_button
    topLabel.skFont.font = topLabel.customFontStyle(style: FontStyle.JetBrainsMonoMedium.name)
    topLabel.change(targetString: "확", font: SLStyle.shared.title())
    topLabel.change(targetString: "인", color: .clearBlue)
    
    // Button Test
    // =================================
    // zeroButton
    // =================================
    zeroButton.title = "zeroButtonOOO"
    zeroButton.style = .solidButton
    // =================================
    // firstButton
    // =================================
    firstButton.style = .switchButton
    // =================================
    // secondButton
    // =================================
    secondButton.title = "secondButtonOOO"
    secondButton.style = .largeSolidButton
    // =================================
    // thirdButton
    // =================================
    thirdButton.title = "thirdButtonOOO"
    thirdButton.style = .largeLineButton
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    debugPrint("[MainViewController] viewWillAppear")
    
    viewModel.addSystemEventHandler()
    viewModel.requestStartService()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    debugPrint("[MainViewController] viewDidDisappear")
    viewModel.requestStopService()
  }
  
  @IBAction func didPressed(button: UIButton) {
    switch button {
    case zeroButton:
      zeroButton.isSelected = !zeroButton.isSelected
      viewModel.output.startString = "zeroButton Click!!: \(zeroButton.isSelected)"
      
//      SLUserDefaults.standard.systemNo = 852741
//      SLUserDefaults.standard.systemNo = nil
//      SLRealm.standard.createObject(object: userInfoModel)
    case firstButton:
      firstButton.isSelected = !firstButton.isSelected
      if firstButton.isSelected {
        viewModel.output.startString = "[PROD] requestPopularMovieInfo API 호출]"
        viewModel.requestPopularMovieInfo()
      } else {
        viewModel.output.startString = "firstButton Click!!: \(firstButton.isSelected)"
      }
      
//      SLRealm.standard.loadObject(object: userInfoModel, sortName: userInfoModel.name, ascending: true)
    case secondButton:
      viewModel.output.startString = "start Label\nstart Label\nstart Label"
//      zeroButton.isEnabled = true
//      firstButton.isHighlighted = true
      
      viewModel.requestStartSystem()
      
//      SLRealm.standard.retrieveObject(object: userInfoModel)
      
    case thirdButton:
      viewModel.output.startString = "[DEV, TEST] requestMainList API 호출"
      viewModel.requestMainList()
//      zeroButton.isEnabled = false
//      firstButton.isHighlighted = false
//      SLRealm.standard.deleteObject(object: userInfoModel)
    default:
      debugPrint("[MainViewController] didPressed default")
    }
  }

}
