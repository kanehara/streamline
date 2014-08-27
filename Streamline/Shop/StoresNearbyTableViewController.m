//
//  StoresNearbyTableViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "StoresNearbyTableViewController.h"

@interface StoresNearbyTableViewController ()

@end

@implementation StoresNearbyTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hide extra line dividers
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self initDummyData];
}

- (void) initDummyData {
    _dummyStoreName = @[@"Plum Market",
                        @"Hiller's",
                        @"Whole Foods",
                        @"Meijer",
                        @"Farmer Joe's",
                        @"Kroger",
                        @"Whole Foods"];
    _dummyStoreAddress = @[@"2304 Exective Dr",
                           @"3344 Hart Dr",
                           @"433 Ford Rd",
                           @"4444 Plaza Dr",
                           @"3456 Gemini Dr",
                           @"234 Hart Dr",
                           @"3455 Woodlawn Dr"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _dummyStoreName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopLocationCells" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _dummyStoreName[indexPath.row];
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destination = segue.destinationViewController;
    NSInteger selectedRow = self.tableView.indexPathForSelectedRow.row;
    [destination setTitle:_dummyStoreName[selectedRow]];
}

@end
