//
//  SLPeripheral.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/21.
//

import Foundation

struct DidStopActionData: Codable {
  var userId = "scv1234"
  var userName = "lion"
}

public class SLPeripheral: NSObject {
  
}

extension SLPeripheral {
  internal func requestStopAllAction() {
    debugPrint("[SLPeripheral] requestStopAllAction()")
    
    NotificationCenter.default.post(name: .didStopAction, object: nil)
    NotificationCenter.default.post(name: .didStopActionData, object: nil, userInfo: ["isSuccess": true, "data": "network"])
    let didStopActionData = DidStopActionData()
    NotificationCenter.default.post(name: .didStopActionDictionary, object: nil, userInfo: ["isSuccess": false, "didStopActionDictionary": didStopActionData.dictionary])
  }
}

