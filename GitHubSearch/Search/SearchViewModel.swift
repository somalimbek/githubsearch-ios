//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    
}

final class SearchViewModel {
    private let viewState: SearchViewState

    init(viewState: SearchViewState) {
        self.viewState = viewState
    }
}

extension SearchViewModel: SearchViewModelProtocol {
    
}
