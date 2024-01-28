//
//  SearchViewModelTests.swift
//  GitHubSearchTests
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import XCTest
@testable import GitHubSearch

final class SearchViewModelTests: XCTestCase {

    private var viewState: SearchViewState!

    private var sut: SearchViewModel!

    override func setUp() {
        super.setUp()

        viewState = SearchViewState()

        sut = SearchViewModel(viewState: viewState)
    }

    func testOnSearchTextChanged() {
        // Given
        let searchText = "search text"
        viewState.searchText = ""

        // When
        sut.onSearchTextChanged(newText: searchText)

        // Then
        XCTAssertEqual(viewState.searchText, searchText)
    }

    func testOnItemSelected() {
        // Given
        let selectedItem = repositoryMock
        viewState.repositoryURLToOpen = nil
        viewState.shouldPresentRepositorySheet = false

        // When
        sut.onItemSelected(selectedItem)

        // Then
        XCTAssertEqual(viewState.repositoryURLToOpen, selectedItem.url)
        XCTAssertTrue(viewState.shouldPresentRepositorySheet)
    }

    func testOnPresentRepositorySheet() {
        // Given
        viewState.shouldPresentRepositorySheet = false

        // When
        sut.onPresentRepositorySheet(newValue: true)

        // Then
        XCTAssertTrue(viewState.shouldPresentRepositorySheet)
    }
}

// MARK: Helpers

private extension SearchViewModelTests {
    var repositoryMock: Repository {
        .init(
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
}
