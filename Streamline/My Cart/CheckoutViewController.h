//
//  CheckoutViewController.h
//  Streamline
//
//  Created by kanehara on 8/29/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCarts.h"

@interface CheckoutViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    myCarts *_myCartsInstance;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) IBOutlet UILabel *storeLabel;
@property (nonatomic) IBOutlet UILabel *totalLabel;

@property (nonatomic) NSString *store;

@end
