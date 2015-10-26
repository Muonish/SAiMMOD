//
//  SimpsonDistribution.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/17/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "SimpsonDistribution.h"

@implementation SimpsonDistribution

//
//  Algoritm: X = y + z
//  y, z - random numbers in [a/2,b/2]
//


+(NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)a :(double)b{
    NSMutableArray* result = [[NSMutableArray alloc] init];

    NSMutableArray* y = [UniformDistribution generateSequenceWithRandomNumbers:randomNumbers :a/2  :b/2];
    //NSMutableArray* lemer = [LemerProducer generateSequenceA:CONST_A m:CONST_M Rp:CONST_Rp];
    //NSMutableArray* z = [UniformDistribution generateSequenceWithRandomNumbers:lemer :a/2  :b/2];
    

    for (int i = 0; i < randomNumbers.count; i++) {
        int r1 = arc4random() % randomNumbers.count;
        int r2 = arc4random() % randomNumbers.count;

        [result addObject:[NSNumber numberWithDouble: [y[r1] doubleValue]  + [y[r2] doubleValue] ]];
    }
    return result;
}

@end
