//
//  ReplaceViewController.m
//  Streamline
//
//  Created by kanehara on 8/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "ReplaceViewController.h"
#import "foodItem.h"
#import "ReplaceTableViewCell.h"

@interface ReplaceViewController () <ReplaceTableViewCellDelegate>

@end

@implementation ReplaceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // DUMMY DATA INIT
    [self initDummyData];
    
    [self initSections];
    
    [self initPickerView];
    
    _myCartsInstance = [myCarts getInstance];
}

// ---------------------------DUMMY DATA INIT BEGIN-----------------------------------------
- (void) initDummyData {
    // price items
    foodItem *priceFoodItem0 = [[foodItem alloc] initWithName:@"Cheap Bread"
                                                    withPrice:1.4
                                                 withCategory:@"Grains/Pasta"
                                                   withFoodID:@"CheapBread1"];
    foodItem *priceFoodItem1 = [[foodItem alloc] initWithName:@"Meijer White Bread"
                                                    withPrice:1.5
                                                 withCategory:@"Grains/Pasta"
                                                   withFoodID:@"MeijBread332"];
    foodItem *priceFoodItem2 = [[foodItem alloc] initWithName:@"Wonderbread"
                                                    withPrice:1.55
                                                 withCategory:@"Grains/Pasta"
                                                   withFoodID:@"Wonderbread"];
    self.priceFoodItems = @[priceFoodItem0, priceFoodItem1, priceFoodItem2];
    
    // organic items
    foodItem *organicFoodItem0 = [[foodItem alloc] initWithName:@"Organic Whole Grain Bread"
                                           withPrice:2.4
                                        withCategory:@"Grains/Pasta"
                                          withFoodID:@"OrgBanana"];
    foodItem *organicFoodItem1 = [[foodItem alloc] initWithName:@"Organic Wonderbread"
                                                    withPrice:2.2
                                                 withCategory:@"Grains/Pasta"
                                                   withFoodID:@"OrgWonderbread"];
    self.organicFoodItems = @[organicFoodItem0, organicFoodItem1];

    // gluten free items
    foodItem *glutenFreeItem0 = [[foodItem alloc] initWithName:@"7-grain Gluten Free Bread"
                                                     withPrice:3.00
                                                  withCategory:@"Grains/Pasta"
                                                    withFoodID:@"7GlutenFree"];
    foodItem *glutenFreeItem1 = [[foodItem alloc] initWithName:@"Rudi's Gluten Free"
                                                     withPrice:4.5
                                                  withCategory:@"Grains/Pasta"
                                                    withFoodID:@"RudiGF"];
    self.glutenFreeFoodItems = @[glutenFreeItem0, glutenFreeItem1];
    
    // popular items
    foodItem *popularItem0 = [[foodItem alloc] initWithName:@"Wonderbread"
                                                  withPrice:1.55
                                               withCategory:@"Grains/Pasta"
                                                 withFoodID:@"Wonderbread"];
    foodItem *popularItem1 = [[foodItem alloc] initWithName:@"Pepperridge Whole Grain"
                                                  withPrice:3.00
                                               withCategory:@"Grains/Pasta"
                                                 withFoodID:@"PRWholeGrain"];
    foodItem *popularItem2 = [[foodItem alloc] initWithName:@"Healthwise Bread"
                                                  withPrice:3.5
                                               withCategory:@"Grains/Pasta"
                                                 withFoodID:@"HealthwiseBread"];
    self.popularFoodItems = @[popularItem0, popularItem1, popularItem2];
}
// ---------------------------DUMMY DATA INIT END-------------------------------------------

- (void) initSections {
    _sections = @[@"Price", @"Organic", @"Gluten Free", @"Popular"];
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
    
    _pickerViewSelection = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10+"];
    
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerViewSelection[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _quantityFieldBeingEdited.text = _pickerViewSelection[row];
}

- (void) onQuantitySelection {
    if (_quantityFieldBeingEdited) {
        [_quantityFieldBeingEdited resignFirstResponder];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.pickerView setHidden:NO];
    _quantityFieldBeingEdited = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _quantityFieldBeingEdited = nil;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return _sections.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.priceFoodItems.count;
            break;
        case 1:
            return self.organicFoodItems.count;
            break;
        case 2:
            return self.glutenFreeFoodItems.count;
            break;
        case 3:
            return self.popularFoodItems.count;
            break;
        default:
            NSLog(@"Error in numberOfRowsInSection in ReplaceViewController");
            return -1;
            break;
    }
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _sections[section];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pickerViewSelection.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReplaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"replaceCell" forIndexPath:indexPath];
    
    foodItem *item;
    
    switch (indexPath.section) {
        case 0:
            item = (foodItem*)self.priceFoodItems[indexPath.row];
            break;
        case 1:
            item = (foodItem*)self.organicFoodItems[indexPath.row];
            break;
        case 2:
            item = (foodItem*)self.glutenFreeFoodItems[indexPath.row];
            break;
        case 3:
            item = (foodItem*)self.popularFoodItems[indexPath.row];
            break;
        default:
            NSLog(@"Invalid indexpath in cellForRowAtIndexPath in ReplaceViewController.m");
            return Nil;
            break;
    }
    
    cell.foodNameLabel.text = item.foodItemName;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.02f", item.foodItemPrice];
    cell.quantityField.inputView = self.pickerView;
    cell.cellIndexPath = indexPath;
    
    cell.delegate = self;
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    
    [headerView setBackgroundColor:[UIColor blackColor]];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(15,0,300,44)];
    tempLabel.backgroundColor=[UIColor clearColor];
    tempLabel.textColor = [UIColor whiteColor]; //here you can change the text color of header.
    tempLabel.font = [UIFont boldSystemFontOfSize:16];
    tempLabel.text = _sections[section];
    
    [headerView addSubview:tempLabel];

    
    return headerView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)addToCartButtonActionForIndexPath:(NSIndexPath *)indexPath {
    ReplaceTableViewCell *cell = (ReplaceTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"replaceAddToCartSegue" sender:self];
    
}

- (void)replaceButtonActionForIndexPath:(NSIndexPath *)indexPath {
    
}

@end
