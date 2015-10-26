//
//  UniformDistribution.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/16/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LemerProducer.h"
#import "Constants.h"

@interface UniformDistribution : NSObject

+(NSMutableArray*)generateSequenceWithRandomNumbers: (NSMutableArray*)randomNumbers :(double)a :(double)b;

@end
