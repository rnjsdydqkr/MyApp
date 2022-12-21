//
//  ViewModel.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

class MainViewModel: NSObject, MCViewModelProtocol {
  
  struct Input {
    var firstString = ""
    var secondString = ""
    var thirdString = ""
    var mainCodeNum: Int = 0
  }
  
  @objcMembers
  class Output: NSObject, SLViewModelOutputCompatible {
    dynamic var errorMessage: String = ""
    dynamic var needLoading: Bool = false
    dynamic var startString: String = ""
  }
  
  let service = MainService()
  var input = Input()
  var output = Output()
  
  func requestMainList() {
    output.needLoading = true
    service.requestMainList(userId: "park0820", name: "박권용") { [weak self] response, error in
      self?.output.needLoading = false
      guard let model = response else {
        self?.output.errorMessage = error?.statusMsg ?? ""
        return
      }
      debugPrint("[MainViewModel] requestMainList : \(model)")
    }
  }
  
  func requestPopularMovieInfo() {
    output.needLoading = true
    service.requestPopularMovieInfo() { [weak self] response, error in
      self?.output.needLoading = false
      guard let model = response else {
        self?.output.errorMessage = error?.statusMsg ?? ""
        return
      }
      debugPrint("[MainViewModel] requestPopularMovieInfo : \(model)")
    }
  }
  
  func requestStartService() {
    SLService.shared.startService()
  }
  
  func requestStopService() {
    SLService.shared.stopService()
  }
  
  func requestStartSystem() {
    SLService.shared.requestStartSystem()
  }
  
}
