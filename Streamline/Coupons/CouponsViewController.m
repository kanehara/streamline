//
//  CouponsViewController.m
//  Streamline
//
//  Created by kanehara on 8/21/26 H.
//  Copyright (c) 26 Heisei kanehara. All rights reserved.
//

#import "CouponsViewController.h"
#import "coupon.h"

@interface CouponsViewController ()

@end

@implementation CouponsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initDummyCoupons];
}

- (void)initDummyCoupons {
    coupon *coupon0 = [[coupon alloc] initWithStore:@"Hiller's on Troy" offer:@"%10 off produce" code:@"12345" expirationDate:@"12/3/2014"];
    coupon *coupon1 = [[coupon alloc] initWithStore:@"Trader Joe's on Main" offer:@"%5 off fruits" code:@"fruity" expirationDate:@"11/5/2014"];
    coupon *coupon2 = [[coupon alloc] initWithStore:@"Meijer on Grand River" offer:@"Buy one Prego Sauce Get One Free" code:@"B1G1FreePrego" expirationDate:@"11/12/2014"];
    coupon *coupon3 = [[coupon alloc] initWithStore:@"Whole Foods on Rochester" offer:@"$5 off next purchase over $50" code:@"woo" expirationDate:@"11/28/2014"];
    
    self.coupons = @[coupon0, coupon1, coupon2, coupon3];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.coupons.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"couponCell" forIndexPath:indexPath];
    
    UILabel *couponStoreLabel = (UILabel*)[cell viewWithTag:1];
    UILabel *couponOfferLabel = (UILabel*)[cell viewWithTag:2];
    UILabel *couponCodeLabel = (UILabel*)[cell viewWithTag:3];
    UILabel *expDateLabel = (UILabel*)[cell viewWithTag:4];
    
    coupon *cellCoupon = self.coupons[indexPath.row];
    
    couponStoreLabel.text = cellCoupon.store;
    couponOfferLabel.text = cellCoupon.offer;
    couponCodeLabel.text = cellCoupon.code;
    expDateLabel.text = [NSString stringWithFormat:@"Exp. Date: %@", cellCoupon.expirationDate];
    
    return cell;
}

@end
