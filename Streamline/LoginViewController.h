//
//  LoginViewController.h
//  Streamline
//
//  Created by kanehara on 9/6/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) IBOutlet UITextField *userNameField;
@property (nonatomic) IBOutlet UITextField *passwordField;

@end
