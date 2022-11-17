//
//  APIProvider.swift
//  MyApp
//
//  Created by 박권용 on 2022/04/30.
//

import Foundation

import Alamofire

public protocol APIProtocol {
  var baseURL: String { get }
  var url: String { get }
  var method: HTTPMethod { get }
  var parameter: Codable? { get }
  var header: HTTPHeaders { get }
}

extension APIProtocol {
  var baseURL: String {
    return getBuildConfigurationBaseURL()
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
  
  fileprivate func getBuildConfigurationBaseURL() -> String {
    let buildTarget = (Bundle.main.bundleIdentifier?.components(separatedBy: ".").last ?? BuildTargetType.prod.name)
    switch BuildTargetType(buildTarget) {
    case .dev:
      return BuildTargetType.dev.url
    case .test:
      return BuildTargetType.test.url
    case .prod:
      return BuildTargetType.prod.url
    case .none:
      return BuildTargetType.prod.url
    }
  }
}

public class APIProvider {
  static let shared = APIProvider()
  
  private let networkOperationQueue: OperationQueue = OperationQueue()
  
  fileprivate func makeURL(apiRouter: APIProtocol) -> (URL, HTTPMethod, Parameters?, HTTPHeaders) {
    return (URL(string: apiRouter.url)!, apiRouter.method, apiRouter.parameter?.dictionary, apiRouter.header)
  }
  
  func requestAPIModule<Response: APIResponseProtocol>(api: APIProtocol,
                                                       callback: @escaping (Response?, APIError?) -> Void) {
    let (url, method, parameter, header) = makeURL(apiRouter: api)
    
    let operation = BlockOperation {
      AF.request(url,
                 method: method,
                 parameters: parameter,
                 encoding: JSONEncoding.default,
                 headers: header).responseDecodable(of: Response.self) { (response) in
        switch response.result {
          case .success(let DecodableData):
            debugPrint("respAPIModule==================")
            debugPrint("[DecodableData]\n\(DecodableData)")
            debugPrint("===============================")
            
            callback(DecodableData, nil)
          
          case .failure(let error):
            debugPrint("respErrorAPIModule============")
            debugPrint("url: \(response.request?.url?.absoluteString ?? ""), error: \(error.errorDescription ?? "") ")
            debugPrint("==============================")
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
  public func requestMainList(userId: String, name: String, callback: @escaping(MainResponse?, APIError?) -> Void) {
    requestAPIModule(api: MainAPI.search(userId: userId, name: name), callback: callback)
  }
  
}
