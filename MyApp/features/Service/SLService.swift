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
