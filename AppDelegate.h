//
//  AppDelegate.h
//  TraitWare
//
//  Created by Ruvato on 15/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+(NSString *) getUUID;




@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *imagesLinks;
@property (nonatomic, strong) NSMutableArray *imagesArray;


@end
