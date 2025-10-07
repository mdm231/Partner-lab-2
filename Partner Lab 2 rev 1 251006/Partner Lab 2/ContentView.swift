//
//  ContentView.swift
//  Partner Lab 2
//  Group 13
//  Created by Mike McGlinchy and Kai Fang on 10/6/25.
//

import SwiftUI


struct ContentView: View {
    // Array of booleans, one for each of the 12 images, initialized to 'true' (covered)
    @State private var isCovered: [Bool] = Array(repeating: true, count: 12)

    var body: some View {
        VStack {
            Text("Game")
                .font(.title)

            Spacer()

            // Grid of 12 images
            VStack(spacing: 10) {
                ForEach(0..<4) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<3) { column in
                            let index = row * 3 + column
                            ZStack {
                                // ZStack to layer the image and the cover
                                Image("flower\(index + 1)")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)

                                // The cover view is only shown if its corresponding boolean is true
                                if isCovered[index] {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                        .transition(.opacity)
                                }
                            }
                            // Add the tap gesture to each ZStack
                            .onTapGesture {
                                withAnimation {
                                    // Toggle the boolean at the specific index to cover/uncover the individual image
                                    isCovered[index].toggle()
                                }
                            }
                        }
                    }
                }
            }
            .padding()

            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
