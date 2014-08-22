//
//  GuessMyOrderTableViewController.h
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessMyOrderTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

// THE DUMMY DATA --- delete in future versions when implementing real data
@property (nonatomic, strong) NSArray *dummyGuessMyOrder;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
