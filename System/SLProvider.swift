//
//  SLProvider.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/21.
//

import Foundation

class SLConnectionManager: NSObject {
  public static let shared = SLConnectionManager()
  private var selectedDevice: SLPeripheral? = SLPeripheral()
  
  public func requestStopAllAction() {
    selectedDevice?.requestStopAllAction()
  }
  
}
