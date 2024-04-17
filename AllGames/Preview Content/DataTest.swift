//
//  DataTest.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import Foundation


struct DataTest: DataInteractor {
    func getGames() async throws -> [Game] {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Game].self, from: data)
    }
    
    let url = Bundle.main.url(forResource: "testGames", withExtension: "json")!
}


extension GameVM {
    static let test = GameVM(network: DataTest())
}

extension Game {
    static let test = Game(
        id: 540,
        title: "Overwatch 2",
        thumbnail: "https://www.freetogame.com/g/540/thumbnail.jpg",
        shortDescription: "A hero-focused first-person team shooter from Blizzard Entertainment.",
        gameURL: "https://www.freetogame.com/open/overwatch-2",
        genre: .shooter,
        platform: .pcWindows,
        publisher: "Activision Blizzard",
        developer: "Blizzard Entertainment",
        releaseDate: "2022-10-04",
        freetogameProfileURL: "https://www.freetogame.com/overwatch-2"
    )
}
