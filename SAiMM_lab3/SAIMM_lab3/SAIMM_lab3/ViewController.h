//
//  ViewController.h
//  SAIMM_lab3
//
//  Created by Valeryia Breshko on 10/25/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QueuingSystem.h"

@interface ViewController : NSViewController

@property (strong, nonatomic) IBOutlet NSTextField *pi1;
@property (strong, nonatomic) IBOutlet NSTextField *pi2;
@property (strong, nonatomic) IBOutlet NSTextField *ro;
@property (strong, nonatomic) IBOutlet NSTextField *tactNumber;

@property (strong, nonatomic) IBOutlet NSTextField *absoluteBandwidth;
@property (strong, nonatomic) IBOutlet NSTextField *relativeBandwidth;
@property (strong, nonatomic) IBOutlet NSTextField *averageLengthQ;

@property (strong, nonatomic) IBOutlet NSTextField *rejectNumber;
@property (strong, nonatomic) IBOutlet NSTextField *doneNumber;
@property (strong, nonatomic) IBOutlet NSTextField *requestNumber;
@property (strong, nonatomic) IBOutlet NSTextField *blockNumber;

@end

