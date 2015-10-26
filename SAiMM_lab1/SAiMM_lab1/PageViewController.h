//
//  PageViewController.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/7/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Charts/Charts.h>

@interface PageViewController : UIPageViewController

@property (nonatomic, strong) IBOutlet BarChartView *chartView;

@end
