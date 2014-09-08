//
//  coupon.m
//  Streamline
//
//  Created by kanehara on 9/6/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "coupon.h"

@implementation coupon

- (id)initWithStore:(NSString *)store offer:(NSString *)offer code:(NSString *)code expirationDate:(NSString *)expirationDate {
    self.store = store;
    self.offer = offer;
    self.code = code;
    self.expirationDate = expirationDate;
    return self;
}

@end
