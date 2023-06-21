//
//  MealViewModel_Tests.swift
//  Fetch-iOS-Coding-Challenge_Tests
//
//  Created by bo zhong on 6/20/23.
//


// Naming Strucutre: test_UnitOfWork_StandUnderTest_ExpectedBehavior

import XCTest
import Combine
@testable import Fetch_iOS_Coding_Challenge

final class MealViewModel_Tests: XCTestCase {
    
    var viewModel: MealViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewModel = MealViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        viewModel = nil
    }

    func test_MealViewModel_desserts_shouldBeEmpty(){
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        
        // Then
        XCTAssertTrue(vm.desserts.isEmpty)
        XCTAssertEqual(vm.desserts.count, 0)
    }
    
    func test_mealViewModel_desserts_shouldAddItems(){
        
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        let loopCount: Int = Int.random(in: 10...20)
        for _ in 0..<loopCount {
            vm.desserts.append(Dessert(strMeal: UUID().uuidString, strMealThumb: UUID().uuidString, idMeal: UUID().uuidString))
        }
        
        
        // Then
        XCTAssertTrue(!vm.desserts.isEmpty)
        XCTAssertFalse(vm.desserts.isEmpty)
        XCTAssertEqual(vm.desserts.count, loopCount)
        XCTAssertGreaterThan(vm.desserts.count, 0)
        XCTAssertNotEqual(vm.desserts.count, 0)
    }
    
    
    func test_mealViewModel_fetchDesserts_shouldReturnItems(){
        
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        let expectation = XCTestExpectation(description: "Should return items after a second.")
        
        vm.$desserts
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.fetchDesserts()
        
        // Then
        wait(for: [expectation], timeout: 3)
        XCTAssertGreaterThan(vm.desserts.count, 0)
        
    }
    
    

}
