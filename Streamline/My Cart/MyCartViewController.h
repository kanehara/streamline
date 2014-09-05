//
//  MyCartViewController.h
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "CustomViewController.h"

@interface MyCartViewController : CustomViewController <UITableViewDataSource, UITableViewDelegate> {
    NSString *_store;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;


@end
