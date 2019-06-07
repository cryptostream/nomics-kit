//
//  Volume.swift
//  
//
//  Created by Joe Blau on 6/5/19.
//

import Foundation


enum Volume {
    case globalVolumeHistory(start: Date? = nil, end: Date? = nil)
    
    var path: String {
        switch self {
        case .globalVolumeHistory: return "/v1/volume/history"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        switch self {
        case .globalVolumeHistory(let start, let end):
            start.flatMap {
                queryItems.append(URLQueryItem(name: "start", value: DateFormatter.nomics.string(from: $0)))
            }
            end.flatMap {
                queryItems.append(URLQueryItem(name: "end", value: DateFormatter.nomics.string(from: $0)))
            }
        }

        return queryItems
    }
    
    var model: ResponseType {
        switch self {
        case .globalVolumeHistory: return .globalVolumeHistory([VolumeHistory].self)
        }
    }
}
