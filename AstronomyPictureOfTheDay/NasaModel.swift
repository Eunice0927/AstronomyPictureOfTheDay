//
//  NasaModel.swift
//  AstronomyPictureOfTheDay
//
//  Created by Eunsu JEONG on 12/4/23.
//

import SwiftUI

struct Nasa: Codable {
    let copyright, date, explanation: String
    let hdurl: String?
    let mediaType, serviceVersion, title: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
