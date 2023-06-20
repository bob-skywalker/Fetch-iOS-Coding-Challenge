//
//  ContentView.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @StateObject var mealViewModel = MealViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 140))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                LazyVGrid(columns: columns) {
                    ForEach(mealViewModel.desserts) { dessert in
                        Text(dessert.strMeal)
                    }
                }
            }
            .onAppear(perform: mealViewModel.fetchDesserts)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
