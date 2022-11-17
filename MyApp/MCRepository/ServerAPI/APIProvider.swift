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
  var encoding: ParameterEncoding { get }
  var header: HTTPHeaders { get }
}

extension APIProtocol {
  var baseURL: String {
    return getBuildConfigurationBaseURL()
  }
  
  var method: HTTPMethod {
    return .post
  }
  
  var encoding: ParameterEncoding {
    return JSONEncoding.default
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
    let buildTarget = Bundle.main.bundleIdentifier?.components(separatedBy: ".").last ?? BuildTargetType.prod.name
    switch BuildTargetType(buildTarget) {
    case .dev:
      return BuildTargetType.dev.url
    case .test:
      return BuildTargetType.test.url
    default:
      return BuildTargetType.prod.url
    }
  }
}

public class APIProvider {
  static let shared = APIProvider()
  
  private let networkOperationQueue: OperationQueue = OperationQueue()
  
  fileprivate func makeURL(apiRouter: APIProtocol) -> (URL, HTTPMethod, Parameters?, ParameterEncoding, HTTPHeaders) {
    return (URL(string: apiRouter.url)!, apiRouter.method, apiRouter.parameter?.dictionary, apiRouter.encoding, apiRouter.header)
  }
  
  func requestDataAPIModule<Response: APIResponseProtocol>(api: APIProtocol,
                                                       callback: @escaping (Response?, APIError?) -> Void) {
    let (url, method, parameter, encoding, header) = makeURL(apiRouter: api)
    
    let operation = BlockOperation {
      AF.request(url,
                 method: method,
                 parameters: parameter,
                 encoding: encoding,
                 headers: header).responseData { response in
        switch response.result {
          case .success(let data):
          if let JSONString = String(data: data, encoding: .utf8) {
            debugPrint("respDataAPIModule==================")
            print("[dataJSONString]\n\(JSONString)")
            debugPrint("===================================")
          }

          let decoder = JSONDecoder()
          do {
            let error = try decoder.decode(APIError.self, from: data)
            
            guard error.isSuccessed else {
              callback(nil, error)
              return
            }
            
            decoder.dateDecodingStrategy = .formatted(DateFormatter.dateLocalFormat)
            let parsedData = try decoder.decode(Response.self, from: data)
            callback(parsedData, nil)
            
          } catch let error {
            debugPrint("Parse_Error : \(error)")
            callback(nil, APIError(statusCode: "Parse_Error", statusMsg: error.localizedDescription))
          }
          
          case .failure(let error):
            debugPrint("respErrorDataAPIModule============")
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
  
  func requestDecodableAPIModule<Response: APIResponseProtocol>(api: APIProtocol,
                                                      callback: @escaping (Response?, APIError?) -> Void) {
   let (url, method, parameter, encoding, header) = makeURL(apiRouter: api)

    let operation = BlockOperation {
      AF.request(url,
                 method: method,
                 parameters: parameter,
                 encoding: encoding,
                 headers: header).responseDecodable(of: Response.self) { (response) in
        switch response.result {
          case .success(let DecodableData):
            debugPrint("respDecodableAPIModule==================")
            print("[decodableData]\n\(DecodableData)")
            debugPrint("===============================")

            callback(DecodableData, nil)

          case .failure(let error):
            debugPrint("respErrorDecodableAPIModule============")
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
  public func requestMainList(userId: String, name: String, callback: @escaping(MainListResponse?, APIError?) -> Void) {
    requestDecodableAPIModule(api: MainAPI.mainList(userId: userId, name: name), callback: callback)
  }
  
  public func requestPopularMovieInfo(callback: @escaping(PopularMovieInfoResponse?, APIError?) -> Void) {
//    requestDataAPIModule(api: MainAPI.popularMovieInfo, callback: callback)
    requestDecodableAPIModule(api: MainAPI.popularMovieInfo, callback: callback)
  }
  
}
                                               
// MARK: - Util Extenstions(DateFormatter, String)
extension DateFormatter {
  public static let dateLocalFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.timeZone = TimeZone.autoupdatingCurrent
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter
  }()
}
