//
//  APIProvider.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

import Alamofire

let APIURL = "http://swiftapi.rubypaper.co.kr:2029"
//let APIURL = "0.0.0.0:3000"

public protocol APIProtocol {
  var baseURL: String { get }
  var method: HTTPMethod { get }
  var header: HTTPHeaders { get }
  var url: String { get }
  var parameter: Codable? { get }
}

extension APIProtocol {
  var baseURL: String {
    return APIURL
  }
  
  var method: HTTPMethod {
    return .post
  }

  func getHeader() -> HTTPHeaders {
    var header: HTTPHeaders = []
    header.add(name: "Content-Type", value: "application/json")
    return header
  }

  func getAuthHeader() -> HTTPHeaders {
    var header: HTTPHeaders = []
    header.add(name: "Content-Type", value: "application/json")
    header.add(name: "userKey", value: "QWxhZGRpbjpvcGVuIHNlc2FtZQ==")
    return header
  }
}

public class APIProvider {
  static let shared = APIProvider()
  
  private let networkOperationQueue: OperationQueue = OperationQueue()
  
  fileprivate func makeURL(apiRouter: APIProtocol) -> (URL, HTTPHeaders, HTTPMethod, Parameters?) {
    
    return (URL(string: apiRouter.url)!, apiRouter.header, apiRouter.method, apiRouter.parameter?.dictionary)
  }
  
  func requestAuthAPIModule<Response: APIResponseProtocol>(api: APIProtocol,
                                                                          callback: @escaping (Response?, APIError?) -> Void) {
    let (url, header, method, parameter) = makeURL(apiRouter: api)
    
    let operation = BlockOperation {
      AF.request(url,
                 method: method,
                 parameters: parameter,
                 encoding: JSONEncoding.default,
                 headers: header).responseData { (response) in
        switch response.result {
          case .success(let data):
          print("url: \(response.request?.url?.absoluteString ?? "")\nparam:\(String(describing: parameter)) \nres: \(String(data: data, encoding: .utf8) ?? "") ")
            if let JSONString = String(data: data, encoding: .utf8) {
              print("requestAuthAPIModule==================")
              print(JSONString)
            }
            let decoder = JSONDecoder()
            do {
              
              let error = try decoder.decode(APIError.self, from: data)
              
              guard error.isSuccessed else {
                callback(nil, error)
                
                return
              }
              
              decoder.dateDecodingStrategy = .formatted(DateFormatter.cartDateLocalFormat)
              let parsedData = try decoder.decode(Response.self, from: data)
              callback(parsedData, nil)
            } catch let error {
              print("\(error)")
              callback(nil, APIError(statusCode: "Parse_Error", statusMsg: error.localizedDescription))
            }
          case .failure(let error):
            print("url: \(response.request?.url?.absoluteString ?? ""), res: \(error.errorDescription ?? "") ")
            switch error {
              case .sessionTaskFailed(let urlError as URLError) where urlError.code == .timedOut:
                callback(nil, APIError(statusCode: String(response.response?.statusCode ?? 9999), statusMsg: "Request timeout!!"))
              default:
                callback(nil, APIError(statusCode: String(response.response?.statusCode ?? 0), statusMsg: error.localizedDescription))
            }
            
        }
      }
    }
    networkOperationQueue.addOperation(operation)
  }
  
}


extension APIProvider {
  public func requestMainList(userId: String, name: String, onComplete: @escaping(MainResponse?, APIError?) -> Void) {
    requestAuthAPIModule(api: MainAPI.search(userId: userId, name: name), callback: onComplete)
  }
  
}

extension DateFormatter {
  public static let cartDateLocalFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.timeZone = TimeZone.autoupdatingCurrent
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
