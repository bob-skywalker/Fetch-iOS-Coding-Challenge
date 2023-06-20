//
//  Fetch_iOS_Coding_ChallengeApp.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import SwiftUI

@main
struct Fetch_iOS_Coding_ChallengeApp: App {
    @StateObject var detailViewModel = DessertDetailViewModel()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(detailViewModel)
        }
    }
}
