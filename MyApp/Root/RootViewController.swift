//
//  ViewController.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class RootViewController: MCViewController {
  
  let viewModel = RootViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.input.isPermissed = true
    // FIXME 초기 화면 진입 테스트 코드
    viewModel.input.isLogged = true
  }
  
  override func setupObserver() {
    addKeyValueObserverList([
      viewModel.output.observe(\.errorMessage) { [weak self] output, _ in
        
      },
      viewModel.output.observe(\.needLoading, changeHandler: { [weak self] output, _ in
        
      })
    ])
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) { [weak self] in
      self?.viewModel.changeScreen()
    }
  }
  
}

