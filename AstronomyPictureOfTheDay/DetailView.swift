//
//  DetailView.swift
//  AstronomyPictureOfTheDay
//
//  Created by Eunsu JEONG on 12/4/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var nasaApi = NasaViewModel.shared
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.black)
                .ignoresSafeArea()
            
            VStack {
                Text(nasaApi.title)
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundStyle(.white)
                
                GeometryReader { geo in
                    if nasaApi.mediaType == "video" {

                    } else {
                        AsyncImage(url: URL(string: nasaApi.sourceUrl ?? "")) { image in
                            image.resizable()
                                .frame(width: geo.size.width)
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ZStack {
                                Rectangle()
                                    .frame(width: geo.size.width)
                                
                                HStack(alignment: .center) {
                                    LoadingView()
                                    LoadingView(delay: 0.2)
                                    LoadingView(delay: 0.4)
                                }
                            } //ZStack
                        }
                    }
                } // video or image view
                
                ScrollView {
                    Text(nasaApi.explanation)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                    
                    HStack {
                        Spacer()
                        
                        Text("photo Ⓒ \(nasaApi.copyright)")
                            .foregroundStyle(.gray)
                    } //HStack
                } //ScrollView
            } //VStack
        } //ZStack
    }
}

struct LoadingView: View {
    @State var delay: Double = 0
    @State var scale: CGFloat = 0.5
    
    var body: some View {
        Circle()
            .frame(width: 40, height: 40)
            .foregroundStyle(.white)
            .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 0.6).repeatForever().delay(delay))
            .onAppear {
                withAnimation {
                    self.scale = 1
                }
            }
    }
}

#Preview {
    DetailView()
}
