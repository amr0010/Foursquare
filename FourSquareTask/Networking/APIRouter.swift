//
//  APIRouter.swift
//  FourSquareTask
//
//  Created by Amr on 7/14/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getPlaces(latitude: Double, longitude: Double)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    //MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        case .getPlaces:
            return .get
        }
    }
    
    //MARK: - Path
    private var path: String {
        switch self {
        case .getPlaces:
            return "/v2/venues/search"
        }
    }
    
    //MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getPlaces(let latitude, let longitude):
            //A dictionary of the key (From the constants file) and its value is returned
            return
                [Constants.Parameters.clientID: Constants.clientId,
                 Constants.Parameters.clientSecret: Constants.clientSecret,
                 Constants.Parameters.version: "20200716",
                 Constants.Parameters.location: "\(latitude),\(longitude)"]
        }
    }
}
