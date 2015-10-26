//
//  ExponentialDistribution.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/17/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "ExponentialDistribution.h"

@implementation ExponentialDistribution

//
//  Algoritm: X = -1/lambda * ln(R)
//  R - random number in [0,1]
//

+(NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)lambda{
    NSMutableArray* result = [[NSMutableArray alloc] init];

    for (NSNumber* number in randomNumbers) {
        [result addObject:[NSNumber numberWithDouble:(-1.0/lambda * log(number.doubleValue))]];
    }
    return result;

}

@end
