//
//  NSData+Addition.h
//  TraitWare
//
//  Created by Charles Adetiloye on 4/8/12.
//  Copyright (c) 2012 Acuity Systems, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

@interface NSData (Additions)


#pragma mark - AES Encryption
- (NSData *)AESEncryptWithKey:(NSString *)key;
- (NSData *)AESDecryptWithKey:(NSString *)key;


#pragma mark - Base 64
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (id)initWithBase64EncodedString:(NSString *)string;


#pragma mark - Gzip
- (NSData *)gzipDeflate;
- (NSData *)gzipInflate;

#pragma mark - TBXML
+ (NSData *)dataWithUncompressedContentsOfFile:(NSString *)file;


#pragma mark - Miscellaneous
- (NSString *)hexString;


@end