//
//  StoreCartViewController.m
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "StoreCartViewController.h"
#import "myCarts.h"
#import "cartItem.h"

@interface StoreCartViewController ()

@end

@implementation StoreCartViewController

@synthesize store = _store;
@synthesize editButon = _editButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initMyCartsInstance];
    
    [self initEditButton];
    
    [self initTotalLabel];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)initMyCartsInstance {
    _myCartsInstance = [myCarts getInstance];
}

- (void)initEditButton {
    _editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                   style:UIBarButtonItemStylePlain target:self
                                                  action:@selector(enableEditingOfTableView)];
    self.navigationItem.rightBarButtonItem = _editButton;
}

- (void)initTotalLabel {
    float total = 0;
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    for (int i = 0; i < cart.count; ++i) {
        cartItem *item = (cartItem*)cart[i];
        total += item.cartItemTotalCost;
    }
    self.totalLabel.text = [NSString stringWithFormat:@"$%.02f", total];
}

- (void)enableEditingOfTableView {
    [self.tableView setEditing:YES animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    if (cart) {
        return cart.count;
    }
    else {
        return 0;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeCartCell" forIndexPath:indexPath];
    
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    cartItem *cartItem = cart[indexPath.row];
    
    UILabel *foodNameLabel = (UILabel*) [cell viewWithTag:1];
    UILabel *priceLabel = (UILabel*) [cell viewWithTag:2];
    UILabel *subtotalLabel = (UILabel*) [cell viewWithTag:3];
    
    UITextField *quantityTextField = (UITextField*) [cell viewWithTag:4];
    
    foodNameLabel.text = cartItem.cartItemFoodItem.foodItemName;
    priceLabel.text = [NSString stringWithFormat:@"$%.02f", cartItem.cartItemFoodItem.foodItemPrice];
    subtotalLabel.text = [NSString stringWithFormat: @"Subtotal: $%.02f", cartItem.cartItemTotalCost];
    
    quantityTextField.text = [[NSNumber numberWithFloat:cartItem.cartItemQuantity] stringValue];
    
        
    return cell;
}

- (IBAction)onCheckoutButtonPress:(id)sender {
    
}

@end
