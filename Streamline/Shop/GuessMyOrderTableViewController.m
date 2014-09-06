//
//  GuessMyOrderTableViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "GuessMyOrderTableViewController.h"
#import "foodItem.h"
#import "ReplaceTableViewCell.h"
#import "myCarts.h"
#import "StoreCartViewController.h"

@interface GuessMyOrderTableViewController () <ReplaceTableViewCellDelegate>

@end

@implementation GuessMyOrderTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _myCartsInstance = [myCarts getInstance];
    
    // Hide extra line dividers
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Initialize dummy data
    [self initDummyFoodItems];
    [self initDummyStoreLocations];
    
    // Initialize picker view
    [self initPickerView];
}

- (void) initDummyFoodItems {
    foodItem *item0 = [[foodItem alloc] initWithName:@"Milk"
                                           withPrice:2.80
                                        withCategory:@"Dairy"
                                          withFoodID:@"Milk123"];
    foodItem *item1 = [[foodItem alloc] initWithName:@"Butter"
                                           withPrice:1.50
                                        withCategory:@"Bakery"
                                          withFoodID:@"ButteryGoodness"];
    foodItem *item2 = [[foodItem alloc] initWithName:@"Eggs"
                                           withPrice:3.00
                                        withCategory:@"Meat"
                                          withFoodID:@"Eggs"];
    foodItem *item3 = [[foodItem alloc] initWithName:@"Red Vine Tomatoes"
                                           withPrice:1.85
                                        withCategory:@"Produce"
                                          withFoodID:@"RV Tom"];
    foodItem *item4 = [[foodItem alloc] initWithName:@"Pepperridge Whole Wheat Bread"
                                           withPrice:3.00
                                        withCategory:@"Bakery"
                                          withFoodID:@"PPWWBread"];
    
    self.foodItems = @[item0, item1, item2, item3, item4];
}

- (void)initDummyStoreLocations {
    self.storeLocations = @[@"Hiller's on Troy",
                            @"Meijer on Grand Ave.",
                            @"Trader Joe's on Main St."];
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

#pragma mark - text field delegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.pickerView setHidden:NO];
    _textFieldBeingEdited = textField;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    _textFieldBeingEdited = nil;
}

#pragma mark - ReplaceTableViewCellDelegate
// Reusing the ReplaceTableViewCell class to implement  GuessMyOrder cells
- (void)buttonActionForIndexPath:(NSIndexPath *)indexPath isReplace:(BOOL)replace {
    ReplaceTableViewCell *cell = (ReplaceTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    
    float quantity = [cell.quantityField.text floatValue];
    foodItem *item = self.foodItems[indexPath.row];
    
    self.cartItemToAdd = [[cartItem alloc] initWithFoodItem:item withQuantity:quantity];
    
    _store = self.storeLocations[indexPath.section];
    
    [_myCartsInstance addCartItem:self.cartItemToAdd toStore:self.storeLocations[indexPath.section]];
    [self performSegueWithIdentifier:@"cartSegue" sender:self];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.storeLocations.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodItems.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.storeLocations[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReplaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guessMyOrderCell" forIndexPath:indexPath];
    
    // Configure the cell...
    foodItem *item = self.foodItems[indexPath.row];
    
    cell.cellIndexPath = indexPath;
    cell.foodNameLabel.text = item.foodItemName;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.02f", item.foodItemPrice];
    cell.quantityField.text = @"0";
    
    cell.delegate = self;
    
    cell.quantityField.inputView = self.pickerView;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

#pragma mark - Beginning of picker view methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.pickerViewOptions.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _textFieldBeingEdited.text = self.pickerViewOptions[row];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerViewOptions[row];
}

#pragma mark - Prepare for segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"cartSegue"]) {
        StoreCartViewController *dest = segue.destinationViewController;
        dest.store = _store;
    }
    else {
        NSLog(@"Invalid segue in GuessMyOrderVC");
    }
}

@end
