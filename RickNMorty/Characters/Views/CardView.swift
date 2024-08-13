//
//  CardView.swift
//  RickNMorty
//
//  Created by Marvin John on 12.08.24.
//

import SwiftUI

struct CardView: View {
    
    let character: Character
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.darkslategray)
                    .frame(height: 150)
                    .padding(.horizontal)
                
                    .overlay(alignment: .leading) {
                        // Image
                        
                        if let url = URL(string: character.image) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150)
                                    .frame(width: 180)
                                    .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 150)
                            .frame(width: UIScreen.main.bounds.height / 5)
                            .padding()
                        } else {
                            Color.gray // Platzhalter, wenn URL ungültig ist
                                .frame(height: 130)
                                .frame(width: UIScreen.main.bounds.height / 5)
                                .padding()
                        }
                        
                    }
            }
            VStack(alignment: .leading, spacing: 20) {
                Text(character.name)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 100, alignment: .leading)
                
                HStack{
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                    
                    Text("\(character.status) -")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(character.species)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(width: 150, alignment: .leading)
                
                Text(character.gender)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
            .offset(x: 90)
           
        }
        
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomRoundedCorners(radius: radius, corners: corners))
    }
}

#Preview {
    CardView(character: MockData.character[0])
}


