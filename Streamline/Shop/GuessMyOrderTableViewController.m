//
//  GuessMyOrderTableViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "GuessMyOrderTableViewController.h"

@interface GuessMyOrderTableViewController ()

@end

@implementation GuessMyOrderTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Hide extra line dividers
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Initialize dummy data
    [self initDummyGuessMyOrder];
}

- (void) initDummyGuessMyOrder {
    self.dummyGuessMyOrder = @[@"1 Gal Milk",
                                @"Dozen Eggs",
                                @"Doritos Nacho",
                                @"Steak",
                                @"Chicken Breast",
                                @"Angel Hair Pasta",
                                @"Alfredo Sauce"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guessMyOrderCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _dummyGuessMyOrder[indexPath.row];
    return cell;
}


@end
