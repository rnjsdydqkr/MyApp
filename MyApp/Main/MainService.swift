//
//  MainService.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

class MainService: MCServiceProtocol {
  private let repository = MainRepository()
  
  func requestMainList(userId: String, name: String, onComplete: @escaping ((MainResponse?, String?) -> Void)) {
    repository.requestMainList(userId: userId, name: name) { response, error in
      guard let resp = response else {
        return onComplete(nil, error?.getErrorMessage(curLang: I18N.currLang) ?? "")
      }
      print("respresp: \(resp)")
      return onComplete(resp, nil)
    }
  }
  
//  func requestMainList(userId: String, name: String, onComplete: @escaping ((MainModelReponse) -> Void)) {
//    repository.requestMainList(userId: userId, name: name) { response, error in
//      guard let mainResp = response else {
//        return
//      }
//
//      return onComplete(MainModelReponse(statusCode: "200", statusMsg: ""))
//    }
//  }
  
}
