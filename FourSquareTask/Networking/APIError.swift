//
//  APIError.swift
//  FourSquareTask
//
//  Created by Amr on 7/14/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
enum ApiError: Error {
    case forbidden
    case notFound
    case conflict
    case internalServerError    
    case parsingError
}
