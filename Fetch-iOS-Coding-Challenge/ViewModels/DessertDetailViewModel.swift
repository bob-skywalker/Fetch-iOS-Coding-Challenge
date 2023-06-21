//
//  DessertDetailViewModel.swift
//  Fetch-iOS-Coding-Challenge
//
//  Created by bo zhong on 6/20/23.
//

import Foundation
import Combine

class DessertDetailViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    @Published var detail: DetailMeal? {
        
        // property observer for debugging.
        didSet{
            print(detail ?? "N/A")
        }
    }
    
    func fetchDessertDetail(with mealId: String){
        guard let urlString = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: urlString)
            .tryMap { completion in
                guard let response = completion.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return completion.data
            }
            .decode(type: DetailResponse.self, decoder: JSONDecoder())
            .map{ $0.meals.first }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)!")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] receivedDetail in
                self?.detail = receivedDetail
            })
            .store(in: &cancellables)
    }
}
