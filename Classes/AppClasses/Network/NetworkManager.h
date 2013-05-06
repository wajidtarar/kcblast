//
//  NetworkManager.h
//  TraitWare
//
//  Created by Ruvato on 22/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import <UIKit/UIKit.h>

@class NetworkManager;

@protocol NetworkManagerDelegate <NSObject>

- (void)networkRequestFinished:(ASIHTTPRequest *)request json:(NSDictionary*)json;
- (void)networkRequestFailed:(ASIHTTPRequest *)request json:(NSDictionary*)json;;

@end

@interface NetworkManager : NSObject<ASIHTTPRequestDelegate>


@property (nonatomic,weak)id<NetworkManagerDelegate>delegate;

+(id) getFromServer:(NSString*)stringToAppend useSession:(BOOL)useSession dataType:(BOOL)isImage;
+(id) getFromServer:(NSString*)stringToAppend;

@end
