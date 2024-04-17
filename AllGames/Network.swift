//
//  Network.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import Foundation


protocol DataInteractor {
    func getGames() async throws -> [Game] 
}

struct Network: DataInteractor {
    func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func postJSON(request: URLRequest, status: Int = 200) async throws {
        let (_, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode != status {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func getGames() async throws -> [Game] {
        try await getJSON(request: .get(url: .urlGames), type: [Game].self)
    }
}
