//
//  SearchService.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

protocol SearchServiceProtocol {
    func searchRepositories(query: String) -> [Repository]
}

final class SearchService {

}

extension SearchService: SearchServiceProtocol {
    func searchRepositories(query: String) -> [Repository] {
        return []
    }
}
