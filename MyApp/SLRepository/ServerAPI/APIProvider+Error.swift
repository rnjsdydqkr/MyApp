//
//  APIProvider+Error.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

public struct APIError: APIResponseProtocol, CArtErrorMessageProtocol, Swift.Error {
  
  public var statusCode, statusMsg: String
  public var statusMsgLang: [String: String]?
  
  private enum CodingKeys: String, CodingKey {
    case statusCode, statusMsg, statusMsgLang
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    statusCode = try container.decode(String.self, forKey: .statusCode)
    statusMsg = try container.decode(String.self, forKey: .statusMsg)
    
    var _statusMsgLang = [String: String]()
//    if let subContainer = try? container.nestedContainer(keyedBy: GenericCodingKeys.self, forKey: .statusMsgLang) {
//      for key in subContainer.allKeys {
//        _statusMsgLang[key.stringValue] = try subContainer.decode(String.self, forKey: key)
//      }
//      statusMsgLang = _statusMsgLang
//    }
  }
  
  public init(statusCode: String, statusMsg: String) {
    self.statusCode = statusCode
    self.statusMsg = statusMsg
    self.statusMsgLang = [String: String]()
  }
  
  public var error: [String: String] {
    get {
      return statusMsgLang ?? ["default": "NotReceivedError"]
    }
  }
  
}

public protocol CArtErrorMessageProtocol: APIResponseProtocol {
  var error: [String: String] { get }
  func getErrorMessage(curLang: String) -> String
}

extension CArtErrorMessageProtocol where Self: APIResponseProtocol {
  public func getErrorMessage(curLang: String) -> String {
    return error[curLang.lowercased()] ?? "statusMsg"
  }
}
