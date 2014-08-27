//
//  cartItem.m
//  Streamline
//
//  Created by kanehara on 8/22/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "cartItem.h"

@implementation cartItem

@synthesize cartItemFoodItem = _cartItemFoodItem;
@synthesize cartItemQuantity = _cartItemQuantity;
@synthesize cartItemTotalCost = _cartItemTotalCost;

-(id)init {
    self = [super init];
    _cartItemQuantity = 0;
    _cartItemTotalCost = 0;
    return self;
}

- (BOOL) isEqual:(id)object {
    cartItem *objectItem = (cartItem*)object;
    if ([objectItem.cartItemFoodItem isEqual:_cartItemFoodItem]) {
        return YES;
    }
    return NO;
}

- (id)initWithCartItem:(cartItem *)item {
    self = [super init];
    _cartItemQuantity = item.cartItemQuantity;
    _cartItemTotalCost = item.cartItemTotalCost;
    _cartItemFoodItem = item.cartItemFoodItem;
    return self;
}

- (id)initWithFoodItem:(foodItem *)item withQuantity:(float)quantity {
    self = [super init];
    
    _cartItemFoodItem = item;
    
    _cartItemQuantity = 0;
    [self addQuantity:quantity];
    
    return self;
}

-(void)addQuantity:(float)quantity {
    _cartItemQuantity += quantity;
    _cartItemTotalCost += quantity*_cartItemFoodItem.foodItemPrice;
}

@end
