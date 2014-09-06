//
//  PreviousOrdersDetailViewController.h
//  Streamline
//
//  Created by kanehara on 8/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCarts.h"
#import "cartItem.h"

@interface PreviousOrdersDetailViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate> {

    myCarts *_myCartsInstance;
    
    // will hold text field being edited
    UITextField *_textFieldBeingEdited;
}

@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) IBOutlet UILabel *totalLabel;

@property (nonatomic) NSString* store;

@property (nonatomic) NSArray *cart;

@property (nonatomic) UIPickerView *pickerView;
@property (nonatomic) NSArray *pickerViewOptions;

@end
