//
//  CustomViewController.m
//  Streamline
//
//  Created by kanehara on 8/20/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "CustomViewController.h"
#import "SWRevealViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

@synthesize sideBarButton = _sideBarButton;

- (void) viewDidLoad {
    [self initSideBarButton];
}

- (void) initSideBarButton {
    // allocate sideBarButton
    _sideBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style: UIBarButtonItemStylePlain target:nil action:nil];
    
    // sideBarButton config
    _sideBarButton.tintColor = [UIColor colorWithWhite:.3 alpha:1];
    _sideBarButton.target = self.revealViewController;
    _sideBarButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.navigationItem setLeftBarButtonItem:_sideBarButton];
}

@end
