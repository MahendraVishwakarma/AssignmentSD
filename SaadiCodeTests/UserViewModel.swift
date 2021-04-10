//
//  UserViewModel.swift
//  SaadiCodeTests
//
//  Created by Mahendra Vishwakarma on 10/04/21.
//

import XCTest
@testable import SaadiCode

class UserViewModelTests: XCTestCase {

    // MARK: - Properties
    var viewModel: UserViewModel! // an implicitly unwrapped to crash and burns

    // MARK: - Set Up & Tear Down
    override func setUpWithError() throws {
        // Initialize View Model
        viewModel = UserViewModel()
        viewModel.delegate = self //make coment/uncomment to check fetchMethod is called or not
        
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    //MARK:- Test viewmodel is nil or not?
    func testViewModel() throws {
        XCTAssertNotNil(viewModel)
    }
    //MARK:- Test delegate is nil or not?
    func testDelegate() throws {
        XCTAssertNotNil(viewModel.delegate)
    }
    
    //MARK:- Test Fetch method is called or not?
    func testFetchMethodCalled() throws {
        do {
            _ = try viewModel.fetchUsersData()
            XCTAssertTrue(true, "fetchUsersData method is called successfully")
        } catch(let error) {
           XCTAssertThrowsError(error)
            
        }
    }
    //MARK:- Test user list array is nil or not?
    func testUserList() throws {
        XCTAssertNil(viewModel.userList, "user list is nil")
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension UserViewModelTests: UserListUpdate {
    func updateList(status: Bool) {
        XCTAssertTrue(status, "api called successfully")
    }
    
    
}
