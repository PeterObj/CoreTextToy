//
//  TXTypes.h
//  Beaker
//
//  Created by Jonathan Wight on 1/24/14.
//  Copyright (c) 2014 Twitter Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

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
