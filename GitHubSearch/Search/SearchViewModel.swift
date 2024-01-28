//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func onSearchTextChanged(newText: String)
    func onItemSelected(_ selectedItem: Repository)
    func onPresentRepositorySheet(newValue: Bool)
}

final class SearchViewModel {
    private let viewState: SearchViewState
    private let searchService: SearchServiceProtocol

    init(
        viewState: SearchViewState,
        searchService: SearchServiceProtocol? = nil
    ) {
        self.viewState = viewState
        self.searchService = searchService ?? SearchService()
    }
}

extension SearchViewModel: SearchViewModelProtocol {
    func onSearchTextChanged(newText: String) {
        viewState.searchText = newText
        Task {
            let resultList = await searchService.searchRepositories(query: newText)
            await MainActor.run {
                viewState.resultList = resultList
            }
        }
    }

    func onItemSelected(_ selectedItem: Repository) {
        viewState.repositoryURLToOpen = selectedItem.url
        viewState.shouldPresentRepositorySheet = true
    }

    func onPresentRepositorySheet(newValue: Bool) {
        viewState.shouldPresentRepositorySheet = newValue
    }
}
