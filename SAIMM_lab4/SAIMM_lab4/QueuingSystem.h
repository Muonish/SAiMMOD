//
//  QueuingSystem.h
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueuingSystem : NSObject

@property (assign) int tactsNumber;
@property (assign) double lambda;
@property (assign) double mu;

@property (assign) int requestNumber;
@property (assign) int doneNumber;
@property (assign) int rejectNumber;

- (id)initWithNumber: (int)number lambda:(double)lambda mu:(double)mu;
- (void)run;
- (double)getAverageQueueLength;

@end
