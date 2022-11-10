//
//  ViewController.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class RootViewController: MCViewController {
  
  var isLogged: Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func setupObserver() {
    addKeyValueObserverList([
      
    ])
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    changeScreen()
  }
  
  func changeScreen() {
    if isLogged {
//      RootViewControllerProvider.shared.changeRootViewController(.login)
      guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainViewController") as? MainViewController else { return }
      RootViewControllerProvider.shared.changeRootViewController(mainVC, animated: false)
    } else {
//      RootViewControllerProvider.shared.changeRootViewController(.main)
      guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController else { return }
      RootViewControllerProvider.shared.changeRootViewController(loginVC, animated: false)
    }
  }
  
}

