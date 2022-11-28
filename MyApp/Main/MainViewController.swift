//
//  MainViewController.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class MainViewController: SLViewController {
  
  @IBOutlet private var topLabel: UILabel!
  @IBOutlet private var startLabel: UILabel!
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
//      updateParagraphStyle(text: "top Label\ntop Label\ntop Label")
//      self.topLabel.textColor = SLStyle.shared.color(type: .buttonBackgroundColor)
    case thirdButton:
      viewModel.output.startString = "[DEV, TEST] requestMainList API 호출"
      viewModel.requestMainList()
    default:
      debugPrint("[MainViewController] didPressed default")
    }
  }
  
//  private func updateParagraphStyle(text: String) {
//    let attributedString = NSMutableAttributedString(string: text)
//    let lineHeight = 30
//    let letterSpacing = 2000.0
//
//    let paragraphStyle = NSMutableParagraphStyle()
//    paragraphStyle.maximumLineHeight = CGFloat(lineHeight)
//    paragraphStyle.minimumLineHeight = CGFloat(lineHeight)
//    paragraphStyle.lineHeightMultiple = 0
//    paragraphStyle.alignment = .right // textAlignment
//    paragraphStyle.lineSpacing = 0
//
//    // letterSpacing/100.0
//    attributedString.addAttributes([.paragraphStyle: paragraphStyle,
//                                    .kern: letterSpacing/100.0],
//                                   range: NSRange(location: 0, length: attributedString.length))
//    self.topLabel.attributedText = attributedString
//  }

}
