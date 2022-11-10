//
//  MVVMProtocol.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

protocol MCViewModelProtocol {
  associatedtype Service: MCServiceProtocol
  associatedtype Input
  associatedtype Output: MCViewModelOutputCompatible
  
  var service: Service { get }
  var input: Input { get }
  var output: Output { get }
  
}

protocol MCServiceProtocol {
  
}

protocol MCRepositoryProtocol {
  
}

protocol MCViewModelOutputCompatible {
  var errorMessage: String { get set }
  var needLoading: Bool { get set }
}
