//
//  TriangularDistribution.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/17/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "TriangularDistribution.h"

@implementation TriangularDistribution

//
//  Algoritm: X = a + (b - a) * max(R1,R2)
//  R1, R2 - random numbers in [0,1]
//

+ (NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)a :(double)b{

    NSMutableArray* result = [[NSMutableArray alloc] init];

    for (int j = 0; j < randomNumbers.count; j++) {

        int r = arc4random() % randomNumbers.count;
        double r1 = [randomNumbers[r] doubleValue];
        r = arc4random() % randomNumbers.count;
        double r2 = [randomNumbers[r] doubleValue];

        [result addObject:[NSNumber numberWithDouble: (a + (b - a) * [self max:r1 :r2]) ]];
    }

//    for (int j = 0; j < randomNumbers.count; j++) {
//
//        int r = arc4random() % randomNumbers.count;
//        double r1 = [randomNumbers[r] doubleValue];
//        r = arc4random() % randomNumbers.count;
//        double r2 = [randomNumbers[r] doubleValue];
//
//        [result addObject:[NSNumber numberWithDouble: (a + (b - a) * [self min:r1 :r2]) ]];
//    }
    return result;
    
}

+ (double) max: (double)r1 : (double)r2{
    if (r1 > r2){
        return r1;
    } else {
        return r2;
    }
}
+ (double) min: (double)r1 : (double)r2{
    if (r1 < r2){
        return r1;
    } else {
        return r2;
    }
}

@end
