//
//  AllGamesApp.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import SwiftUI

@main
struct AllGamesApp: App {
    @StateObject var vm = GameVM()
    var body: some Scene {
        WindowGroup {
            GamesListView()
        }
        .environmentObject(vm)
    }
}
