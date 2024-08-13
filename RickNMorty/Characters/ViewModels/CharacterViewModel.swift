//
//  CharacterViewModel.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var errorMessage: String?

    private let characterService: CharacterNetworkService
    
    init(characterService: CharacterNetworkService = CharacterNetworkService.shared) {
        self.characterService = characterService
    }
    
    func loadCharacters() async {
        do {
            let characters = try await characterService.getAllCharacters()
            DispatchQueue.main.async {
                self.characters = characters
            }
        } catch {
            DispatchQueue.main.async {
                if let networkError = error as? NetworkError {
                    self.errorMessage = networkError.localizedDescription
                } else {
                    self.errorMessage = "An unexpected error occurred."
                }
            }
        }
    }
}
