//
//  CheckoutViewController.m
//  Streamline
//
//  Created by kanehara on 8/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "CheckoutViewController.h"

@interface CheckoutViewController ()

@end

@implementation CheckoutViewController

@synthesize myCartsInstance = _myCartsInstance;
@synthesize store = _store;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_myCartsInstance.storeCartDictionary objectForKey:_store] count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkoutCell" forIndexPath:indexPath];
    
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    cartItem *item = cart[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ x %f = $%.02f", item.cartItemFoodItem.foodItemName, item.cartItemQuantity, item.cartItemTotalCost];
    
    return cell;
}

@end
