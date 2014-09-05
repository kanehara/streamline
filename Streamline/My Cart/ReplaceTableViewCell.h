//
//  ReplaceTableViewCell.h
//  Streamline
//
//  Created by kanehara on 9/4/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ReplaceTableViewCellDelegate <NSObject>
- (void)replaceButtonActionForIndexPath:(NSIndexPath*)indexPath;
- (void)addToCartButtonActionForIndexPath:(NSIndexPath*)indexPath;
@end

@interface ReplaceTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *foodNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UITextField *quantityField;
@property (nonatomic, weak) IBOutlet UIButton *addToCartButton;
@property (nonatomic, weak) IBOutlet UIButton *replaceButton;

@property (nonatomic, strong) NSIndexPath *cellIndexPath;

@property (nonatomic, weak) id<ReplaceTableViewCellDelegate> delegate;

@end
