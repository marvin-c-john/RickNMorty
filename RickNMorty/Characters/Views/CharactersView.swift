//
//  CharactersView.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var vm : CharacterViewModel
    let character: Character
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(0...10, id: \.self) {_ in
                        CardView(character: character)
                            .padding(.vertical, 5)
                    }
                    
                }
                .padding(.top)
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    CharactersView(vm: CharacterViewModel(), character: MockData.character[0])
}
