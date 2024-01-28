//
//  Repository.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

struct Repository: Identifiable, Decodable {
    let id: Int
    let avatarURL: String
    let owner: String
    let name: String
    let description: String
    let stars: Int
    let language: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case name
        case description
        case stars = "stargazers_count"
        case language
        case url
    }

    enum OwnerKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case owner = "login"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let ownerContainer = try container.nestedContainer(keyedBy: OwnerKeys.self, forKey: .owner)

        id = try container.decode(Int.self, forKey: .id)
        avatarURL = try ownerContainer.decode(String.self, forKey: .avatarURL)
        owner = try ownerContainer.decode(String.self, forKey: .owner)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        stars = try container.decode(Int.self, forKey: .stars)
        language = try container.decode(String.self, forKey: .language)
        url = try container.decode(String.self, forKey: .url)
    }
}
