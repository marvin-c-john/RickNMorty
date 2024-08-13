//
//  Character.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import Foundation

struct CharacterData: Codable{
    let results: [Character]
}


struct Character: Codable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
}
