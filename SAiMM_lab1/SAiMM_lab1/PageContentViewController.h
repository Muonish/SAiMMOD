//
//  PageContentViewController.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/6/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//
#include <math.h>

#import <UIKit/UIKit.h>
#import <Charts/Charts.h>

#import "LemerProducer.h"
#import "UniformDistribution.h"
#import "GaussDistribution.h"
#import "ExponentialDistribution.h"
#import "GammaDistribution.h"
#import "TriangularDistribution.h"
#import "SimpsonDistribution.h"

#import "Estimations.h"

#import "Constants.h"

#define INTERVAL_NUMBER 20

@interface PageContentViewController : UITableViewController

@property (nonatomic, strong) IBOutlet BarChartView *chartView;
@property (nonatomic, strong) IBOutlet UITextField *text1;
@property (nonatomic, strong) IBOutlet UITextField *text2;
@property (nonatomic, strong) IBOutlet UILabel *label1;
@property (nonatomic, strong) IBOutlet UILabel *label2;

@property (nonatomic, strong) IBOutlet UITextView *estimations;

@property (nonatomic, strong) NSString* distributionName;
@property (nonatomic, strong) NSMutableArray* randomNumbers;

@end
