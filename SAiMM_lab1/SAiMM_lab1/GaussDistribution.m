//
//  GaussDistribution.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/16/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "GaussDistribution.h"
#define LENGTH 6

@implementation GaussDistribution

//
//  Algoritm: X = m + sigma * (2)^(1/2) * (SUMi[1..6] Ri - 3)
//  Ri - random number in [0,1]
//

+(NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)m :(double)sigma{
    NSMutableArray* result = [[NSMutableArray alloc] init];

    for (int j = 0; j < randomNumbers.count; j++) {

        double sum = 0;
        for (int i = 0; i < LENGTH; i++) {
            int r = arc4random() % randomNumbers.count;
            sum += [randomNumbers[r] doubleValue];
        }

        [result addObject:[NSNumber numberWithDouble:(m + sigma * sqrt(12/LENGTH) * (sum - LENGTH/2))]];
    }
    return result;

}

@end
