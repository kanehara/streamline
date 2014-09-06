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
    
    [self initPickerView];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self setTitle:_store];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}

- (void)initMyCartsInstance {
    _myCartsInstance = [myCarts getInstance];
}

- (void)initEditButton {
    _editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                   style:UIBarButtonItemStylePlain target:self
                                                  action:@selector(toggleEditingOfTableView)];
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

- (void)initPickerView {
    self.pickerView = [[UIPickerView alloc] initWithFrame:self.pickerView.inputView.frame];
    [self.pickerView setHidden:YES];
    [self.pickerView setDataSource:self];
    [self.pickerView setDelegate:self];
    
    // Set tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(onQuantitySelection)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    self.pickerViewOptions = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10+"];

}

- (void)onQuantitySelection {
    if (_textFieldBeingEdited) {
        [_textFieldBeingEdited resignFirstResponder];
    }
}

#pragma mark - pickerView methods
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _textFieldBeingEdited.text = self.pickerViewOptions[row];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.pickerViewOptions.count;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerViewOptions[row];
}

#pragma mark - textField methods
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.pickerView setHidden:NO];
    _textFieldBeingEdited = textField;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    _textFieldBeingEdited = nil;
}

#pragma mark - own methods
- (void)updateTotalLabel:(float)value {
    total += value;
    self.totalLabel.text = [NSString stringWithFormat:@"$%.02f", total];
}

- (void)toggleEditingOfTableView {
    if ([_editButton.title isEqualToString:@"Edit"]) {
        [self.buttonCover setHidden:YES];
        [_editButton setTitle:@"Done"];
    }
    else {
        [self.buttonCover setHidden:NO];
        [_editButton setTitle:@"Edit"];
    }
}

#pragma mark - table view methods
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
    cell.quantityTextField.inputView = self.pickerView;

    
    cell.foodName = cartItem.cartItemFoodItem.foodID;
    
    cell.delegate = self;
    
    cell.cellIndexPath = indexPath;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Update total label
        CartTableViewCell *cell = (CartTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
        NSArray *itemSubtotalComponents = [cell.subtotalLabel.text componentsSeparatedByString:@"$"];
        float itemSubtotal = -[[itemSubtotalComponents lastObject] floatValue];
        [self updateTotalLabel:itemSubtotal];
        
        NSMutableArray *storeCart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
        [storeCart removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else {
        NSLog(@"Unhandled deletion of cell");
    }
}


#pragma mark - storecartcell methods
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
    [self toggleEditingOfTableView];
}

- (void)updateQuantityActionForIndexPath:(NSIndexPath *)indexPath withQuantity:(float)quantity {
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:self.store];
    cartItem *item = cart[indexPath.row];
    
    [item updateQuantity:quantity];
    
    [self.tableView reloadData];
    [self initTotalLabel];
}

#pragma mark - ETC Methods
- (IBAction)onCheckoutButtonPress:(id)sender {
    if ([_editButton.title isEqualToString:@"Done"]){
        [self toggleEditingOfTableView];
    }
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
