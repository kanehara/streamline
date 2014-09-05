//
//  myCarts.h
//  Streamline
//
//  Created by kanehara on 8/22/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

// WILL HOLD THE DATA FOR THE CART
// The carts from respective stores will be placed inside of a NSMutableDictionary
// Where the key will be the store
// And the value will be an array of food items to represent the cart

#ifndef Streamline_myCarts_h
#define Streamline_myCarts_h

#import <Foundation/Foundation.h>
#import "cartItem.h"

@interface myCarts : NSObject

@property (nonatomic, strong) NSMutableDictionary *storeCartDictionary;

+ (myCarts*)getInstance;
- (NSUInteger)itemCountForStore:(NSString*)store;
- (NSString*)storeAtIndex:(NSIndexPath*)indexPath;
- (cartItem*)itemAtIndex:(NSIndexPath*)indexPath forStore:(NSString*)store;
- (void)addCartItem:(cartItem*)newCartItem toStore:(NSString*)store;
- (void)removeCartItemAtIndex:(NSUInteger)index fromStore:(NSString*)store;

@end

#endif