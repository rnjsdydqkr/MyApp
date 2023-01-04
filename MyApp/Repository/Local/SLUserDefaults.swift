//
//  SLUserDefaults.swift
//  MyApp
//
//  Created by 박권용 on 2022/12/27.
//

import Foundation

public protocol AnyOptional {
  var isNil: Bool { get }
}

extension Optional: AnyOptional {
  public var isNil: Bool { self == nil }
}

@propertyWrapper
public struct UserDefault<Value> {
  let key: String
  var container: UserDefaults = .standard
  
  public var wrappedValue: Value? {
    get {
      return container.object(forKey: key) as? Value
    }
    set {
      if let optional = newValue as? AnyOptional, optional.isNil {
        container.removeObject(forKey: key)
        container.synchronize()
      } else {
        container.set(newValue, forKey: key)
        container.synchronize()
      }
    }
  }
}

@propertyWrapper
public struct UserDefaultWrapper<Value: Codable> {
  let key: String
  var container: UserDefaults = .standard
  
  public var wrappedValue: Value? {
    get {
      if let savedObjectData = container.object(forKey: key) as? Data {
        let decoder = JSONDecoder()
        if let decodedObject = try? decoder.decode(Value.self, from: savedObjectData) {
          return decodedObject
        }
      }
      return nil
    }
    set {
      let encoder = JSONEncoder()
      if let encodedObject = try? encoder.encode(newValue) {
        container.setValue(encodedObject, forKey: key)
      }
    }
  }
}

public class SLUserDefaults {
  public static let standard: SLUserDefaults = SLUserDefaults()
  
  fileprivate let serviceID = Bundle.main.bundleIdentifier ?? ""
  
  private init() {}
  
  // MARK: - Setting UserDefaults - Base Type
  @UserDefault(key: "system_no")
  public var systemNo: Int?
  
  @UserDefault(key: "allow_auto_login")
  public var allowAutoLogin: Bool?
  
  @UserDefault(key: "current_lang")
  public var currentLang: String?
  
  // MARK: - Setting UserDefaults - Object Type
  @UserDefaultWrapper(key: "popular_movie_info")
  public var popularMovieInfo: PopularMovieInfoResponse?
  
  public func clearData() {
    systemNo = nil
    allowAutoLogin = nil
  }
  
}

extension SLUserDefaults {
  public func removeAuthorization() {
    guard let userId = systemNo else {
      debugPrint("systemNo is none")
      return
    }
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                  kSecAttrService: serviceID,
                                  kSecAttrAccount: userId]
    let ossResult = SecItemDelete(query as CFDictionary)
    if ossResult == errSecSuccess {
      debugPrint("success removed")
    }
  }
  
  public func saveAuthorization(password: String) {
    guard let userId = systemNo else {
      debugPrint("userId is none")
      return
    }
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                  kSecAttrService: serviceID,
                                  kSecAttrAccount: userId,
                                  kSecAttrGeneric: password.data(using: .utf8)!]
    var result: CFTypeRef?
    if SecItemDelete(query as CFDictionary) == errSecSuccess {
      debugPrint("success removed")
    }
    let ossResult = SecItemAdd(query as CFDictionary, &result)
    if ossResult == errSecSuccess {
      debugPrint("save success")
    }
  }
  
  public func loadAuthorization() -> String? {
    guard let userId = systemNo else {
      debugPrint("userId is none")
      return nil
    }
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                  kSecAttrService: serviceID,
                                  kSecAttrAccount: userId,
                                  kSecMatchLimit: kSecMatchLimitOne,
                                  kSecReturnAttributes: kCFBooleanTrue,
                                  kSecReturnData: kCFBooleanTrue]
    var item: CFTypeRef?
    let oss = SecItemCopyMatching(query as CFDictionary, &item)
    if oss != errSecSuccess {
      return nil
    }
    guard let existingKey = item as? [CFString: Any],
          let data = existingKey[kSecAttrGeneric] as? Data else {
      return nil
    }
    return String(data: data, encoding: .utf8)
  }
  
}
