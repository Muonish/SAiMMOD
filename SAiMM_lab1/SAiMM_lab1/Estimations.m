//
//  Estimations.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/17/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "Estimations.h"

@implementation Estimations

+ (double)calculateExpectedValue: (NSArray*) numbers{
    double sum = 0;
    for (int i = 0; i < numbers.count; i++) {
        sum += [numbers[i] doubleValue];
    }
    return sum / numbers.count;
}

+ (double)calculateDispersion: (NSArray*) numbers{
    double sum = 0;
    double expectedValue = [self calculateExpectedValue: numbers];
    for (int i = 0; i < numbers.count; i++) {
        sum += pow([numbers[i] doubleValue] - expectedValue, 2);
    }
    return sum / numbers.count;
}

+ (double)calculateStandardDeviation: (NSArray*) numbers{
    double dispersion = [self calculateDispersion: numbers];
    return sqrt(dispersion);
}

+ (double)checkUniformity: (NSArray*) numbers{
    int k = 0;          //numbers of pairs for which (Xi)^2 + (Xi+1)^2 < 1
    for (int i = 0; i < numbers.count - 1; i++) {
        double condition = pow([numbers[i] doubleValue],2) +
        pow([numbers[i + 1] doubleValue],2);
        if (condition < 1) {
            k++;
        }
    }
    return (double)k / (double)numbers.count;
}

@end
