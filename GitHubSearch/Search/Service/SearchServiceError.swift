//
//  SearchServiceError.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 28..
//

import Foundation

enum SearchServiceError: Int, Error {
    case invalidURL
    case invalidResponse
    case notModified = 304
    case validationFailed = 422
    case serviceUnavailable = 503
    case unknown
}
