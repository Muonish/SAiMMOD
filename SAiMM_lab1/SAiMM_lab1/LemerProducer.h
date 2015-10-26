//
//  LemerProducer.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/16/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LemerRandom.h"
#import "Estimates.h"
#import "Constants.h"


@interface LemerProducer : NSObject

+(NSMutableArray*)generateSequenceA:(int)a m:(int)m Rp:(int)Rp;
+(NSMutableArray*)generateSequenceWithLength:(int)len a:(int)a m:(int)m Rp:(int)Rp;

@end
