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

enum StoryboardIdentifierType: String {
  case permission = ""
  case login = "loginViewController"
  case main = "mainViewController"
}
