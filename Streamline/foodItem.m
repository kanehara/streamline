//
//  foodItem.m
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "foodItem.h"

@implementation foodItem

@synthesize foodItemCategory = _foodItemCategory;
@synthesize foodItemName = _foodItemName;
@synthesize foodItemPrice = _foodItemPrice;
@synthesize foodID = _foodID;

- (id) init {
    self = [super self];
    if (self) {
        _foodID = 0;
        _foodItemPrice = 0;
        _foodItemName = @"Nil";
        _foodItemCategory = @"Nada";
    }
    return self;
}

- (id)initWithName:(NSString *)name withPrice:(float)price withCategory:(NSString *)category withFoodID:(NSString *)foodID {
    self = [super init];
    
    _foodItemName = name;
    _foodItemPrice = price;
    _foodItemCategory = category;
    _foodID = foodID;
    
    return self;
}

- (BOOL) isEqual:(id)object {
    foodItem *objectFoodItem = (foodItem*)object;
    
    if ([objectFoodItem.foodID isEqualToString:_foodID]) {
        return YES;
    }
    return NO;
}

@end
