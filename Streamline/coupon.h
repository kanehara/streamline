//
//  coupon.h
//  Streamline
//
//  Created by kanehara on 9/6/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface coupon : NSObject

@property (nonatomic) NSString *store;
@property (nonatomic) NSString *offer;
@property (nonatomic) NSString *code;
@property (nonatomic) NSString *expirationDate;

- (id)initWithStore:(NSString*)store offer:(NSString*)offer code:(NSString*)code expirationDate:(NSString*)expirationDate;

@end
