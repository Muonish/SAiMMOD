//
//  LemerRandom.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/3/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
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
double Rp, Rn;

- (id)initWithA: (int)_a andM: (int)_m andRp: (double)_Rp{
    a = _a;
    m = _m;
    Rp = _Rp;

    return self;
}

- (double)next{
    Rp = fmod(a * Rp, m);
    return Rp / m;
}



@end
