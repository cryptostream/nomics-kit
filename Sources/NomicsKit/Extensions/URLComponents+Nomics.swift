//
//  File.swift
//  
//
//  Created by Joe Blau on 6/6/19.
//

import Foundation

extension URLComponents {
    static var nomicsServer: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nomics.com"
        return components
    }
}
