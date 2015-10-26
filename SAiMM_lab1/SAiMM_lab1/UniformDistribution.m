//
//  UniformDistribution.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/16/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import "UniformDistribution.h"

@implementation UniformDistribution

//
//  Algoritm: X = a + (b - a) * R
//  R - random number in [0,1]
//

+(NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)a :(double)b{
    NSMutableArray* result = [[NSMutableArray alloc] init];

    for (NSNumber* number in randomNumbers) {
        [result addObject:[NSNumber numberWithDouble:(a + (b - a) * number.doubleValue)]];
    }
    return result;
}

@end
