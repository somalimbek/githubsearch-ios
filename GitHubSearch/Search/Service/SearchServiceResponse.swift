//
//  SearchServiceResponse.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 28..
//

import Foundation

struct SearchServiceResponse: Decodable {
    let items: [Repository]
}
