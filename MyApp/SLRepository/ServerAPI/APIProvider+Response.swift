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
//  var statusMsg: String {
//    get set
//  }
//  var statusMsgLang: [String: String]? {
//    get set
//  }
}

extension APIResponseProtocol {
  public var isSuccessed: Bool {
    get {
      guard statusCode != "200" else {
        return true
      }
      return false
    }
  }
}

public struct MainResponse: APIResponseProtocol {
  public var statusCode: String
  
  public var userData: UserDataModel?
  public var title: String?
  public var contents: String?
  
  public struct UserDataModel: Codable {
    public var userId: String?
    public var name: String?
  }
}

//// MARK: - MainDataResponse
//public struct MainResponse: APIResponseProtocol {
////  public var statusMsgLang: [String : String]?
////  public var statusCode, statusMsg: String
//  public var statusCode: String
//
//  public let templatingExample: String
//  public let users: [User]
//  public let total: String
//
//  enum CodingKeys: String, CodingKey {
//      case statusCode
//      case templatingExample = "Templating example"
//      case users, total
//  }
//
//  // MARK: - User
//  public struct User: Codable {
//    public let userID, firstname, lastname: String
//    public let friends: [Friend]?
//
//      enum CodingKeys: String, CodingKey {
//          case userID = "userId"
//          case firstname, lastname, friends
//      }
//  }
//  // MARK: - Friend
//  public struct Friend: Codable {
//    public let id: String
//  }
//}
