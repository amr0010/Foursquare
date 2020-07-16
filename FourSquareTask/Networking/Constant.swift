//
//  Constant.swift
//  FourSquareTask
//
//  Created by Amr on 7/14/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
struct Constants {
    
    static let baseUrl = "https://api.foursquare.com"
    static let clientId = "FYZ5YB5AT4WHLE2ZKNBPHRBFOVDPZTGDGZP3Y1X4SUIJ02DD"
    static let clientSecret = "JFY35NBMJZAKABF2SIONAR0CCIINSXDWIWF1WB25FSJKNO5N"
    
    struct Parameters {
        static let clientID = "client_id"
        static let clientSecret = "client_secret"
        static let version = "v"
        static let location = "ll"
    }
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}
