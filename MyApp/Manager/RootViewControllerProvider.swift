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
  
  func changeRootViewController (_ viewController: MCViewController, animated: Bool) {
    
    var changeVC: UIViewController?

//    switch viewController {
//    case .permission:
//      break
//    case .login:
//      guard let changeVC = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController else { return }
//    case .main:
//      guard let changeVC = self.storyboard?.instantiateViewController(withIdentifier: "mainViewController") as? MainViewController else { return }
//    }
//    
    let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
    sceneDelegate.window!.rootViewController = viewController
  }
  
//  guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//  guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
  
}
