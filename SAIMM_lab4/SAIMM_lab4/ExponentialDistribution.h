//
//  ExponentialDistribution.h
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExponentialDistribution : NSObject

+ (double)generateWithRandomNumber: (double)randomNumber lambda:(double)lambda;

@end
