//
//  RootViewModel.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/11.
//

import Foundation

class RootViewModel: NSObject, MCViewModelProtocol {
  struct Input {
    
  }
  
  @objcMembers
  class Output: NSObject, MCViewModelOutputCompatible {
    dynamic var errorMessage: String = ""
    dynamic var needLoading: Bool = false
  }
  
  let service = MainService()
  var input = Input()
  var output = Output()
  
}
