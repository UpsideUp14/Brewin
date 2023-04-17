//
//  CoffeeImage.swift
//  Brewin
//
//  Created by Alvian Sulungbudi on 16.04.23.
//

import Foundation
import SwiftUI
import os

// Shows a different image of coffee taken from an api to fill the empty space
struct CoffeeImage: View {
    @State private var url: URL?
    var logger = Logger(subsystem: "Brewing Subsystem", category: "Coffee Image Display")
    var body: some View {
        if let url = url {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .shadow(radius: 5)
                    .frame(height: 450)
            } placeholder: {
                ProgressView()
            }
        } else {
            ProgressView()
                .task {
                    url = try? await getImage()
                }
        }
    }
    private func getImage() async throws -> URL {
        let url = try await NetworkService.getImageURLData().file
        logger.log("fetched url data for \(url)")
        return url
    }
}

struct ImageURLData: Codable {
    var file: URL
}
