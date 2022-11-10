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
