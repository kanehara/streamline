//
//  StoreCartViewController.h
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCarts.h"
#import "CartTableViewCell.h"

@interface StoreCartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    myCarts *_myCartsInstance;
    float total;
    NSIndexPath *indexPathForReplacement;
}

@property (nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) IBOutlet UILabel *totalLabel;

@property (nonatomic, weak) IBOutlet UIView *buttonCover;

@property (nonatomic) UIBarButtonItem *editButon;

@property (nonatomic) NSString *store;

@end
