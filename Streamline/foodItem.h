//
//  foodItem.h
//  Streamline
//
//  Created by kanehara on 8/23/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface foodItem : NSObject

@property (nonatomic) NSString *foodItemName;
@property (nonatomic) float foodItemPrice;
@property (nonatomic) NSString *foodItemCategory;
@property (nonatomic) NSString *foodID; // the unique ID of the food item

- (id)initWithName:(NSString*)name
         withPrice:(float)price
      withCategory:(NSString*)category
        withFoodID:(NSString*)foodID;

@end
