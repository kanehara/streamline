//
//  ReplaceViewController.h
//  Streamline
//
//  Created by kanehara on 8/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cartItem.h"
#import "myCarts.h"

@interface ReplaceViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate> {
    NSArray *_sections;
    NSArray *_pickerViewSelection;
    
    UITextField *_quantityFieldBeingEdited;
        
    myCarts *_myCartsInstance;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *priceFoodItems;
@property (nonatomic, strong) NSArray *organicFoodItems;
@property (nonatomic, strong) NSArray *glutenFreeFoodItems;
@property (nonatomic, strong) NSArray *popularFoodItems;

@property (nonatomic) NSString *store;
@property (nonatomic) NSIndexPath *indexPathForReplacement;

@property (nonatomic, strong) cartItem *replaceCartItem;

@property (nonatomic, strong) UIPickerView *pickerView;

@end
