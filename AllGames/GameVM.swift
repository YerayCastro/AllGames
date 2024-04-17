//
//  GameVM.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import Foundation


final class GameVM: ObservableObject {
    let network: DataInteractor
    @Published var games: [Game] = []
    @Published var search = ""
    @Published var allGames: [Game] = []
    
    init(network: DataInteractor = Network()) {
        self.network = network
        Task{ await getGames() }
    }
    func getGames() async {
        do {
            let gams = try await network.getGames()
            await MainActor.run {
                self.games = gams
            }
        } catch {
            await MainActor.run {
                print(NetworkError.general(error))
            }
        }
    }
}

