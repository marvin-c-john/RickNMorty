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
                    .frame(height: 130)
                    .padding(.horizontal)

                    .overlay(alignment: .leading) {
                        // Image
                        Rectangle()
                            .frame(height: 130)
                            .frame(width: UIScreen.main.bounds.height / 5)
                            .cornerRadius(20,  corners: [.topLeft, .bottomLeft])
                            .padding()
                    }
            }
            VStack(alignment: .leading, spacing: 20) {
                Text(character.name)
                    .font(.headline)
                .foregroundStyle(.white)
                
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
                
                Text(character.gender)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
            .offset(x: 60)
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
