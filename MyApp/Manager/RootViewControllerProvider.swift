//
//  RootViewControllerProvider.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import UIKit

class RootViewControllerProvider {
  enum ViewControllerType {
    case permission, login, main
  }
  static let shared = RootViewControllerProvider()
  
  func changeRootViewController (_ viewController: ViewControllerType) {
    
    var changeVC: MCViewController?
    let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)

    switch viewController {
    case .permission:
      break
    case .login:
      changeVC = mainStoryBoard.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController
    case .main:
      changeVC = mainStoryBoard.instantiateViewController(withIdentifier: "mainViewController") as? MainViewController
    }
    
    guard let targetVC = changeVC else { return }
    
    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    sceneDelegate?.changeRootNavigationController(targetVC)
  }
  
}
