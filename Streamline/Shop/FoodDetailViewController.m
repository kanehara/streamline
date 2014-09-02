//
//  FoodDetailViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "FoodDetailViewController.h"
#import "myCarts.h"
#import "cartItem.h"
#import "foodItem.h"
#import "StoreCartViewController.h"

@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController

@synthesize foodDetailCartItem = _foodDetailCartItem;
@synthesize store = _store;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initDummyData];
    
    [self initPickerView];
    
    [self initPickerViewSelection];
    
    [self initPriceLabel];

}

- (void) initPickerView {
    self.pickerView = [[UIPickerView alloc] initWithFrame:self.pickerView.inputView.frame];
    [self.pickerView setHidden:YES];
    [self.pickerView setDataSource:self];
    [self.pickerView setDelegate:self];
    self.quantityField.inputView = self.pickerView;
    
    // Set tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(onQuantitySelection)];
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

- (void) initPickerViewSelection {
    pickerViewSelection = @[@"1", @"2", @"3", @"4", @"5", @"6",
                            @"7", @"8", @"9", @"10+"];
}

// ------------------------------DUMMY DATA INIT START-------------------------------------------
- (void)initDummyData {
    float quantity = [self.quantityField.text floatValue];
    foodItem *item = [[foodItem alloc] initWithName:@"Avocado" withPrice:2.60 withCategory:@"Produce"];
    
    [self setTitle:@"Avocado"];
    
    _foodDetailCartItem = [[cartItem alloc] initWithFoodItem:item withQuantity:quantity];
    [_foodDetailCartItem.cartItemFoodItem setFoodID:@"Avocado123"];

    _store = @"Hiller's on Troy Rd";
}

// ------------------------------DUMMY DATA INIT END-------------------------------------------

- (void)initPriceLabel {
    float price = self.foodDetailCartItem.cartItemFoodItem.foodItemPrice;
    NSString *priceString = [NSString stringWithFormat:@"%.02f", price];
    [self.price setText:priceString];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.quantityField.text = pickerViewSelection[row];
}

- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return pickerViewSelection[row];
}

- (void) onQuantitySelection {
    [self.quantityField resignFirstResponder];
    
    // set quantity variable
    [self.foodDetailCartItem addQuantity: [self.quantityField.text floatValue]];
    
    float quantityFieldFloatValue = [self.quantityField.text floatValue];
    float total = quantityFieldFloatValue * [self.price.text floatValue];
    
    // set new total cost
    [self.foodDetailCartItem setCartItemTotalCost:total];
    
    NSString *totalString = [NSString stringWithFormat:@"%.02f", total];
    [self.totalLabel setText:totalString];
    
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [self.pickerView setHidden:NO];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    StoreCartViewController *dest = (StoreCartViewController*)segue.destinationViewController;
    dest.store = _store;
}

- (IBAction)onAddToCartPress:(id)sender {
    myCarts *carts = [myCarts getInstance];
    [carts addCartItem:self.foodDetailCartItem toStore:self.store];
    
    [self performSegueWithIdentifier:@"addToCartSegue" sender:self];
}

@end
