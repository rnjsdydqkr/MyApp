//
//  mainModel.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

struct UserDataModel {
  var userId: String?
  var name: String?
}

struct MainDataModel {
  var userData: UserDataModel?
  var title: String?
  var contents: String?
}
