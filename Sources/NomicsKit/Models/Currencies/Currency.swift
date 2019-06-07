//
//  Currency.swift
//  NomicsKit
//
//  Created by Joe Blau on 1/20/19.
//

import Foundation

public struct Currency: Codable {
    var id: String
    var originalSymbol: String
    var name: String
    var description: String
    var websiteURL: String
    var logoURL: String
    var blogURL: String
    var discordURL: String
    var facebookURL: String
    var githubURL: String
    var mediumURL: String
    var redditURL: String
    var telegramURL: String
    var twitterURL: String
    var whitepaperURL: String
    var youtubeURL: String
    var replacedBy: String
}
