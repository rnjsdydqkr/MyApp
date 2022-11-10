//
//  ViewModel.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation
// TODO 테스트 코드
import Alamofire

class MainViewModel: NSObject, MCViewModelProtocol {
  
  struct Input {
    var firstString = ""
    var secondString = ""
    var thirdString = ""
    var mainCodeNum: Int = 0
  }
  
  @objcMembers
  class Output: NSObject, MCViewModelOutputCompatible {
    dynamic var errorMessage: String = ""
    dynamic var needLoading: Bool = false
    dynamic var startString: String = ""
  }
  
  let service = MainService()
  var input = Input()
  var output = Output()
  
  func requestMainList() {
    output.needLoading = true
    service.requestMainList(userId: "park0820", name: "박권용") { [weak self] model, error in
      self?.output.needLoading = false
      guard let mainModel = model else {
//        return self?.output.errorMessage = mainModel.errorMessage ?? ""
        return
      }
      print("mainModelmainModel: \(mainModel)")
    }
  }
  
  // TODO 테스트 코드
  func requestMainListAPI() {
    // 1. 전송할 값 준비
    let userId = "park0820"
    let name = "박권용"
    let param = [
      "userId" : userId,
      "name": name
    ]
    
    guard let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echoJSON") else { return }
    
    let header: HTTPHeaders = [
      "Content-Type": "application/json",
      "Content-Length": "\(param.count)"
    ]
    
    AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).responseData { (response) in
      switch response.result {
        case .success(let data):
          print("url: \(response.request?.url?.absoluteString ?? ""), param: \(String(data: response.request?.httpBody ?? Data(), encoding: .utf8) ?? ""), res: \(String(data: data, encoding: .utf8) ?? "") ")
          if let JSONString = String(data: data, encoding: .utf8) {
            print("requestAPIModule==================")
            print(JSONString)
          }
          let decoder = JSONDecoder()
//          do {
//            let parsedData = try decoder.decode(CArtResponse.self, from: data)
//            callback(parsedData)
//          } catch let error {
//            callback(DefaultResponse(statusCode: "Parse_Error", statusMsg: error.localizedDescription) as! CArtResponse)
//          }
        case .failure(let error):
        print("url: \(response.request?.url?.absoluteString ?? ""), param: \(String(data: response.request?.httpBody ?? Data(), encoding: .utf8) ?? ""), res: \(error.errorDescription ?? "error") ")
//          callback(DefaultResponse(statusCode: "error", statusMsg: error.localizedDescription) as! CArtResponse)
      }
      
    }
    
  }
}
