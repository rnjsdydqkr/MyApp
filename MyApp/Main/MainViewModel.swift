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
  
  private var keyValueObserverList = [NSKeyValueObservation]()
  func addSystemEventHandler() {
    keyValueObserverList.append(contentsOf: [
      SLService.shared.observe(\.connectionsStatus) { [weak self] service, _ in
        guard let weakSelf = self else { return }
        switch service.connectionsStatus {
        case .notConnected:
          debugPrint("[MainViewModel] notConnected")
        case .searching:
          debugPrint("[MainViewModel] searching")
        case .connecting:
          debugPrint("[MainViewModel] connecting")
        case .connected:
          debugPrint("[MainViewModel] connected")
        case .sendData:
          debugPrint("[MainViewModel] sendData")
        case .diableBLE:
          debugPrint("[MainViewModel] diableBLE")
        }
      },
      SLService.shared.connectedSystem.observe(\.batteryStatus) { [weak self] object, _ in
        switch object.batteryStatus {
        case .ready:
          debugPrint("[MainViewModel] ready")
        case .chargeProgress:
          debugPrint("[MainViewModel] chargeProgress")
        case .chargeDone:
          debugPrint("[MainViewModel] chargeDone")
        case .fault:
          debugPrint("[MainViewModel] fault")
        case .unknown:
          debugPrint("[MainViewModel] unknown")
        }
      }
    ])
  }
  
}
