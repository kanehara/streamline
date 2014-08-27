//
//  myCarts.m
//  Streamline
//
//  Created by kanehara on 8/22/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

// This class contains global data about the carts

#import "myCarts.h"
#import "cartItem.h"
#import "foodItem.h"

@implementation myCarts
@synthesize storeCartDictionary = _storeCartDictionary;

- (id)init {
    self = [super init];
    if (self) {
        _storeCartDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (myCarts*)getInstance {
    static dispatch_once_t onceToken;
    static myCarts *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[myCarts alloc] init];
    });
    return instance;
}

// returns number of items in the cart for store
// returns -1 if store doesn't exist
-(NSUInteger) itemCountForStore:(NSString *)store {
    if ([_storeCartDictionary objectForKey:store]) {
        NSMutableArray *cart = [_storeCartDictionary objectForKey:store];
        return cart.count;
    }
    else {
        return -1;
    }
}

- (NSString*)storeAtIndex:(NSIndexPath *)indexPath {
    NSEnumerator *cartEnumerator = _storeCartDictionary.keyEnumerator;
    NSString *key;
    for (int i = 0; (key = [cartEnumerator nextObject]) && (i < indexPath.row); ++i) {
        // empty on purpose
    }
    return key;
}


// returns item at indexPath for store
// returns nil on error
- (cartItem*)itemAtIndex:(NSIndexPath *)indexPath forStore:(NSString *)store {
    NSMutableArray *cart = [_storeCartDictionary objectForKey:store];
    
    cartItem *item = cart[indexPath.row];
    
    return item;
    
}

- (void)addCartItem:(cartItem *)newCartItem toStore:(NSString *)store {
    NSMutableArray *cart = [_storeCartDictionary objectForKey:store];
    if (cart) { // case when cart at store is open
        for (int i = 0; i < cart.count; ++i) {
            if ([cart[i] isEqual:newCartItem]) {
                // food item is already in cart
                cartItem *existingCartItem = (cartItem*)cart[i];
                [existingCartItem addQuantity:newCartItem.cartItemQuantity];
                [_storeCartDictionary setObject:existingCartItem forKey:store];
                return;
            }
        }
    }
    // case when item is not in cart
    cartItem *brandNewCartItem = [[cartItem alloc] initWithCartItem:newCartItem];
    [cart addObject:brandNewCartItem];
    
    [_storeCartDictionary setObject:brandNewCartItem forKey:store];
    
}




@end
