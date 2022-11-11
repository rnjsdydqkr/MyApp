//
//  RootViewModel.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/11.
//

import Foundation

class RootViewModel: NSObject, MCViewModelProtocol {
  struct Input {
    var isPermissed: Bool = false
    var isLogged: Bool = false
  }
  
  @objcMembers
  class Output: NSObject, MCViewModelOutputCompatible {
    dynamic var errorMessage: String = ""
    dynamic var needLoading: Bool = false
  }
  
  let service = MainService()
  var input = Input()
  var output = Output()
  
  func changeScreen() {
    if !input.isPermissed {
      RootViewControllerProvider.shared.changeRootViewController(.permission)
    } else if input.isLogged {
      RootViewControllerProvider.shared.changeRootViewController(.main)
    } else {
      RootViewControllerProvider.shared.changeRootViewController(.login)
    }
  }
  
}
