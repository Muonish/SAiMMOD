//
//  ViewController.h
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/3/15.
//  Copyright (c) 2015 Valeria Breshko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;

@end

