//
//  NetworkManager.m
//  TraitWare
//
//  Created by Ruvato on 22/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "NetworkManager.h"
#import "Constants.h"
#import "CommonMethods.h"
#import "XMLParser.h"


@implementation NetworkManager
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(id) getFromServer:(NSString*)stringToAppend useSession:(BOOL)useSession dataType:(BOOL)isImage
{
   
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",SERVER_URL,stringToAppend];
    if(isImage)
    {
       strUrl = stringToAppend;
    }
   
    NSLog(@"requestURL:%@",strUrl);
    NSURL *url = [NSURL URLWithString:strUrl];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];

//        NSString *postData = @"{\"photoSetLength\":24}";
//        [request addRequestHeader:@"Accept" value:@"application/json"];
//        [request addRequestHeader:@"Content-type" value:@"application/json"];
//        [request appendPostData:[postData dataUsingEncoding:NSUTF8StringEncoding]];
//        request.requestMethod = @"POST";

    if (useSession) {
        if([CommonMethods getValueFromUserDefaultForKey:@"appSessionId"] !=nil)
        {
            
        }
        else
        {
            [request addRequestHeader:@"sessionId" value:[CommonMethods getValueFromUserDefaultForKey:@"regSessionId"]];
            //[request addRequestHeader:@"sessionId" value:@"asdasd adas das das dasda"];
        }
    }
    [request startSynchronous];
    NSError *error = [request error];
    NSString *receivedString = [request responseString];
    NSLog(@"revcive Data: %@",receivedString);
    if (!error) {
        
        //NSLog(@"revcive Data: %@",receivedString);

        NSError* cError;
        if(!isImage)
        {
            NSString *receivedString = [request responseString];
            NSLog(@"revcive Data: %@",receivedString);
            
           // NSURL *url = [[NSURL alloc] initWithString:@"http://sites.google.com/site/iphonesdktutorials/xml/Books.xml"];
            NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
         
            
            //Initialize the delegate.
            XMLParser *parser = [[XMLParser alloc] initXMLParser];
            
            //Set delegate
            [xmlParser setDelegate:parser];
            
            //Start parsing the XML file.
            BOOL success = [xmlParser parse];
            
            if(success)
                NSLog(@"No Errors");
            else
                NSLog(@"Error Error Error!!!");
            
            return xmlParser;

            //Start parsing the XML file.
            //BOOL success = [xmlParser parse];
            
//            if(success){
//                NSLog(@"No Errors");
//                return xmlParser;
//            }
//            else
//                NSLog(@"Error Error Error!!!");
            
        }
        else
        {
            return [request responseData];
        }
    }
    else
    {
        return  Nil;
    }
    return Nil;
    
}

+(id) getFromServer:(NSString*)stringToAppend
{
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",SERVER_URL,stringToAppend];
       
    NSLog(@"requestURL:%@",strUrl);
    NSURL *url = [NSURL URLWithString:strUrl];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    //        NSString *postData = @"{\"photoSetLength\":24}";
    //        [request addRequestHeader:@"Accept" value:@"application/json"];
    //        [request addRequestHeader:@"Content-type" value:@"application/json"];
    //        [request appendPostData:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    //        request.requestMethod = @"POST";
    
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
      
       
            NSString *receivedString = [request responseString];
        NSLog(@"recivedData:%@",receivedString);
            return receivedString;
    }
    else
    {
        return  Nil;
    }
    return Nil;
    
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    
    NSError* cError;
	NSString *receivedString = [request responseString];
    NSData *responseData = [receivedString dataUsingEncoding:NSUTF8StringEncoding ];
    NSDictionary* resultJson = [NSJSONSerialization JSONObjectWithData:responseData //1
                                                               options:kNilOptions
                                                                 error:&cError];
    
    [self.delegate networkRequestFinished:request json:resultJson];
    NSLog(@"Result:%@",receivedString);
	
}
- (void)requestFailed:(ASIHTTPRequest *)request {
	
    NSError* cError;
	NSString *receivedString = [request responseString];
    NSData *responseData = [receivedString dataUsingEncoding:NSUTF8StringEncoding ];
    NSDictionary* resultJson = [NSJSONSerialization JSONObjectWithData:responseData //1
                                                               options:kNilOptions
                                                                 error:&cError];
    
    [self.delegate networkRequestFailed:request json:resultJson];
    NSLog(@"Error:%@",receivedString);
	
}

//XMLParser.m
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict

{
 
    NSLog(@"Processing Element: ");
    if([elementName isEqualToString:@"Books"]) {
        //Initialize the array.

    }
    else if([elementName isEqualToString:@"Book"]) {
        
        
    }
    
    NSLog(@"Processing Element: %@", elementName);
}

@end
