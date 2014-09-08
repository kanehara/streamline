//
//  CheckoutViewController.m
//  Streamline
//
//  Created by kanehara on 8/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "CheckoutViewController.h"
#import "ComfirmationViewController.h"
#import "CheckoutTableViewCell.h"

@interface CheckoutViewController () <ComfirmationViewControllerDelegate>

@end

@implementation CheckoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _myCartsInstance = [myCarts getInstance];
    
    [self setTitle:@"Checkout"];
    
    [self initTotalLabel];
    
    self.storeLabel.text = self.store;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)initTotalLabel {
    float total;
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    for (int i = 0; i < cart.count; ++i) {
        cartItem *item = cart[i];
        total += item.cartItemTotalCost;
    }
    self.totalLabel.text = [NSString stringWithFormat:@"Total: $%.02f", total];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_myCartsInstance.storeCartDictionary objectForKey:_store] count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CheckoutTableViewCell *cell = (CheckoutTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"checkoutCell" forIndexPath:indexPath];
    
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    cartItem *item = cart[indexPath.row];
    
    cell.itemLabel.text = [NSString stringWithFormat:@"%@ x %0.f", item.cartItemFoodItem.foodItemName, item.cartItemQuantity];
    
    cell.subtotalLabel.text = [NSString stringWithFormat:@"$%.02f", item.cartItemTotalCost];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"confirmationSegue"]) {
        ComfirmationViewController *dest = segue.destinationViewController;
        dest.delegate = self;
    }
    else {
        NSLog(@"Invalid sender in preparing for segue in CheckoutViewController");
    }
}

- (IBAction)onSubmitOrderPress:(id)sender {
    [_myCartsInstance.storeCartDictionary removeObjectForKey:_store];
    [self performSegueWithIdentifier:@"confirmationSegue" sender:self];
}

#pragma mark - delegate method
- (void)dismissAndPresentShopViewController {
    [self dismissViewControllerAnimated:NO completion:^{
        NSArray *controllers = [self.navigationController viewControllers];
        [self.navigationController popToViewController:controllers[1] animated:YES];
    }];
}

@end
