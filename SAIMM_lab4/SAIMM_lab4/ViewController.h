//
//  ViewController.h
//  SAIMM_lab4
//
//  Created by Valeryia Breshko on 11/11/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *lambda;
@property (weak) IBOutlet NSTextField *mu;
@property (weak) IBOutlet NSTextField *tactsNumber;
@property (weak) IBOutlet NSTextField *absoluteBandwidth;
@property (weak) IBOutlet NSTextField *averageQueueLength;
@property (weak) IBOutlet NSTextField *requestNumber;
@property (weak) IBOutlet NSTextField *doneNumber;
@property (weak) IBOutlet NSTextField *rejectNumber;



- (IBAction)buttonStartClick:(NSButton *)sender;

@end

