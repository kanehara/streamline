//
//  foodCategoryViewController.h
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface foodCategoryViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

// Array of food categories
@property (nonatomic, strong) NSArray *foodCategory;

// To be sent to next view - list of food available at store in selected category
@property (nonatomic, strong) NSArray *availableFood;

@end
