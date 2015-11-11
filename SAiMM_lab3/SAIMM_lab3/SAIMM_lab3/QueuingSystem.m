//
//  QueuingSystem.m
//  SAIMM_lab3
//
//  Created by Valeryia Breshko on 10/26/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "QueuingSystem.h"

@implementation QueuingSystem

int f;
int t1;
int j;
int t2;
int states[9];

- (id)initWithNumber: (int)number pi1: (double)pi1 pi2: (double)pi2 ro: (double)ro{
    if ( self = [super init] ) {
        self.tactsNumber = number;
        self.pi1 = pi1;
        self.pi2 = pi2;
        self.ro = ro;
        self.requestNumber = 0;
        self.doneNumber = 0;
        self.rejectNumber = 0;
        self.blockNumber = 0;
        self.timesInQueue = 0;
        memset(states, 0, sizeof(states));
        f = 0;
        t1 = 0;
        j = 0;
        t2 = 0;
    }
    return self;
}

- (void)run{

    for (int i = 0; i < self.tactsNumber; i++) {
        int r1 = arc4random() % 100;
        int r2 = arc4random() % 100;
        int curRo = arc4random() % 100;

      //  NSLog(@"%d %d %d %d - %d(%d)", f, t1, j, t2, self.requestNumber, self.rejectNumber);
        NSString *state = [NSString stringWithFormat:@"%d%d%d%d", f, t1, j, t2];
        if ([state isEqualToString:@"0000"]) {
            states[0]++;
        } else if ([state isEqualToString:@"0100"]){
            states[1]++;
        } else if ([state isEqualToString:@"0101"]){
            states[2]++;
        } else if ([state isEqualToString:@"1100"]){
            states[3]++;
        } else if ([state isEqualToString:@"0001"]){
            states[4]++;
        } else if ([state isEqualToString:@"0011"]){
            states[5]++;
        } else if ([state isEqualToString:@"1101"]){
            states[6]++;
        } else if ([state isEqualToString:@"0111"]){
            states[7]++;
        } else if ([state isEqualToString:@"1111"]){
            states[8]++;
        }

        if (j > 0) {
            self.timesInQueue++;
        }
        if (f > 0) {
            self.blockNumber++;
        }
        
        if (t2 == 1 && r2 > self.pi2 * 100) {
            if (j == 1) {
                j = 0;
                t2 = 1;
            } else {
                t2 = 0;
            }
            self.doneNumber++;
        }

        if (t1 == 1 && r1 > self.pi1 * 100) {
            if (j == 0) {
                if (t2 == 0){
                    t2 = 1;
                    t1 = 0;
                } else {
                    t1 = 0;
                    j = 1;
                }
            } else {
                t1 = 0;
                self.rejectNumber++;
            }
        }

        if (f == 0 && curRo > self.ro * 100) { //if generate request
            if (t1 == 0) {
                t1 = 1;
                self.requestNumber++;
            } else {
                f = 1;
            }
        } else {
            if (f == 1) {
                if (t1 == 0) {
                    t1 = 1;
                    f = 0;
                    self.requestNumber++;
                }
            }
        }

    }
    for (int ii = 0; ii < 9; ii++) {
        NSLog(@"%f\n", (double)states[ii]/(double)self.tactsNumber);
    }

}


@end
