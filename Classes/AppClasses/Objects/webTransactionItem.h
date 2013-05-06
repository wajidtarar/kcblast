//
//  webTransactionItem.h
//  TraitWare
//
//  Created by Ruvato on 17/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface webTransactionItem : NSObject

@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSNumber *unitCost;
@property (strong, nonatomic) NSString *quantity;
@property (strong, nonatomic) NSString *totalAmount;


@end
