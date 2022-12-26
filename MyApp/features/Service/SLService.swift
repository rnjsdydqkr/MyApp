//
//  SLService.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/19.
//

import Foundation

@objcMembers
class SLSystemAppModel: NSObject {
  @objc
  enum BatteryStatus: UInt8 {
    case ready = 0x00
    case chargeProgress = 0x01
    case chargeDone = 0x02
    case fault = 0x03
    case unknown = 0xFF
    
    func getIndex() -> Int {
      switch self {
      case .ready:
        return 1
      case .chargeProgress:
        return 2
      case .chargeDone:
        return 3
      case .fault:
        return 4
      case .unknown:
        return 5
      }
    }
  }
  
  enum AuthState: Int {
    case notConnected = 0, searching, connecting, logined
  }
  
  dynamic var batteryStatus: BatteryStatus = .unknown
  dynamic var connectionStatus: AuthState = .notConnected
  
  override init() {
    super.init()
  }
}

class SLService: NSObject, SLServiceProtocol {
  @objc
  enum ConnectionStatusType: Int {
    case notConnected = 0, searching, connecting, connected, sendData, diableBLE
  }
  
  static let shared = SLService()
  private var repository = SLRepository()
  
  @objc dynamic private(set) var connectedSystem: SLSystemAppModel = SLSystemAppModel()
  @objc dynamic private(set) var connectionsStatus: ConnectionStatusType = .notConnected
  
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
        weakSelf.connectionsStatus = .connected
        weakSelf.connectedSystem.batteryStatus = .chargeDone
      case .disconnected:
        break
      }
    }
  }
}
