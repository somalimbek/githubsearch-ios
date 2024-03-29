//
//  SearchResultListItemView.swift
//  GitHubSearch
//
//  Created by Soma Limbek on 2024. 01. 27..
//

import SwiftUI

struct SearchResultListItemView: View {

    let repository: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: repository.avatarURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 30, height: 30)
                .clipShape(.rect(cornerRadius: 8))

                Text(repository.owner ?? "")
                    .foregroundStyle(.secondary)
            }

            Text(repository.name)
                .bold()

            Text(repository.description ?? "")
                .multilineTextAlignment(.leading)

            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "star")

                    Text("\(repository.stars)")
                        .foregroundStyle(.secondary)
                }

                Text(repository.language ?? "")
                    .foregroundStyle(.secondary)
            }

            Divider()
        }
    }
}

#Preview {
    SearchResultListItemView(
        repository: Repository(
            id: 1,
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
