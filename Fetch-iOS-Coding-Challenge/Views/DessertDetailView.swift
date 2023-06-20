//
//  DessertDetailView.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import SwiftUI
import Kingfisher //Kingfisher is used for image caching on user's device

struct DessertDetailView: View {
    var dessert: Dessert
    @EnvironmentObject var detailViewModel: DessertDetailViewModel
    @State private var ingredientTapClicked: Bool = false
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                LinearGradient(colors: [.orange, .indigo, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                if let detail = detailViewModel.detail {
                    
                    VStack(spacing: 25){
                        Text(detailViewModel.detail?.strMeal ?? "N/A")
                            .font(Font.title).bold()
                        KFImage(URL(string: dessert.strMealThumb))
                            .resizable()
                            .scaledToFit()
                            .clipShape(Capsule())
                        VStack(spacing: 10){
                            Text("Instruction")
                                .font(Font.headline).bold()
                            ScrollView(.vertical){
                                Text(detailViewModel.detail?.strInstructions ?? "No Instruction")
                            }
                        }
                        
                        Text("Click For Ingredients")
                            .padding(.top, 20)
                            .font(Font.title2)
                            .foregroundColor(.blue).bold()
                            .onTapGesture {
                                ingredientTapClicked = true
                            }
                    }
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.96)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                } else {
                    ProgressView()
                }
            }
            .sheet(isPresented: $ingredientTapClicked) {
                ZStack {
                    LinearGradient(colors: [.blue, .indigo, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 30){
                        Text("\(dessert.strMeal) \n Ingredients")
                            .font(.largeTitle).bold()
                        Text(detailViewModel.detail?.ingredientsDescription ?? "No Ingredient")
                            .font(.title2)
                        Text("Return")
                            .foregroundColor(.white).bold()
                            .padding(.horizontal, 50)
                            .padding(.vertical,14)
                            .background(.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .frame(width: 200, height: 100)
                            .onTapGesture {
                                ingredientTapClicked = false
                            }
                    }
                }
            }
        }
        .onAppear(perform: {
            detailViewModel.fetchDessertDetail(with: dessert.idMeal)
        })
    }
    
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dessert = Dessert(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049")
        
        let mockViewModel = DessertDetailViewModel()
        mockViewModel.detail = DetailMeal(idMeal: "53049", strMeal: "Apam balik", strDrinkAlternate: nil, strCategory: "Dessert", strArea: "British", strInstructions: "Instructions", strMealThumb: "Thumbnail", strTags: "Cake,Sweet", strYoutube: nil, strIngredient1: "Butter", strIngredient2: "Caster Sugar", strIngredient3: "Self-raising Flour", strIngredient4: "Almonds", strIngredient5: "Baking Powder", strIngredient6: "Eggs", strIngredient7: "Vanilla Extract", strIngredient8: "Almond Extract", strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "175g", strMeasure2: "175g", strMeasure3: "140g", strMeasure4: "50g", strMeasure5: "½ tsp", strMeasure6: "3 Medium", strMeasure7: "½ tsp", strMeasure8: "¼ teaspoon", strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil, strSource: nil, strImageSource: nil, strCreativeCommonsConfirmed: nil, dateModified: nil)

        mockViewModel.fetchDessertDetail(with: dessert.idMeal)
        
        return DessertDetailView(dessert: dessert)
            .environmentObject(mockViewModel)
    }
}
