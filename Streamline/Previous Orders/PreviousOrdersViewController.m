//
//  PreviousOrdersViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "PreviousOrdersViewController.h"
#import "PreviousOrdersDetailViewController.h"

@interface PreviousOrdersViewController ()

@end

@implementation PreviousOrdersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initDummyData];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)initDummyData {
    self.stores = @[@"Hiller's on Troy",
                          @"Whole Foods on Rochester",
                          @"Hiller's on Main",
                          @"Farmer Jack on Industry"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stores.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"previousOrdersCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.stores[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        UITableViewCell *cell = (UITableViewCell*)sender;
        PreviousOrdersDetailViewController *dest = segue.destinationViewController;
        dest.store = cell.textLabel.text;
        dest.title = cell.textLabel.text;
    }
    else {
        NSLog(@"Error in prepareForSegue in PreviousOrdersVC");
    }
}

@end
