//
//  Repository.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

struct Repository: Identifiable {
    let id: Int
    let avatarURL: String
    let owner: String
    let name: String
    let description: String
    let stars: Int
    let language: String
}
