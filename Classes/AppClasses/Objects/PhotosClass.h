//
//  PhotosClass.h
//  TraitWare
//
//  Created by Ruvato on 17/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotosClass : NSObject

@property (strong, nonatomic) NSString *photoUuid;
@property (strong, nonatomic) NSString *href;
@property (strong, nonatomic) NSString *photoId;
@property (strong, nonatomic) UIImage *photo;

@end
