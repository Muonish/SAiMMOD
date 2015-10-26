//
//  GammaDistribution.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/17/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "GammaDistribution.h"

@implementation GammaDistribution

//
//  Algoritm: X = -1/lambda * ln(PROi[1,nu]Ri)
//  Ri - random number in [0,1]
//

+(NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)nu :(double)lambda{

    NSMutableArray* result = [[NSMutableArray alloc] init];

    for (int j = 0; j < randomNumbers.count; j++) {

        double p = 1;
        for (int i = 0; i < nu; i++) {
            int r = arc4random() % randomNumbers.count;
            p *= [randomNumbers[r] doubleValue];
        }

        [result addObject:[NSNumber numberWithDouble:(-1.0 / lambda * log(p))]];
    }
    return result;
}

@end
