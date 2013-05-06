//
//  WebServicesManager.h
//  TraitWare
//
//  Created by Ruvato on 16/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import <UIKit/UIKit.h>
#import "NetworkManager.h"
#import "PhotosClass.h"

#import "AppDelegate.h"

@class WebServicesManager;

@protocol WebServicesManagerDelegate <NSObject>

@optional
-(void)RequestResponse:(BOOL)response;
-(void)RequestResponse:(BOOL)response recieveData:(NSString*)recieveData;
-(void)RequestResponse:(BOOL)response recievetransactionData:(NSMutableArray*)recieveData;
-(void)imagesFetch:(NSMutableArray*)imagesArray response:(BOOL)response;
-(void)imageLoaded:(UIImage*)image forIndexPath:(NSIndexPath*)indexPath response:(BOOL)response;
@end


@interface WebServicesManager : NSObject
{
    AppDelegate *appDelegate;
    
}


@property (nonatomic,weak)id<WebServicesManagerDelegate>delegate;
-(void)startUpRegistration:(NSString*)registrationCode;
-(void)getWebTransactions;
-(void)getPhotoAuthImagesList;
-(void)getPhotoAuthImage:(PhotosClass *)photo forIndexPath:(NSIndexPath*)indexPath;
-(void)registerDeviceAndCreateSession;
-(void)getTOS;
@end
