//
//  CharacterViewModel.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import Foundation

class CharacterViewModel: ObservableObject{
    @Published var characters: [Character] = []
    @Published var errorMessage: String?
    
    private let characterService: CharacterNetworkService
    
    init(characterService: CharacterNetworkService = CharacterNetworkService.shared) {
          self.characterService = characterService
      }
    
    func loadCharacters() async {
        do {
            characters = try await characterService.getAllCharacters()
        } catch {
            if let networkError = error as? NetworkError{
                errorMessage = networkError.localizedDescription
            } else {
                errorMessage = "An unexpected error occurred."
            }
        }
    }
}
