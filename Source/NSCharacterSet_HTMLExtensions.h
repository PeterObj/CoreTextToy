//
//  NSCharacterSet_HTMLExtensions.h
//  CoreText
//
//  Created by Chris Anderson on 1/3/2013.
//  Copyright (c) 2013 toxicsoftware.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCharacterSet (HTMLExtensions)

+ (NSCharacterSet *)quoteCharacterSet;
+ (NSCharacterSet *)spaceAndCloseTagCharacterSet;

@end
