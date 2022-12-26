//
//  SLService.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/19.
//

import Foundation

class SLService: NSObject, SLServiceProtocol {
  static let shared = SLService()
  private var repository = SLRepository()
  
  override private init() {
    super.init()
    
    addHandler()
  }
  
  func stopService() {
    repository.stopService()
  }
  
  func startService() {
    repository.startService()
  }
  
  func requestStartSystem() {
    repository.requestStopAllAction()
  }
}

extension SLService {
  func addHandler() {
    repository.addSystemStatusEventHandler { [weak self] status, dictionary, repository in
      debugPrint("[SLService] addSystemStatusEventHandler - status: \(status), dictionary: \(String(describing: dictionary)), repository: \(repository)")
      guard let weakSelf = self else { return }
      switch status {
      case .startScan:
        break
      case .notFound:
        break
      case .found:
        break
      case .connecting:
        break
      case .connected:
        debugPrint("connectedconnectedconnected")
      case .disconnected:
        break
      }
    }
  }
}
