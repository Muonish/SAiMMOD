//
//  Estimates.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/7/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Estimates : NSObject

+ (double)calculateExpectedValue: (NSArray*) numbers;
+ (double)calculateDispersion: (NSArray*) numbers;
+ (double)calculateStandardDeviation: (NSArray*) numbers;
+ (double)checkUniformity: (NSArray*) numbers;

@end
