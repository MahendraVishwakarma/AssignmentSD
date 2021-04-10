//
//  UserDataModelTest.swift
//  SaadiCodeTests
//
//  Created by Mahendra Vishwakarma on 10/04/21.
//

import XCTest
@testable import SaadiCode

class UserDataModelTest: XCTestCase {

    var user: UserStructure?
    
    // MARK: - Set Up & Tear Down
    override func setUpWithError() throws {
        do {
            user = try UserStructure(id: 0, name: "", username: "nil", email: "", address: nil, phone: "", website: "", company: nil)
            
        } catch let error {
            assertionFailure("failed to decode: \(error)")
        }
       
       
    }
    override func tearDownWithError() throws {
       user = nil
    }
    
    //MARK:- check user assigned memory or not
    func testUser() throws {
        assert(user != nil, "user is assined memory")
    }
    
    //MARK:- check id
    func testID() throws {
        assert(user?.id == 0, "success")
    }
//MARK:- testing all properties according to task
   /*
     - we can test all other properties of use data model
     - we can test its memory intialization
     - we can test negative cases on having put wrong value like id < 0 or nil, username = nil
     - i have written test case for id only. but we can write all other cases.
     
     */

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
