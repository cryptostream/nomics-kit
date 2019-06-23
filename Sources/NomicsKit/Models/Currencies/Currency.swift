//
//  Currency.swift
//  NomicsKit
//
//  Created by Joe Blau on 1/20/19.
//

import Foundation

public struct Currency: Codable {
    public let id: String
    public let originalSymbol: String
    public let name: String
    public let description: String
    public let websiteURL: String
    public let logoURL: String
    public let blogURL: String
    public let discordURL: String
    public let facebookURL: String
    public let githubURL: String
    public let mediumURL: String
    public let redditURL: String
    public let telegramURL: String
    public let twitterURL: String
    public let whitepaperURL: String
    public let youtubeURL: String
    public let replacedBy: String
}
