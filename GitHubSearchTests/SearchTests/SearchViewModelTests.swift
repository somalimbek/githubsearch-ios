//
//  SearchViewModelTests.swift
//  GitHubSearchTests
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import XCTest
@testable import GitHubSearch

final class SearchViewModelTests: XCTestCase {

    let searchText = "search text"

    private var viewState: SearchViewState!
    private var searchServiceMock: SearchServiceMock!

    private var sut: SearchViewModel!

    override func setUp() {
        super.setUp()

        viewState = SearchViewState()
        searchServiceMock = SearchServiceMock()

        sut = SearchViewModel(
            viewState: viewState,
            searchService: searchServiceMock
        )
    }

    func testOnSearchTextChanged_UpdatesSearchText() {
        // Given
        viewState.searchText = ""

        // When
        sut.onSearchTextChanged(newText: searchText)

        // Then
        XCTAssertEqual(viewState.searchText, searchText)
    }

    func testOnSearchTextChanged_DoesNotFireNetworkCallTwiceForSameText() {
        // Given
        viewState.searchText = searchText
        let expectation = expectation(description: "waiting for response")
        expectation.isInverted = true

        // When
        sut.onSearchTextChanged(newText: searchText)

        // Then
        waitForExpectations(timeout: 1)
        XCTAssertFalse(searchServiceMock.didCallSearchRepositories)
    }

    func testOnSearchTextChanged_FetchesResults() {
        // Given
        let expectation = expectation(description: "waiting for response")
        expectation.isInverted = true
        searchServiceMock.result = [RepositoryMock.repository]
        viewState.resultList = []

        // When
        sut.onSearchTextChanged(newText: searchText)

        // Then
        waitForExpectations(timeout: 1)
        XCTAssertTrue(searchServiceMock.didCallSearchRepositories)
        XCTAssertEqual(searchServiceMock.searchRepositoriesReceivedParameter, searchText)
        XCTAssertFalse(viewState.resultList.isEmpty)
    }

    func testOnItemSelected() {
        // Given
        let selectedItem = RepositoryMock.repository
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
