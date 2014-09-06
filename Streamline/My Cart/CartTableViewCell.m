//
//  CartTableViewCell.m
//  Streamline
//
//  Created by kanehara on 8/28/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "CartTableViewCell.h"

@implementation CartTableViewCell


- (IBAction)buttonClicked:(id)sender {
    if (sender == self.deleteButton) {
        [self.delegate deleteButtonActionForItem:self.foodName];
    }
    else if (sender == self.replaceButton) {
        [self.delegate replaceButtonActionForItem:self.foodName];
    }
    else {
        NSLog(@"Clicked unknown button");
    }
}

- (IBAction)quantityUpdated:(id)sender {
    if (sender == self.quantityTextField) {
        [self.delegate updateQuantityActionForIndexPath:self.cellIndexPath
                                           withQuantity:[self.quantityTextField.text floatValue]];
    }
}

@end
