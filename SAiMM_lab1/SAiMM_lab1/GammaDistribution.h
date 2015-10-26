//
//  GammaDistribution.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/17/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface GammaDistribution : NSObject

+(NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)nu : (double)lambda;

@end
