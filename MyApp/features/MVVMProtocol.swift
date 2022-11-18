//
//  MVVMProtocol.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

protocol MCViewModelProtocol {
  associatedtype Service: SLServiceProtocol
  associatedtype Input
  associatedtype Output: SLViewModelOutputCompatible
  
  var service: Service { get }
  var input: Input { get }
  var output: Output { get }
  
}

protocol SLServiceProtocol {
  
}

protocol SLRepositoryProtocol {
  
}

protocol SLViewModelOutputCompatible {
  var errorMessage: String { get set }
  var needLoading: Bool { get set }
}
