//
//  FoodDetailViewController.h
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cartItem.h"

@interface FoodDetailViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate> {
    NSArray *pickerViewSelection;
}

// For the image of the food
@property (nonatomic, strong) IBOutlet UIImageView *foodImageView;

@property (nonatomic, weak) IBOutlet UITextField *quantityField;

@property (nonatomic, weak) IBOutlet UILabel *totalLabel;

@property (nonatomic, weak) IBOutlet UILabel *price;

// For picking the quantity
@property (nonatomic, strong) UIPickerView *pickerView;

// The store of the item
@property (nonatomic, strong) NSString *store;
// The cart item that may be added to a cart
@property (nonatomic, strong) cartItem *foodDetailCartItem;

@end
