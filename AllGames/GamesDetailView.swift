//
//  GamesDetailView.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import SwiftUI

struct GamesDetailView: View {
    let games: Game
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                    if let urlThumbnails = URL(string: games.thumbnail) {
                        AsyncImage(url: urlThumbnails) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Image(systemName: "gamecontroller")
                                .frame(width: 350, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                GamesDetailCellView(title: "Developer", label: games.developer)
                GamesDetailCellView(title: "Publisher", label: games.publisher)
                GamesDetailCellView(title: "Platform", label: games.platform.rawValue)
                GamesDetailCellView(title: "Release Date", label: games.releaseDate)
                GamesDetailCellView(title: "Genre", label: games.genre.rawValue)
                GamesDetailCellView(title: "Game URL", label: games.gameURL)
                GamesDetailCellView(title: "Profile URL", label: games.freetogameProfileURL)
                GamesDetailCellView(title: "Description", label: games.shortDescription)
                
                }
                .padding()
        }
        .navigationTitle(games.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GamesDetailView(games: .test)
    }
}

