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
        ContentView()
    }
}
