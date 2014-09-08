//
//  GuessMyOrderTableViewController.h
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cartItem.h"
#import "myCarts.h"

@interface GuessMyOrderTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate> {
    
    // The quantity field being edited will be held here
    UITextField *_textFieldBeingEdited;
    
    myCarts *_myCartsInstance;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic) IBOutlet UILabel *storeLabel;
@property (nonatomic) IBOutlet UILabel *totalLabel;

@property (nonatomic) UIPickerView *pickerView;
@property (nonatomic) NSArray *pickerViewOptions;

// Store GuessMyOrder foodItems and storeLocations here
@property (nonatomic) NSArray *cart;
@property (nonatomic) NSString *store;

@end