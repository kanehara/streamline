//
//  PreviousOrdersViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "PreviousOrdersViewController.h"

@interface PreviousOrdersViewController ()

@end

@implementation PreviousOrdersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initDummyData];
}

- (void)initDummyData {
    NSArray *tempArray = [[NSArray alloc] initWithObjects:@"Hiller's on Troy",
                          @"Whole Foods on Rochester",
                          @"Hiller's on Main",
                          @"Farmer Jack on Industry", nil];
    
    [self.previousOrdersArray addObjectsFromArray:tempArray];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.previousOrdersArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"previousOrdersCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.previousOrdersArray[indexPath.row];
    
    return cell;
}

@end
