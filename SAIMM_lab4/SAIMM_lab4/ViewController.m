//
//  ViewController.m
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "ViewController.h"
#import "QueuingSystem.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)buttonStartClick:(NSButton *)sender {
    double lambda = [self.lambda doubleValue];
    double mu = [self.mu doubleValue];
    double tactsNumber = [self.tactsNumber doubleValue];

    QueuingSystem *system = [[QueuingSystem alloc ] initWithNumber:tactsNumber lambda:lambda mu:mu];

    [system run];
    [self.rejectNumber setStringValue: [NSString stringWithFormat:@"%d",system.rejectNumber]];
    [self.doneNumber setStringValue: [NSString stringWithFormat:@"%d",system.doneNumber]];
    [self.requestNumber setStringValue: [NSString stringWithFormat:@"%d",system.requestNumber]];

    double absoluteBandwidth = ((double)system.doneNumber)/tactsNumber;

    [self.absoluteBandwidth setStringValue: [NSString stringWithFormat:@"%f", absoluteBandwidth]];
    [self.averageQueueLength setStringValue: [NSString stringWithFormat:@"%f", [system getAverageQueueLength]]];
}
@end
