//
//  StoreCartViewController.m
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "StoreCartViewController.h"
#import "myCarts.h"

@interface StoreCartViewController ()

@end

@implementation StoreCartViewController

@synthesize store = _store;
@synthesize editButon = _editButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initMyCartsInstance];
    
    [self initEditButton];
}

- (void)initMyCartsInstance {
    _myCartsInstance = [myCarts getInstance];
}

- (void)initEditButton {
    _editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                   style:UIBarButtonItemStylePlain target:self
                                                  action:@selector(enableEditingOfTableView)];
    self.navigationItem.rightBarButtonItem = _editButton;
}

- (void)enableEditingOfTableView {
    [self.tableView setEditing:YES animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    return cart.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeCartCell" forIndexPath:indexPath];
    
    NSMutableArray *cart = [_myCartsInstance.storeCartDictionary objectForKey:_store];
    
    cell.textLabel.text = cart[indexPath.row];
    
    return cell;
}

@end
