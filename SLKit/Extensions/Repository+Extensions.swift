//
//  Repository+Extensions.swift
//  MyApp
//
//  Created by 박권용 on 2022/11/16.
//

import Foundation

extension BuildTargetType {
  init?(_ buildTargetType: String) {
    switch buildTargetType {
    case BuildTargetType.dev.name:
      self = .dev
    case BuildTargetType.test.name:
      self = .test
    default:
      self = .prod
    }
  }
}
