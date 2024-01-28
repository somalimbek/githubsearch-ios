//
//  SearchServiceMock.swift
//  GitHubSearchTests
//
//  Created by Soma Limbek on 2024. 01. 28..
//

import Foundation
@testable import GitHubSearch

final class SearchServiceMock {
    var didCallSearchRepositories = false
    var searchRepositoriesReceivedParameter: String?
    var result: [Repository] = []
}

extension SearchServiceMock: SearchServiceProtocol {
    func searchRepositories(query: String) -> [Repository] {
        didCallSearchRepositories = true
        searchRepositoriesReceivedParameter = query

        return result
    }
}
