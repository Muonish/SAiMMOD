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
int requestNumberInTact[3];

- (id)initWithNumber: (int)number pi1: (double)pi1 pi2: (double)pi2{
    if ( self = [super init] ) {
        self.tactsNumber = number;
        self.pi1 = pi1;
        self.pi2 = pi2;
        self.requestNumber = 0;
        self.rejectNumber = 0;
        self.blockNumber = 0;
        memset(requestNumberInTact, 0, sizeof(requestNumberInTact));
        f = 1;
        t1 = 0;
        j = 0;
        t2 = 0;
    }
    return self;
}

- (int *)getRequestNumberInTact{
    return requestNumberInTact;
}

- (void)run{
    for (int i = 1; i < self.tactsNumber; i++) {
        int r1 = arc4random() % 100;
        int r2 = arc4random() % 100;

        //NSLog(@"%d %d %d %d", f, t1, j, t2);
        [self checkNumberOfRequestsInQS];

        if (t2 == 1 && r2 < self.pi2 * 100) {
            if (j == 1) {
                j = 0;
                t2 = 1;
            } else {
                t2 = 0;
            }
        }

        if (t1 == 1 && r1 < self.pi1 * 100) {
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

        if (f == 1) {
            if (t1 == 0) {
                f = 2;
                t1 = 1;
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
                        self.requestNumber++;
                    }
                }
            }
        }
    }
}

- (void)checkNumberOfRequestsInQS{
    if ((t1 == 1 && j == 0 && t2 == 0) ||
        (t1 == 0 && j == 1 && t2 == 0) ||
        (t1 == 0 && j == 0 && t2 == 1)) {
        requestNumberInTact[0]++;
    }
    if ((t1 == 1 && j == 1 && t2 == 0) ||
        (t1 == 0 && j == 1 && t2 == 1) ||
        (t1 == 1 && j == 0 && t2 == 1)) {
        requestNumberInTact[1]++;
    }
    if (t1 == 1 && j == 1 && t2 == 1) {
        requestNumberInTact[2]++;
    }
}

@end
