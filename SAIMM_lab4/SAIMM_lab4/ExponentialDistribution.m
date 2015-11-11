//
//  ExponentialDistribution.m
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "ExponentialDistribution.h"

@implementation ExponentialDistribution

//
//  Algoritm: X = -1/lambda * ln(R)
//  R - random number in [0,1]
//

+ (double)generateWithRandomNumber: (double)randomNumber lambda:(double)lambda{

    return -1.0/lambda * log(randomNumber);

}


@end
