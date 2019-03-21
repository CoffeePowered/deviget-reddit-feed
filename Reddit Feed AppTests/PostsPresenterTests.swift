//
//  PostsPresenterTests.swift
//  Reddit Feed AppTests
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import XCTest
@testable import Reddit_Feed_App

class PostsPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresenter() {
        let mockRepository = MockPostsRepository()
        mockRepository.posts = [Post()]
        let testPresenter = PostsPresenter(with: mockRepository)
        
        let expectation = self.expectation(description: "presenterFetch")
        testPresenter.refreshPosts(view: <#T##PostsViewing#>, completion: {
            XCTAssert(testPresenter.postsCount() == 1, "The postsCount method should return 1")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
