//
//  WeatherEndpoint.swift
//  NewsApp With SwiftUI Framework
//
//  Created by Алексей Воронов on 30.09.2019.
//  Copyright © 2019 Алексей Воронов. All rights reserved.
//

import Foundation

enum MovieServiceEndpoint: EndpointProtocol {
    case getMovieName(searchString: String)
    
    var baseURL: String {
        return "http://www.omdbapi.com/"
    }
    
    var absoluteURL: String {
        switch self {
        case .getMovieName:
            return baseURL
        }
    }
    
    var params: [String : String] {
        switch self {
        case let .getMovieName(searchString):
            return ["t": searchString, "apikey": "d29d5f8"]
        }
    }
    
    var headers: [String : String] {
        return [
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
}
