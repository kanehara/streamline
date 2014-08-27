//
//  foodItem.h
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface foodItem : NSObject

@property (nonatomic, strong, readonly) NSString *foodItemName;
@property (nonatomic, readonly) float foodItemPrice;
@property (nonatomic, strong, readonly) NSString *foodItemCategory;
@property (nonatomic, strong, readonly) NSString *foodID; // the unique ID of the food item

- (id)initWithName:(NSString*)name
         withPrice:(float)price
      withCategory:(NSString*)category;

@end
