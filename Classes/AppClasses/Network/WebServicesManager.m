//
//  WebServicesManager.m
//  TraitWare
//
//  Created by Ruvato on 16/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "WebServicesManager.h"
#import "Constants.h"
#import "CommonMethods.h"
#import "webTransaction.h"

@implementation WebServicesManager


- (id)init
{
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)getTOS
{
   
    NSDictionary *result =  [NetworkManager getFromServer:@"tos"];
    if(result!=nil)
    {
        NSMutableArray *data = [[NSMutableArray alloc] init];
        [data addObject:[NSNumber numberWithInt:0]];
       
        NSLog(@"result:%@",result);
        [data addObject:[NSNumber numberWithBool:YES]];
        [data addObject:result];
        [self performSelectorOnMainThread:@selector(calledResponseOnMainThread:) withObject:data waitUntilDone:NO];
        
    }
    else
    {
        [self FailureMessage:@"Unexpected Response" Detail:@"Unexpected Data" method:0];
    }
}

-(void)startUpRegistration:(NSString*)registrationCode
{
    NSString *stringToAppend = [NSString stringWithFormat:@"%@%@", @"registration/", registrationCode];
    NSDictionary *result =  [NetworkManager getFromServer:stringToAppend useSession:NO  dataType:NO];
    if(result!=nil)
    {
        @try {
            NSMutableArray *data = [[NSMutableArray alloc] init];
            [data addObject:[NSNumber numberWithInt:1]];
            if([result objectForKey:@"code"]!= nil)
            {
                
                NSMutableArray *array = [[NSMutableArray alloc] init];
                [array addObject:[NSString stringWithFormat:@"Error Code:%@",[result objectForKey:@"code"]]];
                if([result objectForKey:@"message"])
                {
                    [array addObject:[result objectForKey:@"message"]];
                }
                else if([result objectForKey:@"error"] )
                {
                    [array addObject:[result objectForKey:@"error"]];
                }
                else
                {
                    [array addObject:@"Unexpected Error"];
                }
                [self performSelectorOnMainThread:@selector(showMsgOnMainThread:) withObject:array waitUntilDone:NO];
                [data addObject:[NSNumber numberWithBool:NO]];
            }
            else if([result objectForKey:@"sessionId"]!=nil)
            {
                
                [data addObject:[NSNumber numberWithBool:YES]];
                [CommonMethods setUserDefaultValue:[result objectForKey:@"sessionId"] forKey:@"regSessionId"];
                [CommonMethods setUserDefaultValue:[[[result objectForKey:@"settings"] objectForKey:@"photoAuth"] objectForKey:@"settings"] forKey:@"photoAuthSettings"];
                
            }
            else
            {
                [data addObject:[NSNumber numberWithBool:NO]];
                NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Unexpected Response",[result objectForKey:@"Unexpected Data"], nil];
                [self performSelectorOnMainThread:@selector(showMsgOnMainThread:) withObject:array waitUntilDone:NO];
                
            }
            [self performSelectorOnMainThread:@selector(calledResponseOnMainThread:) withObject:data waitUntilDone:NO];

        }
        @catch (NSException *exception) {
            NSLog(@"startUpRegistrationException:%@",exception);
        }
        @finally {
            
        }
        
    }
    else
    {
        [self FailureMessage:@"Unexpected Response" Detail:@"Unexpected Data" method:1];
    }
}
-(void)registerDeviceAndCreateSession
{
    
     UIDevice* device = [UIDevice currentDevice];
     NSString *stringToAppend = @"/devices";
    
    NSString *registrationCode = @"123445";//[CommonMethods getValueFromUserDefaultForKey:@"registrationCode"];
    NSString *deviceName = [device name];
    NSString *IdentifierForVendor = @"";
    NSString *deviceModel = [device model];
    NSString *currentOSVer = [[NSProcessInfo processInfo] operatingSystemVersionString];
    NSString *MacAddress = [CommonMethods MACAddress];
    NSString *notificationId = @"";
    NSString *userAgent = [CommonMethods getAppUserAgent];
    NSString *appVersion = [CommonMethods getAppCurrentVersion];
    NSString *appName = kAppName;
    
    NSDictionary *screenName = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithFloat:[[UIScreen mainScreen] bounds].size.width],@"width",[NSNumber numberWithFloat:[[UIScreen mainScreen] bounds].size.height],@"height",[NSNumber numberWithFloat:[[UIScreen mainScreen] scale]],@"scale", nil];
    NSString *traitWareSongSignature = [CommonMethods createTraitSignatureAlbums];
    NSString *traitWareContactSignature = [CommonMethods createTraitSignatureContacts];
    NSString *traitWareNumberSignature = [CommonMethods createTraitSignatureNumber];
   
    NSDictionary *deviceRegistraion = [[NSDictionary alloc] initWithObjectsAndKeys:registrationCode,@"registrationCode",deviceName,@"deviceName",IdentifierForVendor,@"IdentifierForVendor",deviceModel,@"deviceModel",currentOSVer,@"osVersion",MacAddress,@"macAddress",notificationId,@"notificationId",userAgent,@"userAgent",appVersion,@"appVersion",appName,@"appName",screenName,@"screen",traitWareContactSignature,@"contactFullNameSignature",traitWareNumberSignature,@"contactPhoneNumberSignature",traitWareSongSignature,@"musicLibrarySongListSignature", nil];
    
    
    NSString *json = [CommonMethods convertToJson:deviceRegistraion];
    NSLog(@"%@",json);
    
    
    //NSLog(@"Code:%@ name:%@ model:%@ OSVer:%@ macAddress:%@ Agent:%@ screen:%@",registrationCode,deviceName,deviceModel,currentOSVer,MacAddress,userAgent,screenName);
    
//    NSDictionary *result =  [NetworkManager getFromServer:stringToAppend useSession:NO  dataType:NO];
//    if(result!=nil)
//    {
//        NSMutableArray *data = [[NSMutableArray alloc] init];
//        [data addObject:[NSNumber numberWithInt:1]];
//        if([result objectForKey:@"code"]!= nil)
//        {
//            
//            NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"Error Code:%@",[result objectForKey:@"code"]],[result objectForKey:@"message"], nil];
//            [self performSelectorOnMainThread:@selector(showMsgOnMainThread:) withObject:array waitUntilDone:NO];
//            [data addObject:[NSNumber numberWithBool:NO]];
//        }
//        else if([result objectForKey:@"sessionId"]!=nil)
//        {
//            
//            [data addObject:[NSNumber numberWithBool:YES]];
//            [CommonMethods setUserDefaultValue:[result objectForKey:@"sessionId"] forKey:@"regSessionId"];
//            [CommonMethods setUserDefaultValue:[[[result objectForKey:@"settings"] objectForKey:@"photoAuth"] objectForKey:@"settings"] forKey:@"photoAuthSettings"];
//            
//        }
//        else
//        {
//            [data addObject:[NSNumber numberWithBool:NO]];
//            NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Error",[result objectForKey:@"Unknown Error"], nil];
//            [self performSelectorOnMainThread:@selector(showMsgOnMainThread:) withObject:array waitUntilDone:NO];
//            
//        }
//        [self performSelectorOnMainThread:@selector(calledResponseOnMainThread:) withObject:data waitUntilDone:NO];
//        
//    }
}
-(void)getPhotoAuthImagesList
{
//    NSString *stringToAppend = [NSString stringWithFormat:@"%@?photoSetLength=%@", @"photos", [[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"photoSetLength"]];
//    
    NSString *stringToAppend = [NSString stringWithFormat:@"searchImage.php?keyWord=e&ageGroup=1,2,3&eventId=1,2,3,5"];
   //  NSString *stringToAppend = [NSString stringWithFormat:@"%@%@", @"photos", registrationCode];
    id result =  [NetworkManager getFromServer:stringToAppend useSession:NO  dataType:NO];
    
    if(result!=nil)
    {
        NSMutableArray *data = [[NSMutableArray alloc] init];
        [data addObject:[NSNumber numberWithInt:2]];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];

        [data addObject:[NSNumber numberWithBool:YES]];
        [data addObject:resultArray];
        [self performSelectorOnMainThread:@selector(calledResponseOnMainThread:) withObject:data waitUntilDone:NO];
        
        

        
        NSURL *url = [[NSURL alloc] initWithString:@"http://sites.google.com/site/iphonesdktutorials/xml/Books.xml"];
        NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        
        //Initialize the delegate.
        
        //Set delegate
        
        //Start parsing the XML file.
        BOOL success = [xmlParser parse];
        
        if(success)
            NSLog(@"No Errors");
        else
            NSLog(@"Error Error Error!!!");
        
        
    }
}
-(void)FailureMessage:(NSString *)header Detail:(NSString*)detail method:(int)type
{
    NSLog(@"FailureMessage FailureMessage");
    NSMutableArray *data = [[NSMutableArray alloc] init];
    [data addObject:[NSNumber numberWithInt:type]];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:header,detail, nil];
    [self performSelectorOnMainThread:@selector(showMsgOnMainThread:) withObject:array waitUntilDone:NO];
    [data addObject:[NSNumber numberWithBool:NO]];
    [self performSelectorOnMainThread:@selector(calledResponseOnMainThread:) withObject:data waitUntilDone:NO];
}
-(void)showMsgOnMainThread:(id)data
{
   
    [CommonMethods showAlert:[data objectAtIndex:0] message:[data  objectAtIndex:1]];

}
-(void)getPhotoAuthImage:(PhotosClass *)photo forIndexPath:(NSIndexPath*)indexPath
{
    id result =  [NetworkManager getFromServer:photo.href useSession:YES  dataType:YES];
    
    if(result!=nil)
    {
        @try {
            if([result isKindOfClass:[NSDictionary class]])
            {
                if([result objectForKey:@"code"]!= nil)
                {
                    
                    [self FailureMessage:[NSString stringWithFormat:@"Error Code:%@",[result objectForKey:@"code"]] Detail:@"Unexpected Error" method:3];
                }
                else
                {
                    [self FailureMessage:@"Unexpected Error Code" Detail:@"Unexpected Error" method:3];
                }
            }
            else if([result isKindOfClass:[NSData class]])
            {
                @try {
                    
                    NSMutableArray *data = [[NSMutableArray alloc] init];
                    [data addObject:[NSNumber numberWithInt:3]];
                    [data addObject:[NSNumber numberWithBool:YES]];
                    [data addObject:[UIImage imageWithData:result]];
                    [data addObject:indexPath];
                    photo.photo = [UIImage imageWithData:result];
                    [self performSelectorOnMainThread:@selector(calledResponseOnMainThread:) withObject:data waitUntilDone:NO];
                    
                }
                @catch (NSException *exception) {
                    
                    [self FailureMessage:@"Unexpected response" Detail:@"Unexpected Data" method:3];
                    
                    
                }
                @finally {
                    
                }
                
            }
            else
            {
                [self FailureMessage:@"Unexpected Response" Detail:@"Unexpected Data" method:3];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"getPhotoAuthImageException:%@",exception);
        }
        @finally {
            
        }
        
    
    }
    else
    {
        [self FailureMessage:@"Unexpected Response" Detail:@"Unexpected Data" method:3];
    }

}
-(void)calledResponseOnMainThread:(NSMutableArray*)data
{
    int delegateMethoNum = [[data objectAtIndex:0] intValue];
    
    if(delegateMethoNum ==0)
    {
        if([[data objectAtIndex:1] boolValue])
        {
            [self.delegate RequestResponse:[[data objectAtIndex:1] boolValue] recieveData:[data objectAtIndex:2]];
        }
        else
        {
            [self.delegate RequestResponse:[[data objectAtIndex:1] boolValue] recieveData:nil];
        }
    }
    else if(delegateMethoNum ==1)
    {
        [self.delegate RequestResponse:[[data objectAtIndex:1] boolValue]];
    }
    else if(delegateMethoNum ==2)
    {
        if([[data objectAtIndex:1] boolValue])
        {
            [self.delegate imagesFetch:[data objectAtIndex:2] response:[[data objectAtIndex:1] boolValue]];
        }
        else
        {
            [self.delegate imagesFetch:nil response:[[data objectAtIndex:1] boolValue]];
        }
    }
    else if(delegateMethoNum ==3)
    {
        if([[data objectAtIndex:1] boolValue])
        {
            [self.delegate imageLoaded:[data objectAtIndex:2] forIndexPath:[data objectAtIndex:3] response:[[data objectAtIndex:1] boolValue]];
        }
        else
        {
            [self.delegate imageLoaded:nil forIndexPath:nil response:[[data objectAtIndex:1] boolValue]];
        }
    }
    
    else if(delegateMethoNum ==4)
    {
        NSLog(@"calledResponseOnMainThread: == 4");

        if([[data objectAtIndex:1] boolValue])
        {
            NSLog(@"calledResponseOnMainThread: yess");
            [self.delegate RequestResponse:[[data objectAtIndex:1] boolValue] recieveData:[data objectAtIndex:2]];
        }
        else
        {
            NSLog(@"calledResponseOnMainThread: nooo");
            [self.delegate RequestResponse:[[data objectAtIndex:1] boolValue] recievetransactionData:nil];
        }
    }

    
    
}


//XMLParser.m
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"Books"]) {
        //Initialize the array.

    }
    else if([elementName isEqualToString:@"Book"]) {
        
        NSLog(@"Reading id value ");
    }
    
    NSLog(@"Processing Element: ");
}



@end
