//
//  RepositoryMock.swift
//  GitHubSearchTests
//
//  Created by Soma Limbek on 2024. 01. 28..
//

import Foundation
@testable import GitHubSearch

enum RepositoryMock {
    static let repository = Repository(
        id: 1,
        avatarURL: "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
        owner: "dtrupenn",
        name: "Tetris",
        description: "A C implementation of Tetris using Pennsim through LC4",
        stars: 1,
        language: "Assembly",
        url: "https://github.com/dtrupenn/Tetris"
    )
}
