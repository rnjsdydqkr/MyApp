//
//  ServiceManager.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/20.
//

import Foundation

public enum SLEvent {
  public enum Actions {
    case didStopActions
  }
}

public protocol SLServiceManagerDelegate: NSObjectProtocol {
  func serviceManager(_ manager: SLServiceManager, didReceiveDeviceAction event: SLEvent.Actions)
}

public class SLServiceManager: NSObject {
  public static let shared = SLServiceManager()
  public weak var delegate: SLServiceManagerDelegate?
  
  public func stopAllActions() {
    SLConnectionManager.shared.requestStopAllAction()
  }
  
  public func startService() {
    self.startObservation()
  }
  
  public func stopService() {
    self.stopService()
  }
  
  private func startObservation() {
    debugPrint("[SLServiceManager] startObservation()")
    NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStopAction, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStopActionData, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(didReceivedObserver(_:)), name: .didStopActionDictionary, object: nil)
  }
  
  private func stopObservation() {
    debugPrint("[SLServiceManager] stopObservation()")
    NotificationCenter.default.removeObserver(self, name: .didStopAction, object: nil)
    NotificationCenter.default.removeObserver(self, name: .didStopActionData, object: nil)
    NotificationCenter.default.removeObserver(self, name: .didStopActionDictionary, object: nil)
  }
  
  @objc
  private func didReceivedObserver(_ notification: Notification) {
    debugPrint("[SLServiceManager] didReceivedObserver")
    switch notification.name {
    case .didStopAction:
      debugPrint("[SLServiceManager] didReceivedObserver - didStopAction")
      delegate?.serviceManager(self, didReceiveDeviceAction: .didStopActions)
    case .didStopActionData:
      debugPrint("[SLServiceManager] didReceivedObserver - didStopActionData")
      let isSuccess: Bool = notification.userInfo?["isSuccess"] as? Bool ?? false
      let data: String = notification.userInfo?["data"] as? String ?? ""
      debugPrint("[SLServiceManager] didReceivedObserver - didStopActionData - isSuccess: \(isSuccess)")
      debugPrint("[SLServiceManager] didReceivedObserver - didStopActionData - data: \(String(describing: data))")
    case .didStopActionDictionary:
      debugPrint("[SLServiceManager] didReceivedObserver - didStopActionDictionary")
      let isSuccess: Bool = notification.userInfo?["isSuccess"] as? Bool ?? false
      let didStopActionDictionary: Dictionary<String, Any>? = notification.userInfo?["didStopActionDictionary"] as? Dictionary<String, Any>
      debugPrint("[SLServiceManager] didReceivedObserver - didStopActionDictionary - isSuccess: \(isSuccess)")
      debugPrint("[SLServiceManager] didReceivedObserver - didStopActionDictionary - didStopActionDictionary: \(String(describing: didStopActionDictionary))")
    default:
      debugPrint("[SLServiceManager] didReceivedObserver - default")
    }
  }
  
}
