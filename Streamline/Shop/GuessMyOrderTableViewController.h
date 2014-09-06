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
    
    // Placeholder for the store to send to StoreCartViewController
    NSString *_store;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic) UIPickerView *pickerView;
@property (nonatomic) NSArray *pickerViewOptions;

// Store GuessMyOrder foodItems and storeLocations here
@property (nonatomic) NSArray *foodItems;
@property (nonatomic) NSArray *storeLocations;

@property (nonatomic) cartItem *cartItemToAdd;

@end
