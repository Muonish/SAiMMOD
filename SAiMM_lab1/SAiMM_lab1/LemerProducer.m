//
//  LemerProducer.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/16/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import "LemerProducer.h"

@implementation LemerProducer


+(NSMutableArray*)generateSequenceA:(int)a m:(int)m Rp:(int)Rp{
    NSMutableArray* numbers;
    LemerRandom *lr = [[LemerRandom alloc] initWithA:a andM:m andRp:Rp];

    numbers = [[NSMutableArray alloc] init];
    NSNumber* nextRandom = [NSNumber numberWithDouble:[lr next]];
    int p = 1;
    while (![numbers containsObject:nextRandom]) {
        [numbers addObject: nextRandom];
        nextRandom = [NSNumber numberWithDouble:[lr next]];
        p++;
    }
    NSLog(@"EXIT with period: %d",p);

    return numbers;
}

+(NSMutableArray*)generateSequenceWithLength:(int)len a:(int)a m:(int)m Rp:(int)Rp{
    NSMutableArray* numbers;
    LemerRandom *lr = [[LemerRandom alloc] initWithA:a andM:m andRp:Rp];

    numbers = [[NSMutableArray alloc] init];
    NSNumber* nextRandom = [NSNumber numberWithDouble:[lr next]];
    int p = 1;
    while (len-- > 0) {
        [numbers addObject: nextRandom];
        nextRandom = [NSNumber numberWithDouble:[lr next]];
        p++;
    }
    return numbers;
}
@end
