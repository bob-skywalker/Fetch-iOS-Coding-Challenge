//
//  DessertDetailViewModel_Tests.swift
//  Fetch-iOS-Coding-Challenge_Tests
//
//  Created by Bo Zhong on 6/21/23.
//

import XCTest
import Combine
@testable import Fetch_iOS_Coding_Challenge

final class DessertDetailViewModel_Tests: XCTestCase {
    
    var viewModel: DessertDetailViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewModel = DessertDetailViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        viewModel = nil
    }
    
    func test_DessertDetailViewModel_detail_shouldInitAsNil(){
        
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        
        // Then
        XCTAssertNil(vm.detail)
    }
    
    func test_DessertDetailViewModel_detail_shouldAddItems() {
        
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.detail = DetailMeal(idMeal: UUID().uuidString, strMeal: UUID().uuidString, strDrinkAlternate: UUID().uuidString, strCategory: UUID().uuidString, strArea: UUID().uuidString, strInstructions: UUID().uuidString, strMealThumb: UUID().uuidString, strTags: UUID().uuidString, strYoutube: UUID().uuidString, strIngredient1: UUID().uuidString, strIngredient2: UUID().uuidString, strIngredient3: UUID().uuidString, strIngredient4: UUID().uuidString, strIngredient5: UUID().uuidString, strIngredient6: UUID().uuidString, strIngredient7: UUID().uuidString, strIngredient8: UUID().uuidString, strIngredient9: UUID().uuidString, strIngredient10: UUID().uuidString, strIngredient11: UUID().uuidString, strIngredient12: UUID().uuidString, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: UUID().uuidString, strIngredient18: nil, strIngredient19: UUID().uuidString, strIngredient20: nil, strMeasure1: nil, strMeasure2: UUID().uuidString, strMeasure3: nil, strMeasure4: UUID().uuidString, strMeasure5: nil, strMeasure6: UUID().uuidString, strMeasure7: nil, strMeasure8: UUID().uuidString, strMeasure9: UUID().uuidString, strMeasure10: UUID().uuidString, strMeasure11: UUID().uuidString, strMeasure12: UUID().uuidString, strMeasure13: UUID().uuidString, strMeasure14: UUID().uuidString, strMeasure15: UUID().uuidString, strMeasure16: UUID().uuidString, strMeasure17: UUID().uuidString, strMeasure18: UUID().uuidString, strMeasure19: UUID().uuidString, strMeasure20: UUID().uuidString, strSource: UUID().uuidString, strImageSource: UUID().uuidString, strCreativeCommonsConfirmed: UUID().uuidString, dateModified: UUID().uuidString)
        
        // Then
        XCTAssertTrue(vm.detail != nil)
        XCTAssertFalse(vm.detail == nil)
        
    }
    
    func test_DessertDetailViewModel_fetchDessertDetail_shouldReturnItems(){
        
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        let testMealId = "53049" // test case for Apam balik
        let expectation = XCTestExpectation(description: "Should return items after a second.")
        vm.$detail
            .dropFirst()
            .sink { returnedItem in
                expectation.fulfill()
            }
            .store(in: &cancellables
            )
        vm.fetchDessertDetail(with: testMealId)

        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertTrue(vm.detail != nil)
        XCTAssertFalse(vm.detail == nil)
    }

}
