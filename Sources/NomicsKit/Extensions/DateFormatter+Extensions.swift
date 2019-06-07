//
//  File.swift
//
//
//  Created by Joe Blau on 6/5/19.
//

import Foundation

extension DateFormatter {
    static var nomics: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter
    }
}
