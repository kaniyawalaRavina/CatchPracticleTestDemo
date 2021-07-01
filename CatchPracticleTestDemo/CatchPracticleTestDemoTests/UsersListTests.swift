//
//  UsersList.swift
//  CatchPracticleTestDemoTests
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import XCTest
@testable import CatchPracticleTestDemo

class UsersList: XCTestCase {
    
    private var usersViewModel : UsersViewModel!
    private var networkManager : NetworkManager!
    
    override func setUpWithError() throws {
        self.networkManager = NetworkManager()
        self.usersViewModel = UsersViewModel(self.networkManager)
    }
    
    override func tearDownWithError() throws {
        self.networkManager = nil
        self.usersViewModel = nil
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
    
    func testSuccessFetchData() {
        
        self.usersViewModel.fetchUsers()
        let exp = expectation(description: "Test after 2 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(self.usersViewModel.users.count > 0)
        } else {
            XCTFail("Delay interrupted or API time out")
        }
    }
    
    func testSuccessParser() {
        let json = """
      [
       {
      "id": 1,
        "title": "nonummy integer",
        "subtitle": "sapien arcu",
        "content": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi."
        }
      ]
      """.data(using: .utf8)!
        let users = try! JSONDecoder().decode(Users.self, from: json)
        XCTAssertNotNil(users)
        XCTAssertEqual(users.first?.id, 1)
    }
}

extension User {
    static func with(id: Int = 1,
                     title: String = "nonummy integer",
                     subtitle: String = "Swift MVVM subtitle",
                     content: String = "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.") -> User {
        return User(id: id, title: title, subtitle: subtitle, content: content)
    }
}
