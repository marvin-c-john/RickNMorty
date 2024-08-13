//
//  SearchbarView.swift
//  RickNMorty
//
//  Created by Marvin John on 13.08.24.
//

import SwiftUI

struct SearchbarView: View {
    @State var text: String = ""
    var body: some View {
        VStack{
            TextField("Search Character", text: $text)
                .padding()
                .padding(.leading, 30)
                .overlay(alignment: .leading, content: {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading)
                })
                .background(Color.darkslategray)
                .cornerRadius(10)
                .padding()
        }
    }
}

#Preview {
    SearchbarView()
}
