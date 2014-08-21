//
//  StoresNearbyTableViewController.h
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoresNearbyTableViewController : UITableViewController

// THE DUMMY DATA --- delete in future versions when implementing real data
@property (nonatomic, strong) NSArray *dummyStoreName;
@property (nonatomic, strong) NSArray *dummyStoreAddress;

@end
