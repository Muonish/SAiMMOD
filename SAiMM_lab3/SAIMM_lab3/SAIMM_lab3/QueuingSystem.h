//
//  QueuingSystem.h
//  SAIMM_lab3
//
//  Created by Valeryia Breshko on 10/26/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueuingSystem : NSObject

@property (assign) int tactsNumber;
@property (assign) double pi1;
@property (assign) double pi2;

@property (assign) int requestNumber;
@property (assign) int rejectNumber;
@property (assign) int blockNumber;

- (id)initWithNumber: (int)number pi1: (double)pi1 pi2: (double)pi2;
- (void)run;
- (int *)getRequestNumberInTact;

@end
