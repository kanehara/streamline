//
//  ReplaceTableViewCell.m
//  Streamline
//
//  Created by kanehara on 9/4/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "ReplaceTableViewCell.h"

@implementation ReplaceTableViewCell

- (IBAction)buttonClicked:(id)sender {
    if (sender == self.addToCartButton) {
        [self.delegate buttonActionForIndexPath:self.cellIndexPath isReplace:NO];
    }
    else if (sender == self.replaceButton) {
        [self.delegate buttonActionForIndexPath:self.cellIndexPath isReplace:YES];
    }
    else {
        NSLog(@"Invalid sender for action buttonClicked in ReplaceTableViewCell.m");
    }
}

@end
