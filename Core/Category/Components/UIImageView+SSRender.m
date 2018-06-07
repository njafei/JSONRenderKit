//
//  NSObject+UIImageView_SSRender.m
//  JSONRenderKit
//
//  Created by fei on 2018/6/7.
//  Copyright © 2018年 com.feelings. All rights reserved.
//

#import "UIImageView+SSRender.h"
#import "UIView+SSRender.h"
#import "UIColor+SSRender.h"
#import "UIImageView+WebCache.h"
#import <UIView+WebCache.h>

@implementation UIImageView (SSRender)
-(void)js_setStyle:(NSDictionary *)style
{
    [super js_setStyle:style];
    NSString *mode=style[@"imageMode"];
    if (mode){
        NSDictionary *modes=@{@"strech":       @(0),
                              @"contain":  @(1),
                              @"cover": @(2)};
        if ([modes.allKeys containsObject:mode]) { self.contentMode=[modes[mode] integerValue];}
    }
    self.clipsToBounds = YES;
    NSString *image=style[@"url"];
    if (image){
        [self sd_setImageWithURL:[NSURL URLWithString:image] completed:nil];
        [self sd_setShowActivityIndicatorView:YES];
        [self sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    } else {
        NSString *localImage = style[@"uri"];
        if (localImage){
            [self setImage:[UIImage imageNamed:localImage]];
        }
    }
}
@end
