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
#import "CartTableViewCell.h"
#import "CheckoutViewController.h"
#import "ReplaceViewController.h"

@interface StoreCartViewController () <CartTableViewCellDelegate>

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
    
    [self.buttonCover setHidden:NO];
}

- (void)initTotalLabel {
    total = 0;
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    for (int i = 0; i < cart.count; ++i) {
        cartItem *item = (cartItem*)cart[i];
        total += item.cartItemTotalCost;
    }
    self.totalLabel.text = [NSString stringWithFormat:@"$%.02f", total];
}

- (void)updateTotalLabel:(float)value {
    total += value;
    self.totalLabel.text = [NSString stringWithFormat:@"$%.02f", total];
}

- (void)enableEditingOfTableView {
    if ([_editButton.title isEqualToString:@"Edit"]) {
        [self.buttonCover setHidden:YES];
        [_editButton setTitle:@"Done"];
    }
    else {
        [self.buttonCover setHidden:NO];
        [_editButton setTitle:@"Edit"];
    }
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

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeCartCell"
                                                              forIndexPath:indexPath];
    
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    cartItem *cartItem = cart[indexPath.row];
    
    cell.foodNameLabel.text = cartItem.cartItemFoodItem.foodItemName;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.02f", cartItem.cartItemFoodItem.foodItemPrice];
    cell.subtotalLabel.text = [NSString stringWithFormat: @"Subtotal: $%.02f", cartItem.cartItemTotalCost];
    
    cell.quantityTextField.text = [[NSNumber numberWithFloat:cartItem.cartItemQuantity] stringValue];
    
    cell.delegate = self;
        
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *storeCart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
        [storeCart removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        CartTableViewCell *cell = (CartTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
        NSArray *itemSubtotalComponents = [cell.subtotalLabel.text componentsSeparatedByString:@"$"];
        float itemSubtotal = -[[itemSubtotalComponents lastObject] floatValue];
        [self updateTotalLabel:itemSubtotal];
    }
    else {
        NSLog(@"Unhandled deletion of cell");
    }
}

- (void)deleteButtonActionForItem:(NSString *)item {
    NSArray *visibleCells = [self.tableView visibleCells];
    NSArray *visibleCellsIndexPaths = [self.tableView indexPathsForVisibleRows];
    for (int i = 0; i < visibleCells.count; ++i) {
        CartTableViewCell *cell = (CartTableViewCell*)visibleCells[i];
        if (cell.foodName == item) {
            [self tableView:self.tableView
         commitEditingStyle:UITableViewCellEditingStyleDelete
          forRowAtIndexPath:visibleCellsIndexPaths[i]];
        }
    }
}

- (void)replaceButtonActionForItem:(NSString *)item {
    NSArray *visibleCells = [self.tableView visibleCells];
    NSArray *visibleCellsIndexPaths = [self.tableView indexPathsForVisibleRows];
    for (int i = 0; i < visibleCells.count; ++i) {
        CartTableViewCell *cell = (CartTableViewCell*)visibleCells[i];
        if (cell.foodName == item) {
            indexPathForReplacement = visibleCellsIndexPaths[i];
        }
    }
    [self performSegueWithIdentifier:@"replaceSegue"
                              sender:self];
}

- (IBAction)onCheckoutButtonPress:(id)sender {
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"checkoutSegue"]) {
        CheckoutViewController *dest = (CheckoutViewController*)segue.destinationViewController;
        dest.store = self.store;
    }
    else if ([segue.identifier isEqualToString:@"replaceSegue"]) {
        ReplaceViewController *dest = (ReplaceViewController*)segue.destinationViewController;
        dest.store = self.store;
        dest.indexPathForReplacement = indexPathForReplacement;
    }
    else {
        NSLog(@"Error in prepareForSegue in StoreCartVC");
    }
}

@end
