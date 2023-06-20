//
//  DessertDetailView.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import SwiftUI
import Kingfisher

struct DessertDetailView: View {
    var dessert: Dessert
    @EnvironmentObject var detailViewModel: DessertDetailViewModel
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                LinearGradient(colors: [.orange, .indigo, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 25){
                    Text(detailViewModel.detail?.strMeal ?? "N/A")
                        .font(Font.title).bold()
                    KFImage(URL(string: dessert.strMealThumb))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Capsule())
                    
                    Text(detailViewModel.detail?.strInstructions ?? "No Instruction")
                }
                .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.92)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .onAppear(perform: {
                detailViewModel.fetchDessertDetail(with: dessert.idMeal)
            })
        }
    }
    

}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dessert = Dessert(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049")
        
        let mockViewModel = DessertDetailViewModel()
        mockViewModel.detail = DetailMeal(idMeal: "53049", strMeal: "Apam balik", strDrinkAlternate: nil, strCategory: "Food", strArea: "Area", strInstructions: "Instructions", strMealThumb: "Thumbnail", strTags: nil, strYoutube: nil, strIngredient1: nil, strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil, strSource: nil, strImageSource: nil, strCreativeCommonsConfirmed: nil, dateModified: nil)
                mockViewModel.fetchDessertDetail(with: dessert.idMeal)
        
        return DessertDetailView(dessert: dessert)
            .environmentObject(mockViewModel)
    }
}
