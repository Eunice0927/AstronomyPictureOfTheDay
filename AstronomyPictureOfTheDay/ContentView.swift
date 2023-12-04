//
//  ContentView.swift
//  AstronomyPictureOfTheDay
//
//  Created by Eunsu JEONG on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    @State var isMoving: Bool = false
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("blueAndPurpleGalaxyByJeremyThomas")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: isMoving ? -700 : 0, y: 0)
                    .animation(.linear(duration: 10).repeatForever())
                .ignoresSafeArea()}
        }
        .onAppear() {
            isMoving = true
        }
        .onDisappear() {
            isMoving = false
        }
    }
}

#Preview {
    ContentView()
}
