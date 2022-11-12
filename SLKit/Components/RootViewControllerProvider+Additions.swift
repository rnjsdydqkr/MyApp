//
//  RootViewControllerProvider+Additions.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/11.
//

import Foundation

enum ViewControllerType {
  case permission, login, main
}

enum StoryboardNameType {
  case main
  
  var name: String {
    switch self {
    case .main:
      return "Main"
    }
  }
}

enum StoryboardIdentifierType {
  case permission
  case login
  case main
  
  var name: String {
    switch self {
    case .permission:
      return ""
    case .login:
      return "loginViewController"
    case .main:
      return "mainViewController"
    }
  }
}
