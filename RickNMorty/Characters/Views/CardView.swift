//
//  CardView.swift
//  RickNMorty
//
//  Created by Marvin John on 12.08.24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .center) {
            VStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.darkslategray)
                    .frame(height: 200)
                    .padding()

                    .overlay(alignment: .leading) {
                        // Image
                        Rectangle()
                            .frame(height: 200)
                            .frame(width: UIScreen.main.bounds.height / 5)
                            .cornerRadius(20,  corners: [.topLeft, .bottomLeft])
                            .padding()
                    }
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Summer Smith")
                    .font(.headline)
                .foregroundStyle(.white)
                
                HStack{
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                        
                    Text("Alive -")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text("Human")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                
                Text("Human")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
            .offset(x: 60, y: -15)
        }
        
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomRoundedCorners(radius: radius, corners: corners))
    }
}

#Preview {
    CardView()
}
