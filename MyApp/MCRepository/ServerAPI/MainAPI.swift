//
//  MainAPI.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Alamofire

enum MainAPI: APIProtocol {
  case search(userId: String, name: String)
}

extension MainAPI {
  
  var url: String {
    switch self {
    case .search:
      return "\(baseURL)/practice/echoJSON"
    }
  }
  
  var method: HTTPMethod {
    return .post
  }
  
  var parameter: Codable? {
    switch self {
      case .search(userId: let userId, name: let name):
        return MainSearchParameter(userId: userId, name: name)
    }
  }
  
  var header: HTTPHeaders {
    switch self {
    case .search(userId: _, name: _):
      return getHeader()
    }
  }
  
}

struct MainSearchParameter: Codable {
  let userId: String
  var name: String
}
