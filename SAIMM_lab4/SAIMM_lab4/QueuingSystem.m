//
//  QueuingSystem.m
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "QueuingSystem.h"
#import "ExponentialDistribution.h"
#import "LemerRandom.h"

#define QUEUE_LENGTH 3

@implementation QueuingSystem

int source;   // stores how many tacts are left before the generate new request
int queue;    // stores how many requests are in the queue
int channel;  // stores how many tacts are left before the end of dispatching current request
int queueLength[3];

LemerRandom* lemer;     //random

- (id)initWithNumber: (int)number lambda:(double)lambda mu:(double)mu{
    if ( self = [super init] ) {
        lemer = [[LemerRandom alloc] init];
        self.tactsNumber = number;
        self.lambda = lambda;
        self.mu = mu;
        self.requestNumber = 0;
        self.doneNumber = 0;
        self.rejectNumber = 0;
        source = [self startRandomTimeSource];
        queue = 0;
        channel = 0;
        memset(queueLength, 0, sizeof(queueLength));
    }
    return self;
}

- (void)run{

    for (int i = 0; i < self.tactsNumber; i++) {
        //NSLog(@"(%d)%d %d %d(%d - %d)\n", self.requestNumber, source, queue,channel, self.doneNumber, self.rejectNumber);
        for (int j = 0; j < 100; j++) {
            if (channel == 0) {
                if (queue > 0) {
                    channel = [self startRandomTimeChannel];
                    self.doneNumber++;
                    queue--;
                }
            }

            if (source == 0) {
                self.requestNumber++;
                if (queue < QUEUE_LENGTH) {
                    if (queue == 0 && channel == 0) {
                        source = [self startRandomTimeSource];
                        channel = [self startRandomTimeChannel];
                        self.doneNumber++;
                    } else {
                        queue++;
                        source = [self startRandomTimeSource];
                    }
                } else {
                    self.rejectNumber++;
                    source = [self startRandomTimeSource];
                }

            }

            if (source > 0) {
                source--;
            }
            if (channel > 0) {
                channel--;
            }

            [self incrementQueueLength];
        }
    }
}

- (int)startRandomTimeSource{
    return (int)([ExponentialDistribution generateWithRandomNumber:[lemer next]
                                                            lambda:self.lambda] * 100);
}

- (int)startRandomTimeChannel{
    return (int)(([ExponentialDistribution generateWithRandomNumber:[lemer next]
                                                            lambda:self.mu * 3] +
                  [ExponentialDistribution generateWithRandomNumber:[lemer next]
                                                             lambda:self.mu * 3] +
                  [ExponentialDistribution generateWithRandomNumber:[lemer next]
                                                             lambda:self.mu * 3]) * 100);
}

- (void)incrementQueueLength{
    if (queue == 3){
        queueLength[2]++;
    } else if (queue == 2){
        queueLength[1]++;
    } else if (queue == 1){
        queueLength[0]++;
    }
}

- (double)getAverageQueueLength{
    return ((double)(queueLength[0] * 1 + queueLength[1] * 2 + queueLength[2] * 3 )/100 /self.tactsNumber);
}

@end
