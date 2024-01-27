//
//  SearchView.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import SwiftUI

struct SearchView: View {

    let state: SearchViewState
    let viewModel: SearchViewModelProtocol

    init(state: SearchViewState? = nil, viewModel: SearchViewModelProtocol? = nil) {
        self.state = state ?? SearchViewState()
        self.viewModel = viewModel ?? SearchViewModel(viewState: self.state)
    }

    var body: some View {
        Group {
            if !state.resultList.isEmpty {
                ScrollView {
                    LazyVStack {
                        ForEach(state.resultList) { repository in
                            SearchResultListItemView(repository: repository)
                        }
                    }
                }
            } else {
                Text("Type in the search bar to earch for repositories")
            }
        }
        .searchable(
            text: Binding {
                state.searchText
            } set: { newValue in
                viewModel.onSearchTextChanged(newText: newValue)
            }
        )
    }
}

#Preview {
    let state = SearchViewState()
    for i in 1...10 {
        state.resultList.append(
            Repository(
                id: i,
                avatarURL: "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
                owner: "dtrupenn",
                name: "Tetris",
                description: "A C implementation of Tetris using Pennsim through LC4",
                stars: 1,
                language: "Assembly"
            )
        )
    }

    return NavigationStack {
        SearchView(state: state)
    }
}
