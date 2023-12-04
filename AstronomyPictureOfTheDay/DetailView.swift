//
//  DetailView.swift
//  AstronomyPictureOfTheDay
//
//  Created by Eunsu JEONG on 12/4/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var nasaApi = NasaViewModel.shared
    
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
                            }
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

#Preview {
    DetailView()
}
