//
//  webTransaction.h
//  TraitWare
//
//  Created by Ruvato on 17/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface webTransaction : NSObject

@property (strong, nonatomic) NSString *tenantName;
@property (strong, nonatomic) NSString *sourceTransactionId;
@property (strong, nonatomic) NSNumber *taxAmount;
@property (strong, nonatomic) NSNumber *shippingAmount;
@property (strong, nonatomic) NSNumber *totalAmount;
@property (strong, nonatomic) NSString *transactionType;
@property (strong, nonatomic) NSString *href;

@property (strong, nonatomic) NSData *createdAt;


@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSDictionary *verification;


@end
