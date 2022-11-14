//
//  APIProvider+Parameters.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

extension Encodable {
  subscript(key: String) -> Any? {
    return dictionary[key]
  }
  public var dictionary: [String: Any] {
    return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
  }
}

struct CommonParameter: Codable {
  var currentDevice = "DEVICE_IPHONE"
  var appVrsn: String {
      guard let dictionary = Bundle.main.infoDictionary, let version = dictionary["CFBundleShortVersionString"] as? String else { return ""
      }
      return version
  }

  var appBuild: String {
      guard let dictionary = Bundle.main.infoDictionary, let build = dictionary["CFBundleVersion"] as? String else {
          return ""
      }
      return build
  }
}
