//
//  NSCharacterSet_HTMLExtensions.m
//  CoreText
//
//  Created by Chris Anderson on 1/3/2013.
//  Copyright (c) 2013 toxicsoftware.com. All rights reserved.
//

#import "NSCharacterSet_HTMLExtensions.h"

@implementation NSCharacterSet (HTMLExtensions)

+ (NSCharacterSet *)quoteCharacterSet {
  static NSCharacterSet *_quoteCharacterSet;
  static dispatch_once_t predicate;
  dispatch_once(&predicate, ^{
    _quoteCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"\"'"];
  });
  
  return _quoteCharacterSet;
}

+ (NSCharacterSet *)spaceAndCloseTagCharacterSet {
  static NSCharacterSet *_characterSet;
  static dispatch_once_t predicate;
  dispatch_once(&predicate, ^{
    _characterSet = [NSCharacterSet characterSetWithCharactersInString:@" >"];
  });

  return _characterSet;
}

@end
