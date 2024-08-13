//
//  ContentView.swift
//  RickNMorty
//
//  Created by Marvin John on 12.08.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var characterViewModel = CharacterViewModel()
    var body: some View {
        TabView{
            CharactersView(vm: characterViewModel)
                .tabItem {
                    Label("Characters", systemImage: "person" )
                }
        }
        .tint(.gray)
    }
}

#Preview {
    ContentView()
}
