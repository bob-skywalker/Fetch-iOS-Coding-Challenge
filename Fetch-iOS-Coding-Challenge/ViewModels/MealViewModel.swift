//
//  MealViewModel.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import Foundation
import Combine


class MealViewModel: ObservableObject {
    @Published var desserts = [Dessert]()
    var cancellables = Set<AnyCancellable>()
    
    func fetchDesserts(){
        guard let urlString = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return }
        
        URLSession.shared.dataTaskPublisher(for: urlString)
            .tryMap { completion in
                guard let response = completion.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return completion.data
            }
            .decode(type: Meal.self, decoder: JSONDecoder())
            .map { $0.meals }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)!")
                    return
                case .finished:
                    break
                }
            }, receiveValue: { [weak self]  receivedItems in
                self?.desserts = receivedItems
            })
            .store(in: &cancellables)
    }
    
}
