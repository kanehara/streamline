//
//  foodCategoryViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "foodCategoryViewController.h"
#import "FoodViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface foodCategoryViewController ()

@end

@implementation foodCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initFoodCategory];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:.24 blue:.48 alpha:1]];
}

- (void) initFoodCategory {
    
    // THE FOOD CATEGORIES
    
    self.foodCategory = @[@"Produce",
                          @"Meat",
                          @"Seafood",
                          @"Bakery",
                          @"Dairy",
                          @"Beverages",
                          @"Breakfast",
                          @"Frozen",
                          @"Grains/Pasta",
                          @"Condiments",
                          @"Canned",
                          @"Snacks"];
                          
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.foodCategory.count;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"foodCategoryCell" forIndexPath:indexPath];
    
    UILabel *collectionCellLabel = (UILabel*) [cell viewWithTag:100];
    [collectionCellLabel setText:self.foodCategory[indexPath.row]];
    
    
    // Cell customization
    [cell.layer setCornerRadius:7.0f];
    [cell.layer setMasksToBounds:YES];
    [cell.layer setBorderWidth:2.0f];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // SEND APPOPRIATE FOOD DATA TO NEXT VIEW DEPENDING ON STORE STOCK
    
    // -----------------------------   DUMMY DATA ------------------------------------------
    self.availableFood = @[@"Apple",
                           @"Apricot",
                           @"Banana",
                           @"Blueberry",
                           @"Mango",
                           @"Raspberry"];
    // -----------------------------  DUMMY DATA --------------------------------------------
    
    FoodViewController *destination = (FoodViewController*) segue.destinationViewController;
    destination.availableFood = self.availableFood;
}

@end
