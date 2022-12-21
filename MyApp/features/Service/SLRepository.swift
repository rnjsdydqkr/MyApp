//
//  SLRepository.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/20.
//

import Foundation

class SLRepository: NSObject {
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
    }
  }
}
