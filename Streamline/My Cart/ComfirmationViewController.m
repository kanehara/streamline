//
//  ComfirmationViewController.m
//  Streamline
//
//  Created by kanehara on 9/6/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "ComfirmationViewController.h"

@interface ComfirmationViewController ()

@end

@implementation ComfirmationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onContinueShoppingPress:(id)sender {
    [self.delegate dismissAndPresentShopViewController];
}

@end
