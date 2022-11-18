//
//  APIProvider+Response.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

public protocol APIResponseProtocol: Codable {
  var statusCode: String {
    get set
  }
  var statusMsg: String {
    get set
  }
}

extension APIResponseProtocol {
  public var isSuccessed: Bool {
    get {
      guard statusCode == "200" else {
        return false
      }
      return true
    }
  }
}

// =============================================
// MainList API
// =============================================
public struct MainListResponse: APIResponseProtocol {
  public var statusMsg: String
  public var statusCode: String
  
  public var userData: UserDataModel?
  public var title: String?
  public var contents: String?
  
  public struct UserDataModel: Codable {
    public var userId: String?
    public var name: String?
  }
}

// =============================================
// PopularMovieIfo API
// =============================================
public struct PopularMovieInfoResponse: APIResponseProtocol {
    public var statusMsg: String
    public var statusCode: String
    public let page: Int
    public let results: [Result]
    public let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case statusMsg
        case statusCode
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
public struct Result: Codable {
  public let adult: Bool
  public let backdropPath: String
  public let genreIDS: [Int]
  public let id: Int
  public let originalLanguage, originalTitle, overview: String
  public let popularity: Double
  public let posterPath, releaseDate, title: String
  public let video: Bool
  public let voteAverage: Double
  public let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
