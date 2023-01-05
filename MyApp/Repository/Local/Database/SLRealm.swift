////
////  SLRealm.swift
////  MyApp
////
////  Created by 박권용 on 2022/12/28.
////
//
//import Foundation
//import RealmSwift
//
//public class SLRealm {
//  public static let standard: SLRealm = SLRealm()
//  fileprivate let realm = try! Realm()
//  
//  public func createObject(object: Object) {
//    guard let userId = SLUserDefaults.standard.systemNo else {
//      debugPrint("systemNo is none")
//      return
//    }
//    try! realm.write {
//      realm.add(object)
//    }
//  }
//  
//  public func retrieveObject(object: Object) -> Object {
//    guard let userId = SLUserDefaults.standard.systemNo else {
//      debugPrint("systemNo is none")
//      return
//    }
//    let obj = realm.objects(object.self) as! Object
//    let predicateQuery = NSPredicate(format: "name = %@", "kim")
//    
//    return obj(predicateQuery)
//  }
//  
//  public func updateObject(object: Object) {
//    guard let userId = SLUserDefaults.standard.systemNo else {
//      debugPrint("systemNo is none")
//      return
//    }
//    try! realm.write {
//      realm.add(object, update: .modified)
//    }
//  }
//  
//  public func deleteObject(object: Object) {
//    guard let userId = SLUserDefaults.standard.systemNo else {
//      debugPrint("systemNo is none")
//      return
//    }
//    try! realm.write {
//      realm.delete(object)
//    }
//  }
//  
//  public func loadObject(object: Object, sortName: String, ascending: Bool) -> Object {
//    return realm.objects(object.self).sorted(byKeyPath: sortName, ascending: ascending)
//  }
//  
//}
