//
//  ViewController.m
//  SAIMM_lab3
//
//  Created by Valeryia Breshko on 10/25/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)startButtonClick:(NSButton *)sender{
    double pi1 = [self.pi1 doubleValue];
    double pi2 = [self.pi2 doubleValue];
    double tactNumber = [self.tactNumber doubleValue];

    QueuingSystem *system = [[QueuingSystem alloc ] initWithNumber:tactNumber pi1:pi1 pi2:pi2];

    [system run];
    [self.rejectNumber setStringValue: [NSString stringWithFormat:@"%d",system.rejectNumber]];
    [self.requestNumber setStringValue: [NSString stringWithFormat:@"%d",system.requestNumber]];
    [self.blockNumber setStringValue: [NSString stringWithFormat:@"%d",system.blockNumber]];

    double relativeBandwidth = 1 - (double)system.rejectNumber/(double)tactNumber;
    double absoluteBandwidth = relativeBandwidth/2;
    int *requestNumberInTact = [system getRequestNumberInTact];
    double averageTime = ((double)requestNumberInTact[0] * 1 +
                          (double)requestNumberInTact[1] * 2 +
                          (double)requestNumberInTact[2] * 3) / tactNumber * 2;
    [self.relativeBandwidth setStringValue: [NSString stringWithFormat:@"%f", relativeBandwidth]];
    [self.absoluteBandwidth setStringValue: [NSString stringWithFormat:@"%f", absoluteBandwidth]];
    [self.averageTimeInQS setStringValue: [NSString stringWithFormat:@"%f", averageTime]];
    
}

@end
