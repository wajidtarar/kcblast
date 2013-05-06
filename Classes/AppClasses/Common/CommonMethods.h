//
//  CommonMethods.h
//  TraitWare
//
//  Created by Ruvato on 22/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonMethods : NSObject
+(void)showAlert:(NSString*)title message:(NSString*)msg;
+(void)setUserDefaultValue:(id)value forKey:(NSString*)value;
+(id)getValueFromUserDefaultForKey:(NSString*)key;
+ (NSString*) createTraitSignatureAlbums;
+ (NSString*) createTraitSignatureContacts;
+ (NSString*) createTraitSignatureNumber;
+ (NSString*)MACAddress;
+(NSString*)getAppCurrentVersion;
+(NSString*)getAppUserAgent;
+(NSString*)convertToJson:(NSDictionary*)dic;
+(NSString*)currentDevice;
+(void)setUpPageController:(UIPageControl*)pageController size:(int)size;
+(void)setUpPageController1:(UIPageControl*)pageController size:(int)size;

@end
