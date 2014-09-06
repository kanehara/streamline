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

// Adds 'quantity' to current quantity value
- (void)addQuantity:(float)quantity;
// Replaces current quantity value with new quantity value
- (void)updateQuantity:(float)quantity;

- (id)initWithCartItem:(cartItem*)item;

- (id)initWithFoodItem:(foodItem*)item withQuantity:(float)quantity;

@end
