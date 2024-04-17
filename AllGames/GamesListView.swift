//
//  ContentView.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import SwiftUI

struct GamesListView: View {
    @EnvironmentObject var vm: GameVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(vm.games) { game in
                        NavigationLink(value: game) {
                            GamesCellView(games: game)
                        }
                    }
                }
                .navigationTitle("All Games")
                .navigationDestination(for: Game.self) { game in
                    GamesDetailView(games: game)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        GamesListView()
            .environmentObject(GameVM.test)
    }
}

