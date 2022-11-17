//
//  Repository+Additions.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/16.
//

import Foundation

enum BuildTargetType {
  case dev, test, prod
  
  var name: String {
    switch self {
    case .dev:
      return "dev"
    case .test:
      return "test"
    case .prod:
      return "prod"
    }
  }
  
  var url: String {
    switch self {
    case .dev:
      return "http://swiftapi.rubypaper-dev.co.kr:2029"
    case .test:
      return "http://swiftapi.rubypaper-test.co.kr:2029"
    case .prod:
      return "http://swiftapi.rubypaper.co.kr:2029"
    }
  }
}
