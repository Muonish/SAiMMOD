//
//  LemerRandom.m
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "LemerRandom.h"

@implementation LemerRandom

//
//  Lemer's formula:  Rn = (a*Rp) mod m
//      Rn - next random number
//      Rp - previous random number
//      a, m - "magic" numbers
//


int a,m;
double Rp;

- (id)init{
    if ( self = [super init] ) {
        a = CONST_A;
        m = CONST_M;
        Rp = CONST_Rp;
    }

    return self;
}

- (double)next{
    Rp = fmod(a * Rp, m);
    return Rp / m;
}

- (NSMutableArray*)nextN: (int)number{
    NSMutableArray* result = [[NSMutableArray alloc] init];

    for (int i = 0; i < number; i++) {
        [result addObject:[NSNumber numberWithDouble:self.next]];
    }
    return result;
}

@end
