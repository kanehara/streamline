//
//  cartItem.h
//  Streamline
//
//  Created by kanehara on 8/22/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "foodItem.h"

@interface cartItem : NSObject

@property (nonatomic, strong) foodItem *cartItemFoodItem;
@property (nonatomic) float cartItemQuantity;
@property (nonatomic) float cartItemTotalCost;

- (void)addQuantity:(float)quantity;

- (id)initWithCartItem:(cartItem*)item;

- (id)initWithFoodItem:(foodItem*)item withQuantity:(float)quantity;

@end
