//
//  APIProvider+Error.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

public struct APIError: APIResponseProtocol, Swift.Error {
  
  public var statusCode, statusMsg: String
  
  public init(statusCode: String, statusMsg: String) {
    self.statusCode = statusCode
    self.statusMsg = statusMsg
  }
}
