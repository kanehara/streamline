//
//  SideBarTableViewController.m
//  Streamline Groceries
//
//  Created by kanehara on 8/15/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "SideBarTableViewController.h"
#include "SWRevealViewController.h"

@interface SideBarTableViewController () {
    NSInteger _prevSelectedRow;
}

@end

@implementation SideBarTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Init side bar
    [self initSideBar];
    
    // Hide extra line dividers
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void) initSideBar {
    _prevSelectedRow = -1;
    NSArray *options = [[NSArray alloc] init];
    NSArray *segues = [[NSArray alloc] init];
    
    // ********* Change side bar options here ********
    options = @[@"Shop",
                @"My Carts",
                @"Previous Orders",
                @"Coupons",
                @"Logout",];
    segues = @[@"shopSegue",
               @"myCartSegue",
               @"previousOrdersSegue",
               @"couponsSegue",
               @"logoutSegue"];
    
    [self setSideBarOptions:options];
    [self setSideBarSegues:segues];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sideBarOptions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sideBarOptionCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _sideBarOptions[indexPath.row];
    return cell;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Streamline";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _prevSelectedRow) {
        [self.revealViewController revealToggleAnimated:YES];
    }
    else if (indexPath.row >= 0 && indexPath.row < _sideBarSegues.count){
        [self performSegueWithIdentifier:_sideBarSegues[indexPath.row] sender:self];
        _prevSelectedRow = indexPath.row;
    }
    else {
        NSLog(@"Error in SideBarViewTableController inside didSelectRowAtIndexPath method");
    }
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*) segue.destinationViewController;
    destViewController.title = _sideBarOptions[indexPath.row];
    
    // Custom segue for sidebar segues
    if ([segue isKindOfClass:[SWRevealViewControllerSegue class]]) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController *svc, UIViewController *dvc) {
            UINavigationController *navController = (UINavigationController*) self.revealViewController.frontViewController;
            [navController setViewControllers:@[dvc] animated:NO];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated:YES];
        };
    }
}


@end
