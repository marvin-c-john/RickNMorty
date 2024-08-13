//
//  CharactersView.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import SwiftUI

struct CharactersView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    CardView()
                }
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    CharactersView()
}
