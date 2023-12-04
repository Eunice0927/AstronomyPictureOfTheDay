//
//  ContentView.swift
//  AstronomyPictureOfTheDay
//
//  Created by Eunsu JEONG on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nasaApi = NasaViewModel.shared
    @State var isMoving: Bool = false
    @State private var selectedDate = Date()
    @State var formattedDate = String()
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("blueAndPurpleGalaxyByJeremyThomas")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: isMoving ? -700 : 0, y: 0)
                    .animation(.linear(duration: 20).repeatForever(), value: isMoving)
                    .ignoresSafeArea()
            }
            
            VStack {
                Spacer()
                
                Text("Select a date of \n when you want to see \n the universe")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundStyle(.white)
                
                DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .colorInvert()
                
                Spacer().frame(height: 50)
                
                ZStack {
                    
                    Button {
                        formattedDate = setDate(selectedDate)
                        nasaApi.fetchData(formattedDate)
                    } label: {
                        Text("Go")
                            .frame(width: 83, height: 47)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                            .opacity(0.54)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
                
                Spacer().frame(height: 100)
            }
            .onAppear() {
                isMoving = true
            }
            .onDisappear() {
                isMoving = false
            }
        }
    }
    
    func setDate(_ selectedDate: Date) -> String {
        let year = selectedDate.formatted(Date.FormatStyle().year(.defaultDigits))
        let day = selectedDate.formatted(Date.FormatStyle().day(.twoDigits))
        let month = selectedDate.formatted(Date.FormatStyle().month(.twoDigits))
        
        print("\(year)-\(month)-\(day)")
        return "\(year)-\(month)-\(day)"
    }
}

#Preview {
    ContentView()
}
