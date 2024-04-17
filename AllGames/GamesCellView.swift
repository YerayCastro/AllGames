//
//  GamesCellView.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import SwiftUI

struct GamesCellView: View {
    let games: Game
    var body: some View {
        if let urlThumnails = URL(string: games.thumbnail) {
            AsyncImage(url: urlThumnails) { image in
                image
                    .frame(width: 350, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
            } placeholder: {
                Image(systemName: "gamecontroller")
                    .frame(width: 350, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            }
        }
    }
}

#Preview {
    GamesCellView(games: .test)
}
