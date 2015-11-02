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
int states[13];

- (id)initWithNumber: (int)number pi1: (double)pi1 pi2: (double)pi2{
    if ( self = [super init] ) {
        self.tactsNumber = number;
        self.pi1 = pi1;
        self.pi2 = pi2;
        self.requestNumber = 0;
        self.doneNumber = 0;
        self.rejectNumber = 0;
        self.blockNumber = 0;
        self.timeInTacts = 0;
        self.timeDelayInT1 = 0;
        memset(states, 0, sizeof(states));
        f = 2;
        t1 = 0;
        j = 0;
        t2 = 0;
    }
    return self;
}

- (void)run{
    int delayInT1 = 0;

    for (int i = 0; i < self.tactsNumber; i++) {
        int r1 = arc4random() % 100;
        int r2 = arc4random() % 100;

      //  NSLog(@"%d %d %d %d - %d(%d)", f, t1, j, t2, self.requestNumber, self.rejectNumber);
//        NSString *state = [NSString stringWithFormat:@"%d%d%d%d", f, t1, j, t2];
//        if ([state isEqualToString:@"2000"]) {
//            states[0]++;
//        } else if ([state isEqualToString:@"1000"]){
//            states[1]++;
//        } else if ([state isEqualToString:@"2100"]){
//            states[2]++;
//        } else if ([state isEqualToString:@"1100"]){
//            states[3]++;
//        } else if ([state isEqualToString:@"1001"]){
//            states[4]++;
//        } else if ([state isEqualToString:@"0100"]){
//            states[5]++;
//        } else if ([state isEqualToString:@"2101"]){
//            states[6]++;
//        } else if ([state isEqualToString:@"0101"]){
//            states[7]++;
//        } else if ([state isEqualToString:@"1101"]){
//            states[8]++;
//        } else if ([state isEqualToString:@"1011"]){
//            states[9]++;
//        } else if ([state isEqualToString:@"2111"]){
//            states[10]++;
//        } else if ([state isEqualToString:@"0111"]){
//            states[11]++;
//        } else if ([state isEqualToString:@"1111"]){
//            states[12]++;
//        }

        [self incrementTacts];
        
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
                self.timeDelayInT1 += delayInT1;
                delayInT1 = 0;
            } else {
                t1 = 0;
                self.rejectNumber++;
                delayInT1 = 0;
            }
        } else {
            delayInT1++;
        }

        if (f == 1) {
            if (t1 == 0) {
                f = 2;
                t1 = 1;
                delayInT1 = 1;
                self.requestNumber++;
            } else {
                f = 0;
                self.blockNumber++;
            }
        } else {
            if (f == 2){
                f = 1;
            } else {
                if (f == 0) {
                    if (t1 == 0) {
                        f = 2;
                        t1 = 1;
                        delayInT1 = 1;
                        self.requestNumber++;
                    }
                }
            }
        }
    }
//    for (int ii = 0; ii < 13; ii++) {
//        NSLog(@"%f\n", (double)states[ii]/(double)self.tactsNumber);
//    }

}

- (void)incrementTacts{
    if (j == 1) {
        self.timeInTacts++;
    }
    if (t2 == 1) {
        self.timeInTacts++;
    }
}

@end
