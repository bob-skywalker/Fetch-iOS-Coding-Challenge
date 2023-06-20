//
//  ContentView.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import SwiftUI
import Kingfisher //Kingfisher is used for image caching on user's device

struct ContentView: View {
    @StateObject var mealViewModel = MealViewModel()
    
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView(.vertical){
                    VStack{
                        ForEach(mealViewModel.desserts) { dessert in
                            NavigationLink {
                                DessertDetailView(dessert: dessert)
                            } label: {
                                HStack{
                                    KFImage(URL(string: dessert.strMealThumb))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.gray, lineWidth: 1)
                                                .shadow(color: .black, radius:4)
                                        )
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 10){
                                        HStack{
                                            Image(systemName: "clock.badge")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 13, height: 13)
                                            Text("3d")
                                                .font(Font.caption)
                                        }
                                        .foregroundColor(.red).bold()
                                        
                                        Text(dessert.strMeal)
                                            .font(Font.headline)
                                            .foregroundColor(.black)
                                        HStack{
                                            ForEach(0..<3) { _ in
                                                Image(systemName: "star.circle.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 20, height: 20)
                                                    .foregroundColor(.orange)
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: geo.size.height * 0.2)
                                .padding(.horizontal, 10)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 4, x: 0, y: 2)
                                .padding()
                                
                            }

                        }
                    }
                }
                .onAppear(perform: mealViewModel.fetchDesserts)
                .navigationTitle("Discover Meals")
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dessert = Dessert(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049")
               
               let mockViewModel = MealViewModel()
               mockViewModel.desserts = [dessert]
               
               let mockDetailViewModel = DessertDetailViewModel()
               mockDetailViewModel.detail = nil // Set the initial detail value to nil
               
               DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                   // Simulate the delay of fetching data from the API
                   let mockDessertDetail = DetailMeal(
                       idMeal: "53049",
                       strMeal: "Apam balik",
                       strDrinkAlternate: nil,
                       strCategory: "Food",
                       strArea: "Area",
                       strInstructions: "Instructions",
                       strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                       strTags: nil,
                       strYoutube: nil,
                       strIngredient1: nil,
                       strIngredient2: nil,
                       strIngredient3: nil,
                       strIngredient4: nil,
                       strIngredient5: nil,
                       strIngredient6: nil,
                       strIngredient7: nil,
                       strIngredient8: nil,
                       strIngredient9: nil,
                       strIngredient10: nil,
                       strIngredient11: nil,
                       strIngredient12: nil,
                       strIngredient13: nil,
                       strIngredient14: nil,
                       strIngredient15: nil,
                       strIngredient16: nil,
                       strIngredient17: nil,
                       strIngredient18: nil,
                       strIngredient19: nil,
                       strIngredient20: nil,
                       strMeasure1: nil,
                       strMeasure2: nil,
                       strMeasure3: nil,
                       strMeasure4: nil,
                       strMeasure5: nil,
                       strMeasure6: nil,
                       strMeasure7: nil,
                       strMeasure8: nil,
                       strMeasure9: nil,
                       strMeasure10: nil,
                       strMeasure11: nil,
                       strMeasure12: nil,
                       strMeasure13: nil,
                       strMeasure14: nil,
                       strMeasure15: nil,
                       strMeasure16: nil,
                       strMeasure17: nil,
                       strMeasure18: nil,
                       strMeasure19: nil,
                       strMeasure20: nil,
                       strSource: nil,
                       strImageSource: nil,
                       strCreativeCommonsConfirmed: nil,
                       dateModified: nil
                   )
                   mockDetailViewModel.detail = mockDessertDetail // Assign the mock detail value
               }
               
               return ContentView()
                   .environmentObject(mockViewModel)
                   .environmentObject(mockDetailViewModel)
    }
}
