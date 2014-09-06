//
//  StoreCartViewController.h
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCarts.h"

@interface StoreCartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate> {
    myCarts *_myCartsInstance;
    float total;
    NSIndexPath *indexPathForReplacement;
    
    UITextField *_textFieldBeingEdited;
}

@property (nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) IBOutlet UILabel *totalLabel;

@property (nonatomic, weak) IBOutlet UIView *buttonCover;

@property (nonatomic) UIPickerView *pickerView;
@property (nonatomic) NSArray *pickerViewOptions;

@property (nonatomic) UIBarButtonItem *editButon;

@property (nonatomic) NSString *store;

@end
