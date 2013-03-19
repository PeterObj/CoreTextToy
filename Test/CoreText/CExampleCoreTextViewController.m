//
//  CExampleCoreTextViewController.m
//  CoreText
//
//  Created by Jonathan Wight on 10/23/11.
//  Copyright (c) 2011 toxicsoftware.com. All rights reserved.
//

#import "CExampleCoreTextViewController.h"

#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>

#import "CCoreTextLabel.h"
#import "CCoreTextLabel_HTMLExtensions.h"
#import "CMarkupValueTransformer.h"
#import "UIFont_CoreTextExtensions.h"
#import "NSAttributedString_DebugExtensions.h"
#import "NSAttributedString_Extensions.h"

@interface CExampleCoreTextViewController ()
@property (readwrite, nonatomic, strong) IBOutlet CCoreTextLabel *label1;
@property (readwrite, nonatomic, strong) IBOutlet CCoreTextLabel *label2;
@property (readwrite, nonatomic, strong) IBOutlet CCoreTextLabel *label3;
@property (readwrite, nonatomic, strong) IBOutlet CCoreTextLabel *label4;
@property (readwrite, nonatomic, strong) IBOutlet CCoreTextLabel *label5;
@property (readwrite, nonatomic, strong) IBOutlet CCoreTextLabel *label6;
@property (readwrite, nonatomic, strong) IBOutlet CCoreTextLabel *label7;

@property (readwrite, nonatomic, strong) CALayer *sizeLayer;
@end

@implementation CExampleCoreTextViewController

- (void)viewDidLoad
    {
    [super viewDidLoad];
    
    // #########################################################################

    // ### 1st line...

    self.label1.lineBreakMode = UILineBreakModeTailTruncation;
    self.label1.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    self.label1.markup = @"<b>Craig Hockenberry</b> <img src=\"reply-badge.png\" baseline=\"-2\"> <small>to you</small>";

    // #########################################################################

    BTagHandler theHandler = ^(CSimpleHTMLTag *inTag) {
        NSDictionary *theAttributes = @{
			(__bridge NSString *)kCTForegroundColorAttributeName: (__bridge id)[UIColor colorWithRed:0.761 green:0.486 blue:0.165 alpha:1.000].CGColor,
            kMarkupBoldAttributeName: @YES,
			};
        return(theAttributes);
        };

    [self.label2.markupValueTransformer addHandler:theHandler forTag:@"username"];
    
    self.label2.lineBreakMode = UILineBreakModeWordWrap;
    self.label2.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    self.label2.markup = @"<username>@schwa</username> RUBBERS";
    
    // #########################################################################
    
    [self.label3.markupValueTransformer removeHandlerForTag:@"a"];

    self.label3.textColor = [UIColor whiteColor];
    self.label3.lineBreakMode = UILineBreakModeWordWrap;
    self.label3.markup = @"<a href=\"link1\">@LINK1</a> The quick brown fox jumped over the lazy dog 1234567890 <a href=\"link2\">@LINK2</a> times.";

    // #########################################################################

    self.label4.attributedText = [[NSAttributedString alloc] initWithString:@"This is a highlighted CCoreTextLabel with a shadow"];
    self.label4.backgroundColor = [UIColor grayColor];
    self.label4.textColor = [UIColor blackColor];
    self.label4.highlighted = YES;
    self.label4.shadowColor = [[UIColor redColor] colorWithAlphaComponent:0.3333333];

    // #########################################################################

    self.label5.markup = @"<img src=\"puke.gif\"/> This should <font color=\"#0000FF\">GLOW</font>.";
    self.label5.backgroundColor = [UIColor grayColor];
    self.label5.font = [UIFont systemFontOfSize:36];
    self.label5.textColor = [UIColor whiteColor];
    self.label5.shadowColor = [UIColor blueColor];
    self.label5.shadowOffset = CGSizeZero;
    self.label5.shadowBlurRadius = 30.0;    

    // #########################################################################

    NSURL *theURL = [[NSBundle mainBundle] URLForResource:@"Lorem" withExtension:@"txt"];
    NSString *theString = [NSString stringWithContentsOfURL:theURL encoding:NSUTF8StringEncoding error:NULL];
    NSMutableParagraphStyle *theParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    theParagraphStyle.lineSpacing = 4;
    NSMutableAttributedString *theAttributedString = [[NSMutableAttributedString alloc] initWithString:theString attributes:@{ NSParagraphStyleAttributeName: theParagraphStyle }];
    self.label6.attributedText = theAttributedString;
    self.label6.insets = (UIEdgeInsets){ .left = 20, .top = 20, .right = 20, .bottom = 20 };
    self.label6.lineBreakMode = UILineBreakModeWordWrap;
    self.label6.backgroundColor = [UIColor grayColor];
//    self.label6.textAlignment = UITextAlignmentRight;
    self.label6.textColor = [UIColor whiteColor];
    self.label6.font = [UIFont systemFontOfSize:18];

    // #########################################################################

    BTagHandler theCochinHandler = ^(CSimpleHTMLTag *inTag) {
        NSDictionary *theAttributes = @{
			kMarkupFontNameAttributeName: @"Cochin",
            kMarkupItalicAttributeName: @YES
			};
        return(theAttributes);
        };

    [self.label7.markupValueTransformer addHandler:theCochinHandler forTag:@"cochin"];
    
    BTagHandler theChalkdusterHandler = ^(CSimpleHTMLTag *inTag) {
        NSDictionary *theAttributes = @{
			kMarkupFontNameAttributeName: @"Chalkduster"
			};
        return(theAttributes);
        };

    [self.label7.markupValueTransformer addHandler:theChalkdusterHandler forTag:@"chalkduster"];
    
    BTagHandler theZapfinoHandler = ^(CSimpleHTMLTag *inTag) {
        NSDictionary *theAttributes = @{
			kMarkupFontNameAttributeName: @"Zapfino"
			};
        return(theAttributes);
        };

    [self.label7.markupValueTransformer addHandler:theZapfinoHandler forTag:@"zapfino"];
    
    self.label7.backgroundColor = [UIColor grayColor];
    self.label7.lineBreakMode = UILineBreakModeWordWrap;
    self.label7.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    self.label7.markup = @"<cochin>All</cochin> my <chalkduster>fonts</chalkduster> are so <zapfino>pretty</zapfino>";
    

    }

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
    {
    return(YES);
    }

@end
