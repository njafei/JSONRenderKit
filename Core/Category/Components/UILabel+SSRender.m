//
//  UILabel+SSRender.m
//  JSONRenderKit
//
//  Created by fei on 2018/5/15.
//  Copyright © 2018年 com.feelings. All rights reserved.
//

#import "UILabel+SSRender.h"
#import "UIView+SSRender.h"
#import "UIColor+SSRender.h"

@implementation UILabel (SSRender)
-(void)js_setStyle:(NSDictionary *)style
{
    [super js_setStyle:style];
    if (style[@"fontSize"])       { self.font                      = [UIFont systemFontOfSize:[style[@"fontSize"] floatValue]];}
    if (style[@"adjustTextFont"]) { self.adjustsFontSizeToFitWidth = [style[@"adjustTextFont"] floatValue];}
    if (style[@"text"])           { self.text                      = style[@"text"];}
    if (style[@"textColor"])      { self.textColor                 = [UIColor ss_colorWithString:style[@"textColor"]];}
    if (style[@"numberOfLines"]) {
        self.numberOfLines = [style[@"numberOfLines"] floatValue];
    }
    
    NSString *align = style[@"textAlign"];
    if (align) {
        NSDictionary *aligns = @{@"left":   @(NSTextAlignmentLeft),
                                 @"right":  @(NSTextAlignmentRight),
                                 @"center": @(NSTextAlignmentCenter)};
        if ([aligns.allKeys containsObject:align]) { self.textAlignment = [aligns[align] integerValue];}
    }
    NSNumber *sizeToFit = style[@"sizeToFit"];
    if (sizeToFit)           {
        if([sizeToFit boolValue]) { [self sizeToFit];}
    }
}
@end
