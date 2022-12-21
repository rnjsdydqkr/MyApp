//
//  SLPeripheral.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/21.
//

import Foundation

public class SLPeripheral: NSObject {
  
}

extension SLPeripheral {
  internal func requestStopAllAction() {
    debugPrint("[SLPeripheral] requestStopAllAction()")
    
    
    
    NotificationCenter.default.post(name: .didStopAction, object: nil)
//    NotificationCenter.default.post(name: .didStopActionData, object: nil, userInfo: ["isSuccess": true, "data": "network"])
//    NotificationCenter.default.post(name: .didStopActionData, object: nil, userInfo: ["isSuccess": false, "data": "network"])
  }
}

