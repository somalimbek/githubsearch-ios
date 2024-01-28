//
//  SearchService.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import Foundation

protocol SearchServiceProtocol {
    func searchRepositories(query: String) async throws -> [Repository]
}

final class SearchService {

}

extension SearchService: SearchServiceProtocol {
    func searchRepositories(query: String) async throws -> [Repository] {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            throw SearchServiceError.invalidURL
        }

        let headers = [
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28"
        ]

        var request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let (data, urlResponse) = try await URLSession.shared.data(for: request)

        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw SearchServiceError.invalidResponse
        }

        guard httpResponse.statusCode == 200 else {
            throw SearchServiceError(rawValue: httpResponse.statusCode) ?? .unknown
        }

        let decoder = JSONDecoder()
        let result = try decoder.decode(SearchServiceResponse.self, from: data)

        return result.items
    }
}
