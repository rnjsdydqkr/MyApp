//
//  MainAPI.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Alamofire

enum MainAPI: APIProtocol {
  case mainList(userId: String, name: String)
  case popularMovieInfo
}

extension MainAPI {
  
  var url: String {
    switch self {
    case .mainList:
      return "\(baseURL)/practice/echoJSON"
    case .popularMovieInfo:
      return "\(baseURL)/3/movie/popular?api_key=9724f6ad5d569921c015684495875924"
    }
  }
  
  var method: HTTPMethod {
    return .post
  }
  
  var parameter: Codable? {
    switch self {
      case .mainList(userId: let userId, name: let name):
        return MainListParameter(userId: userId, name: name)
    case .popularMovieInfo:
      return PopularMovieInfoParameter()
    }
  }
  
  var header: HTTPHeaders {
    switch self {
    case .mainList(userId: _, name: _):
      return getHeader()
    case .popularMovieInfo:
      return getHeader()
    }
  }
  
}

struct MainListParameter: Codable {
  let userId: String
  var name: String
}

struct PopularMovieInfoParameter: Codable {
  
}
