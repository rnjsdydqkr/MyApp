//
//  ViewModel.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation
// TODO 테스트 코드
import Alamofire

class MainViewModel: NSObject, MCViewModelProtocol {
  
  struct Input {
    var firstString = ""
    var secondString = ""
    var thirdString = ""
    var mainCodeNum: Int = 0
  }
  
  @objcMembers
  class Output: NSObject, MCViewModelOutputCompatible {
    dynamic var errorMessage: String = ""
    dynamic var needLoading: Bool = false
    dynamic var startString: String = ""
  }
  
  let service = MainService()
  var input = Input()
  var output = Output()
  
  func requestMainList() {
    output.needLoading = true
    service.requestMainList(userId: "park0820", name: "박권용") { [weak self] model, error in
      self?.output.needLoading = false
      guard let mainModel = model else {
//        return self?.output.errorMessage = mainModel.errorMessage ?? ""
        return
      }
      print("mainModelmainModel: \(mainModel)")
    }
  }
  
}
