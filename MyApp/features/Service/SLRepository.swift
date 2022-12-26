//
//  SLRepository.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/20.
//

import Foundation

enum SystemStatusEnum {
  case startScan, notFound, found, connecting, connected, disconnected
}

struct SystemStatusData: Codable {
  var good = 1
  var soso = 0
  var bad = -1
}

class SLRepository: NSObject {
  
  fileprivate var systemStatusHandler: ((SystemStatusEnum, [String: Any]?, SLRepository) -> Void)?
  
  func addSystemStatusEventHandler(_ handler: @escaping (SystemStatusEnum, [String: Any]?, SLRepository) -> Void) {
    systemStatusHandler = handler
  }
  
  func stopService() {
    SLServiceManager.shared.stopService()
  }
  
  func startService() {
    SLServiceManager.shared.startService()
  }
  
  func requestStopAllAction() {
    SLServiceManager.shared.delegate = self
    SLServiceManager.shared.stopAllActions()
  }
  
}

extension SLRepository: SLServiceManagerDelegate {
  func serviceManager(_ manager: SLServiceManager, didReceiveDeviceAction event: SLEvent.Actions) {
    switch event {
    case .didStopActions:
      debugPrint("[SLRepository] didStopAction")
      
      if let handler = systemStatusHandler {
        let systemStatusData = SystemStatusData()
        handler(.connected, systemStatusData.dictionary, self)
      }
    }
  }
}
