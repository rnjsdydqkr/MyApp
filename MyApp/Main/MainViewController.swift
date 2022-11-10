//
//  MainViewController.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class MainViewController: MCViewController {
  
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
    print("setupObserver")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad")
  }
  
  override func setupViewStyle() {
    print("setupViewStyle")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
    
    viewModel.requestMainList()
    
  }
  
  @IBAction func didPressed(button: UIButton) {
    switch button {
    case firstButton:
      viewModel.output.startString = "firstButton"
    case secondButton:
      viewModel.output.startString = "secondButton"
    case thirdButton:
      viewModel.output.startString = "thirdButton"
    default:
      print("default")
    }
  }

}
