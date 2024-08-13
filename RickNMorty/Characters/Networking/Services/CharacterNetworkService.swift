//
//  CharacterService.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import Foundation

class CharacterNetworkService{
    
    private let url = "https://rickandmortyapi.com/api/character"
    
    static let shared = CharacterNetworkService()
    
    private init() {}
    
    func getAllCharacters() async throws -> [Character]{
        guard let url = URL(string: url) else {
            throw NetworkError.badURL
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let characterData = try JSONDecoder().decode(CharacterData.self, from: data)
        
        return characterData.results
    }
}
