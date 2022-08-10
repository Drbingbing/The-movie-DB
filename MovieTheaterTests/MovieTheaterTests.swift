//
//  MovieTheaterTests.swift
//  MovieTheaterTests
//
//  Created by Bing Bing on 2022/7/4.
//

import XCTest
import Combine
@testable import MovieTheater

class MovieTheaterTests: XCTestCase {

    private var readAccessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYjA2YTk1NjNmYWU3NDMwOTc2ZWYxYzg3NjQ3OTMxMyIsInN1YiI6IjYyYmFjYjI4MTJhYWJjMDYxYjYyNjg4ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vLIgZtntgNbfv79SmwSG1tLmS4vrk7lvbqMLsKVvF_U"
    private var cancellables: [AnyCancellable] = []
    var authClient: AuthClientProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.authClient = AuthClient()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.authClient = nil
        self.cancellables.removeAll()
    }

    func testRequestToken() {
        
        var requestToken: String?
        
        let expectation = XCTestExpectation(description: "should get request token")
        
        authClient.getRequestToken(with: readAccessToken)
            .catch { error in
                Empty(completeImmediately: true)
            }
            .sink { tokenResult in
                requestToken = tokenResult.token
                
                XCTAssertNotNil(requestToken, "fail to request token")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
}
