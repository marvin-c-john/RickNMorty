//
//  SearchView.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import SwiftUI

struct SearchView: View {
   
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                 SearchbarView()
                    
                
                }
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
