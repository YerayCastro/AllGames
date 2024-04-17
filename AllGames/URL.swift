//
//  URL.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import Foundation


let api = URL(string: "https://www.freetogame.com/api/")!

extension URL {
    static let urlGames = api.appending(path: "games")
    static let urlGameID = api.appending(path: "game")
    static func getGame(id: Int) -> URL {
        api.appending(path: "game").appending(path: "\(id)")
    }
}
