//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func onSearchTextChanged(newText: String)
}

final class SearchViewModel {
    private let viewState: SearchViewState

    init(viewState: SearchViewState) {
        self.viewState = viewState
    }
}

extension SearchViewModel: SearchViewModelProtocol {
    func onSearchTextChanged(newText: String) {
        viewState.searchText = newText
    }
}
