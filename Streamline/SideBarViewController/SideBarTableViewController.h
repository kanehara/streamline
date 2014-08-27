//
//  SideBarTableViewController.h
//  Streamline Groceries
//
//  Created by kanehara on 8/15/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideBarTableViewController : UITableViewController


// The arrays holding name of side bar options
@property (nonatomic, strong) NSArray *sideBarOptions;

// The arrays holding name of side bar option segues
@property (nonatomic, strong) NSArray *sideBarSegues;

@end
