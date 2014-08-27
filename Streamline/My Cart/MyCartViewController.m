//
//  MyCartViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "MyCartViewController.h"
#import "myCarts.h"

@interface MyCartViewController ()

@end

@implementation MyCartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"My Carts";
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    myCarts *cart = [myCarts getInstance];
    return cart.storeCartDictionary.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"cartCell" forIndexPath:indexPath];
    
    myCarts *cart = [myCarts getInstance];
    NSString *store = [cart storeAtIndex:indexPath];
    
    cell.textLabel.text = store;
    
    return cell;
}

@end
