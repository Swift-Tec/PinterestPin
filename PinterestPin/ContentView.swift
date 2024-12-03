//
//  ContentView.swift
//  PinterestPin
//
//  Created by Hector Arroyo on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isSaved: Bool = false
    @State private var bounce: Bool = false
    @State private var zoomScale: CGFloat = 1.0
     
    var body: some View {
        VStack {
            Image("testPin2")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaleEffect(zoomScale)
                .cornerRadius(20)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            zoomScale = value
                        }
                        .onEnded { _ in
                            withAnimation(
                                Animation.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5)
                            ) {
                                zoomScale = 1.0
                            }
                        }
                )
                .scaleEffect(zoomScale)
                .accessibilityLabel("Image of a watch")
                .padding(.bottom, 10)
            
            HStack(spacing: 20) {
                Button(action: {
                    print("Liked")
                }) {
                    Image(systemName: "heart")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .accessibilityLabel("Like this pin")
                
                Button(action: {
                    print("Commented!")
                }) {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .accessibilityLabel("Comment on this pin")
                
                Button(action: {
                    print("Shared!")
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .accessibilityLabel("Share this pin")
                
                Button(action: {
                    print("Options opened!")
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .accessibilityLabel("More options")

                Spacer()
                
                Button(action: {
                    isSaved.toggle()
                    bounce = true
                    withAnimation(
                        Animation.spring(response: 0.3,
                                         dampingFraction: 0.3,
                                         blendDuration: 0.5)
                        .repeatCount(3, autoreverses: true)
                    ) {
                        bounce = false
                    }
                }) {
                    Text(isSaved ? "Saved" : "Save")
                        .padding(.horizontal, 17)
                        .padding(.vertical, 10)
                        .background(isSaved ? Color.black : Color.red)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .scaleEffect(bounce ? 1.1 : 1.0)
                }
                .accessibilityLabel(isSaved ? "Pin saved" : "Save this pin")
            }
            
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "person.circle")
                                .foregroundColor(.gray)
                                .font(.title3)
                    Text("PinterestLuvr49")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        
                }
                
                Text("Jean-Philippe Delhomme")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Jean-Philippe Delhomme, Paris based fashion illustrator, painter and cultural writer")
                    .font(.title3)
                    .lineLimit(2)
                    .accessibilityLabel("Description of the pin content.")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
