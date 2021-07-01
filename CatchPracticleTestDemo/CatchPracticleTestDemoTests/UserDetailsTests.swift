//
//  UserDetailsTests.swift
//  CatchPracticleTestDemoTests
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import XCTest
@testable import CatchPracticleTestDemo

class UserDetailsTests: XCTestCase {

    private var userDetailsViewModel : UserDetailViewModel!

    override func setUpWithError() throws {
        self.userDetailsViewModel = UserDetailViewModel(User.with())
    }

    override func tearDownWithError() throws {
        self.userDetailsViewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSuccessData() {
        XCTAssert(self.userDetailsViewModel.userModel.id == User.with().id)
    }
    
    func testFailData() {
        XCTAssert(self.userDetailsViewModel.userModel.id != -1)
    }
}
