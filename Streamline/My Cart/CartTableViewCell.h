//
//  CartTableViewCell.h
//  Streamline
//
//  Created by kanehara on 8/28/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CartTableViewCellDelegate <NSObject>
- (void)deleteButtonActionForItem:(NSString*)item;
- (void)replaceButtonActionForItem:(NSString*)item;
- (void)updateQuantityActionForIndexPath:(NSIndexPath*)indexPath withQuantity:(float)quantity;
@end

@interface CartTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIButton *deleteButton;
@property (nonatomic, weak) IBOutlet UIButton *replaceButton;
@property (nonatomic, weak) IBOutlet UILabel *foodNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtotalLabel;
@property (nonatomic, weak) IBOutlet UITextField *quantityTextField;

@property (nonatomic, strong) NSString *foodName;

@property (nonatomic) NSIndexPath *cellIndexPath;

@property (nonatomic, weak) id<CartTableViewCellDelegate> delegate;

@end
