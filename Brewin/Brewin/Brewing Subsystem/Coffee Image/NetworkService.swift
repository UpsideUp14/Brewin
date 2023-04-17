//
//  NetworkService.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 16.04.23.
//

import Foundation

// Network service for fetching and decoding data from api for coffee images
class NetworkService {
    private static let serverURL = URL(string: "https://coffee.alexflipnote.dev/random.json")!
    static var decoder = JSONDecoder()
    static func getImageURLData() async throws -> ImageURLData {
        let (data, _) = try await URLSession.shared.data(from: serverURL)
        return try decoder.decode(ImageURLData.self, from: data)
    }
}
