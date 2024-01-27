//
//  SearchView.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var state: SearchViewState
    let viewModel: SearchViewModelProtocol

    init(state: SearchViewState? = nil, viewModel: SearchViewModelProtocol? = nil) {
        let stateNotNil = state ?? SearchViewState()
        self.state = stateNotNil
        self.viewModel = viewModel ?? SearchViewModel(viewState: stateNotNil)
    }

    var body: some View {
        Group {
            if !state.resultList.isEmpty {
                ScrollView {
                    LazyVStack {
                        ForEach(state.resultList) { repository in
                            Button {
                                viewModel.onItemSelected(repository)
                            } label: {
                                SearchResultListItemView(repository: repository)
                                    .foregroundStyle(.primary)
                            }
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
        .sheet(
            isPresented: Binding {
                state.shouldPresentRepositorySheet
            } set: { newValue in
                viewModel.onPresentRepositorySheet(newValue: newValue)
            }
        ) {
            if let urlString = state.repositoryURLToOpen,
               let url = URL(string: urlString) {
                SafariView(url: url)
                    .ignoresSafeArea()
            } else {
                NavigationStack {
                    Text("Couln't open repository page")
                        .toolbar {
                            ToolbarItem {
                                Button("Done") {
                                    viewModel.onPresentRepositorySheet(newValue: false)
                                }
                            }
                        }
                }
            }
        }
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
                language: "Assembly",
                url: "https://github.com/dtrupenn/Tetris"
            )
        )
    }

    return NavigationStack {
        SearchView(state: state)
    }
}
