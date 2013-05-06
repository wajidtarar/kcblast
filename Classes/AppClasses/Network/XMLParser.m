//
//  XMLParser.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "XMLParser.h"


@implementation XMLParser

- (XMLParser *) initXMLParser {
	
	
	appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"iamge_info"]) {
		//Initialize the array.
        appDelegate.imagesLinks = [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"image"]) {
		
        imageUrl = [[NSString alloc] init];

		//Initialize the book.
    }
	NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
    currentElementValue = [[NSMutableString alloc] initWithString:string];

    
//	if(!currentElementValue)
//		currentElementValue = [[NSMutableString alloc] initWithString:string];
//	else
//		[currentElementValue appendString:string];
	
	NSLog(@"Processing Value: %@", currentElementValue);
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"iamge_info"])
		return;
	
	//There is nothing to do if we encounter the Books element here.
	//If we encounter the Book element howevere, we want to add the book object to the array
	// and release the object.
	if([elementName isEqualToString:@"image"]) {
        
        [appDelegate.imagesLinks addObject:currentElementValue];

	}
	else
        
	currentElementValue = nil;
}

- (void) dealloc {
	
}

@end
