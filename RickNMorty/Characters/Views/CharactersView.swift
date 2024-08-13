//
//  CharactersView.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var vm: CharacterViewModel
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(vm.characters) { character in
                        CardView(character: character)
                            .padding(.vertical, 7)
                    }
                    
                }
                .padding(.top)
            }
            .navigationTitle("Characters")
            .background(Color.darkslategray2)
            .onAppear{
                Task{
                  await vm.loadCharacters()
                }
            }
        }
    }
}

#Preview {
    CharactersView(vm: CharacterViewModel())
}
