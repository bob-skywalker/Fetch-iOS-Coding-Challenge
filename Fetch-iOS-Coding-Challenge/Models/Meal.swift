//
//  Dessert.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import Foundation


struct Meal: Codable{
    let meals: [Dessert]
}

struct Dessert: Codable, Identifiable {
    let id = UUID()
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
