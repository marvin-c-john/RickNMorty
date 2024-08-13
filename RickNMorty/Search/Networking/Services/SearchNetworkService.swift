//
//  SearchNetworkService.swift
//  RickNMorty
//
//  Created by Marvin John on 14.08.24.
//

import Foundation

class SearchNetworkService {
    
    private let baseUrl = "https://rickandmortyapi.com/api/character"
    
    static let shared = SearchNetworkService()
    
    private init() {}
    
    func searchCharacters(query: String) async throws -> [Character] {
        guard var urlComponents = URLComponents(string: baseUrl) else {
            throw NetworkError.badURL
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "name", value: query)
        ]
        
        guard let url = urlComponents.url else {
            throw NetworkError.badURL
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let characterData = try JSONDecoder().decode(CharacterData.self, from: data)
            return characterData.results
        } catch {
            throw NetworkError.decodingError
        }
    }
}
