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
  var header: HTTPHeaders {
    return getHeader()
  }
  
  var url: String {
    switch self {
    case .search:
      return "\(baseURL)/practice/echoJSON"
    }
  }
  
  var parameter: Codable? {
    switch self {
      case .search(userId: let userId, name: let name):
        return MainSearchParameter(userId: userId, name: name)
    }
  }
}

struct MainSearchParameter: Codable {
  let userId: String
  var name: String
}
