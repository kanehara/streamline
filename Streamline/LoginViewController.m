//
//  LoginViewController.m
//  Streamline
//
//  Created by kanehara on 9/6/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initTapGesture];
}

- (void) initTapGesture {
    // Set tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(onTapGesture)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)onTapGesture {
    if ([self.userNameField isFirstResponder]) {
        [self textFieldShouldReturn:self.userNameField];
    }
    else if ([self.passwordField isFirstResponder]) {
        [self textFieldShouldReturn:self.passwordField];
    }
    else {
        // DO NOTHINGS
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.userNameField) {
        [textField resignFirstResponder];
        return YES;
    }
    else if (textField == self.passwordField) {
        [textField resignFirstResponder];
        if ((self.userNameField.text.length == 0) || (self.passwordField.text.length == 0)) {
            // case when username or password field is empty
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Complete Forms" message:@"Must Enter Username and Password" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
            [alert show];
            return NO;
        }
        else {
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
            return YES;
        }
    }
    else {
        NSLog(@"Invalid textField in textFieldShouldReturn in LoginViewController.m");
        return NO;
    }
}

@end
