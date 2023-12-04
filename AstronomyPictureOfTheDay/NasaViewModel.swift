//
//  NasaApi.swift
//  AstronomyPictureOfTheDay
//
//  Created by Eunsu JEONG on 12/4/23.
//

import SwiftUI

class NasaViewModel: ObservableObject {
    static let shared = NasaViewModel()
    
    @Published var copyright = String()
    @Published var date = String()
    @Published var explanation = String()
    @Published var mediaType = String()
    @Published var title = String()
    @Published var sourceUrl: String?
    @Published var videoID: String?
    
    private init() { }
    
    private var apiKey: String? {
        get { getValueOfPlistFile("ApiKeys", "NASA_API_KEY") }
    }
    
    func fetchData(_ date: String) {
        guard let apiKey = apiKey else { return }
        
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)&date=\(date)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                self.copyright = ""
                self.date = ""
                self.explanation = ""
                self.mediaType = ""
                self.title = ""
                self.sourceUrl = ""
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            let str = String(decoding: data, as: UTF8.self)
            print(str)
            do {
                let apiResponse = try JSONDecoder().decode(Nasa.self, from: data)
                
                // 잠시 기다렸다가 posts의 값이 변경이 있으면 다시 작동한다.
                DispatchQueue.main.async {
                    self.copyright = apiResponse.copyright
                    self.date = apiResponse.date
                    self.explanation = apiResponse.explanation
                    self.mediaType = apiResponse.mediaType
                    self.title = apiResponse.title
                    self.sourceUrl = apiResponse.url
                    self.videoID = self.getYoutubeId(youtubeUrl: apiResponse.url ?? "")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getYoutubeId(youtubeUrl: String) -> String? {
        let startIndex = youtubeUrl.index(after: youtubeUrl.lastIndex(of: "/")!)
        let spaceHolder = youtubeUrl.index(after: startIndex)
        let endindex = youtubeUrl.lastIndex(of: "?") ?? youtubeUrl.firstIndex(of: "=")
        
        let id = String(youtubeUrl[startIndex..<(endindex ?? spaceHolder)])
        print(id)
        return id
    }
}
