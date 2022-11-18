//
//  MainRepository.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/29.
//

import Foundation

class MainRepository: SLRepositoryProtocol {
  func requestMainList(userId: String, name: String, callback: @escaping (MainListResponse?, APIError?) -> Void) {
    APIProvider.shared.requestMainList(userId: userId, name: name, callback: callback)
  }
  
  func requestPopularMovieInfo(callback: @escaping (PopularMovieInfoResponse?, APIError?) -> Void) {
    APIProvider.shared.requestPopularMovieInfo(callback: callback)
  }
}
