////
////  UserInfo.swift
////  MyApp
////
////  Created by 박권용 on 2022/12/28.
////
//
//import Foundation
//import RealmSwift
//
//public class UserInfo: Object {
//  @Persisted(primaryKey: true) var systemNo: Int?
//  @Persisted var name: String
//  @Persisted var status: String
//  
//  convenience init(systemNo: Int? = SLUserDefaults.standard.systemNo, name: String, status: String) {
//    self.init()
//    self.systemNo = systemNo
//    self.name = name
//    self.status = status
//  }
//}
