//
//  NSAttributedString_Extensions.h
//  CoreText
//
//  Created by Jonathan Wight on 1/18/12.
//  Copyright (c) 2012 toxicsoftware.com. All rights reserved.
//

#if TARGET_OS_IPHONE == 1
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

extern NSString *const kMarkupLinkAttributeName;
extern NSString *const kMarkupBoldAttributeName;
extern NSString *const kMarkupItalicAttributeName;
extern NSString *const kMarkupSizeAdjustmentAttributeName;
extern NSString *const kMarkupFontNameAttributeName;
extern NSString *const kShadowColorAttributeName;
extern NSString *const kShadowOffsetAttributeName;
extern NSString *const kShadowBlurRadiusAttributeName;
extern NSString *const kMarkupAttachmentAttributeName;
extern NSString *const kMarkupBackgroundColorAttributeName;
extern NSString *const kMarkupStrikeColorAttributeName;
extern NSString *const kMarkupOutlineAttributeName;

@interface NSAttributedString (NSAttributedString_Extensions)

+ (NSAttributedString *)normalizedAttributedStringForAttributedString:(NSAttributedString *)inAttributedString baseFont:(id)inBaseFont;
+ (NSDictionary *)normalizeAttributes:(NSDictionary *)inAttributes baseFont:(id)inBaseFont;

@end
