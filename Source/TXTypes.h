//
//  TXTypes.h
//  Beaker
//
//  Created by Jonathan Wight on 1/24/14.
//  Copyright (c) 2014 Twitter Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE == 1
typedef UIEdgeInsets TXEdgeInsets;
#define TXEdgeInsetsInsetRect UIEdgeInsetsInsetRect
#else
typedef NSEdgeInsets TXEdgeInsets;

#define TXEdgeInsetsInsetRect NSEdgeInsetsInsetRect

@interface NSValue (NSValueCGGeometryExtensions)

+ (NSValue *)valueWithCGPoint:(CGPoint)point;
+ (NSValue *)valueWithCGSize:(CGSize)size;
+ (NSValue *)valueWithCGRect:(CGRect)rect;

- (CGPoint)CGPointValue;
- (CGSize)CGSizeValue;
- (CGRect)CGRectValue;

@end

#endif
