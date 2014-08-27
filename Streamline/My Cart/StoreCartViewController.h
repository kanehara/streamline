//
//  StoreCartViewController.h
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCarts.h"

@interface StoreCartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    myCarts *_myCartsInstance;
}

@property (nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) UIBarButtonItem *editButon;

@property (nonatomic) NSString *store;

@end
