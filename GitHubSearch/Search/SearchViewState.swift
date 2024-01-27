//
//  SearchViewState.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

final class SearchViewState: ObservableObject {
    @Published var resultList: [Repository] = []
    @Published var searchText: String = ""
    @Published var repositoryURLToOpen: String? = nil
    @Published var shouldPresentRepositorySheet: Bool = false
}
