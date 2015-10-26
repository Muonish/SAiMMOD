//
//  SAiMM_lab1Tests.m
//  SAiMM_lab1Tests
//
//  Created by Valeryia Breshko on 9/3/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface SAiMM_lab1Tests : XCTestCase

@end

@implementation SAiMM_lab1Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
