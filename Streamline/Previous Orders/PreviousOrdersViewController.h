//
//  PreviousOrdersViewController.h
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "CustomViewController.h"

@interface PreviousOrdersViewController : CustomViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *stores;

@end
