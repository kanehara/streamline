//
//  ComfirmationViewController.h
//  Streamline
//
//  Created by kanehara on 9/6/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ComfirmationViewControllerDelegate <NSObject>
- (void)dismissAndPresentShopViewController;
@end

@interface ComfirmationViewController : UIViewController

@property (nonatomic, weak) id<ComfirmationViewControllerDelegate> delegate;

@end
