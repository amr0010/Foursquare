//
//  APIClient.swift
//  FourSquareTask
//
//  Created by Amr on 7/14/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class APIClient {
    static let sharedInstance = APIClient()
    private init() {}
    func getPlaces() -> Single<[Venue]> {
        return requestRemote(APIRouter.getPlaces(latitude: 40.7, longitude: -74))
    }
    
    func requestRemote(_ urlConvertible: URLRequestConvertible) -> Single<[Venue]> {
        
        return Single<[Venue]>.create { observer in
            let request = Alamofire.request(urlConvertible).responseData { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let venuesResponse = try JSONDecoder().decode(VenuesDTO.self, from: value)
                        guard let venues = venuesResponse.response?.venues else {
                            observer(.error(ApiError.notFound))
                            return
                        }
                        observer(.success(venues))
                        
                    } catch {
                        print(error)
                        observer(.error(error))
                    }
                case .failure(let error):
                    switch response.response?.statusCode {
                    case 403:
                        observer(.error(ApiError.forbidden))
                    case 404:
                        observer(.error(ApiError.notFound))
                    case 409:
                        observer(.error(ApiError.conflict))
                    case 500:
                        observer(.error(ApiError.internalServerError))
                    default:
                        observer(.error(error))
                    }
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
