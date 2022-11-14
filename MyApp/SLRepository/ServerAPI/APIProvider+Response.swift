//
//  APIProvider+Response.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

public protocol APIResponseProtocol: Codable {
  var statusCode: String {
    get set
  }
  var statusMsg: String {
    get set
  }
}

extension APIResponseProtocol {
  public var isSuccessed: Bool {
    get {
      guard statusCode == "200" else {
        return false
      }
      return true
    }
  }
}

public struct MainResponse: APIResponseProtocol {
  public var statusMsg: String
  public var statusCode: String
  
  public var userData: UserDataModel?
  public var title: String?
  public var contents: String?
  
  public struct UserDataModel: Codable {
    public var userId: String?
    public var name: String?
  }
}
