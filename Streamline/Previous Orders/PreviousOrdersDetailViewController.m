//
//  PreviousOrdersDetailViewController.m
//  Streamline
//
//  Created by kanehara on 8/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "PreviousOrdersDetailViewController.h"
#import "ReplaceTableViewCell.h"
#import "StoreCartViewController.h"

@interface PreviousOrdersDetailViewController () <ReplaceTableViewCellDelegate>

@end

@implementation PreviousOrdersDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myCartsInstance = [myCarts getInstance];
    
    [self initDummyData];
    
    [self initTotalLabel];
    
    [self initPickerView];
    
    // Hide extra line dividers
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)initDummyData {
    foodItem *item0 = [[foodItem alloc] initWithName:@"Milk"
                                           withPrice:2.80
                                        withCategory:@"Dairy"
                                          withFoodID:@"Milky"];
    foodItem *item1 = [[foodItem alloc] initWithName:@"Dorito's - Nacho"
                                           withPrice:2.50
                                        withCategory:@"Snacks"
                                          withFoodID:@"Doritos-Nacho"];
    foodItem *item2 = [[foodItem alloc] initWithName:@"Beef Jerky"
                                           withPrice:4.80
                                        withCategory:@"Snacks"
                                          withFoodID:@"BJ"];
    foodItem *item3 = [[foodItem alloc] initWithName:@"Linguine Pasta"
                                           withPrice:2.00
                                        withCategory:@"Pasta/Grains"
                                          withFoodID:@"LingPasta"];
    foodItem *item4 = [[foodItem alloc] initWithName:@"Prego Pasta Sauce"
                                           withPrice:3.00
                                        withCategory:@"Canned Foods"
                                          withFoodID:@"PregoSauce"];
    
    cartItem *cartItem0 = [[cartItem alloc] initWithFoodItem:item0 withQuantity:2];
    cartItem *cartItem1 = [[cartItem alloc] initWithFoodItem:item1 withQuantity:4];
    cartItem *cartItem2 = [[cartItem alloc] initWithFoodItem:item2 withQuantity:1];
    cartItem *cartItem3 = [[cartItem alloc] initWithFoodItem:item3 withQuantity:2];
    cartItem *cartItem4 = [[cartItem alloc] initWithFoodItem:item4 withQuantity:4];
    
    self.cart = @[cartItem0, cartItem1, cartItem2, cartItem3, cartItem4];
}

- (void)initTotalLabel {
    float total;
    for (int i = 0; i < self.cart.count; ++i) {
        cartItem *item = (cartItem*)self.cart[i];
        total += item.cartItemTotalCost;
    }
    self.totalLabel.text = [NSString stringWithFormat:@"Total: $%.02f", total];
}

- (void) initPickerView {
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

#pragma mark - picker view methods

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _textFieldBeingEdited.text = self.pickerViewOptions[row];
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.pickerViewOptions.count;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerViewOptions[row];
}

#pragma mark - text field methods
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.pickerView setHidden:NO];
    _textFieldBeingEdited = textField;
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    _textFieldBeingEdited = nil;
}

#pragma mark - ReplaceTableViewCellDelegate methods
- (void)buttonActionForIndexPath:(NSIndexPath *)indexPath isReplace:(BOOL)replace {
    cartItem *itemToBeAdded = self.cart[indexPath.row];
    
    [_myCartsInstance addCartItem:itemToBeAdded toStore:self.store];
    
    [self performSegueWithIdentifier:@"cartSegue" sender:self];
}

#pragma mark - Table View methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cart.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReplaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"previousOrdersDetailCell" forIndexPath:indexPath];
    
    cartItem *item = (cartItem*)self.cart[indexPath.row];
    
    cell.foodNameLabel.text = item.cartItemFoodItem.foodItemName;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.02f", item.cartItemFoodItem.foodItemPrice];
    cell.quantityField.text = [NSString stringWithFormat:@"%0.f", item.cartItemQuantity];
    
    cell.quantityField.inputView = self.pickerView;
    
    cell.delegate = self;
    cell.cellIndexPath = indexPath;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"cartSegue"]) {
        StoreCartViewController *dest = (StoreCartViewController*)segue.destinationViewController;
        dest.store = self.store;
    }
}

@end
