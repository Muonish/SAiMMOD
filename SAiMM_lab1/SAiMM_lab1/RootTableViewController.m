//
//  RootTableViewController.m
//  SAiMM_lab1
//
//  Created by Valeryia Breshko on 9/17/15.
//  Copyright © 2015 Valeria Breshko. All rights reserved.
//

#import "RootTableViewController.h"

@implementation RootTableViewController

NSMutableArray* lemerNumbers;

- (void)viewDidLoad {
    [super viewDidLoad];

//    lemerNumbers =
//    [LemerProducer generateSequenceA:CONST_A m:CONST_M Rp:CONST_Rp];
//
//    [self writeToPlist:@"RandomNumbers.plist" withData:lemerNumbers];
    lemerNumbers = [self readFromPlist:@"RandomNumbers.plist"];
    
    self.distributions = @[@"Uniform", @"Gauss", @"Exponential", @"Gamma", @"Triangular", @"Simpson"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.distributions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"DistributionCell";

    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    cell.textLabel.text = [self.distributions objectAtIndex:[indexPath row]];
//    static NSString *CellIdentifier = @"DistributionCell";
//
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//
//    // Fetch distribution
//    NSString *distribution = [self.distributions objectAtIndex:[indexPath row]];
//
//    [cell.textLabel setText:distribution];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showGraphic"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PageContentViewController *destViewController = segue.destinationViewController;
        destViewController.distributionName = [self.distributions objectAtIndex:indexPath.row];
        destViewController.randomNumbers = lemerNumbers;
        destViewController.title = destViewController.distributionName;
    }
}

- (void) writeToPlist: (NSString*)fileName withData:(NSMutableArray *)data
{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *finalPath = [documentsDirectory stringByAppendingPathComponent:fileName];

    [data writeToFile:finalPath atomically: YES];
    /* This would change the firmware version in the plist to 1.1.1 by initing the NSDictionary with the plist, then changing the value of the string in the key "ProductVersion" to what you specified */
}

- (NSMutableArray *) readFromPlist: (NSString *)fileName {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *finalPath = [documentsDirectory stringByAppendingPathComponent:fileName];

    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:finalPath];

    if (fileExists) {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:finalPath];
        return arr;
    } else {
        return nil;
    }
}

@end
