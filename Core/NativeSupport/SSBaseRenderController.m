//
//  SSBaseRenderController.m
//  JSONRenderKit
//
//  Created by 陈雄 on 2017/7/3.
//  Copyright © 2017年 com.feelings. All rights reserved.
//


#import "SSBaseRenderController.h"
#import "SSJSContext.h"
#import "UIColor+SSRender.h"
#import "JSONSpider.h"
#import "CXMacros.h"

NSString *const SSViewDidAppearNotification     = @"ViewDidAppearNotification";
NSString *const SSViewDidDisappearNotification  = @"ViewDidDisappearNotification";

SSBaseRenderController *_currentRenderController = nil;

@implementation SSJSONRequest
@end

@interface SSBaseRenderController ()
@property(nonatomic ,strong) NSDictionary *config;
@property(nonatomic ,strong ,readwrite) UIActivityIndicatorView *indicatorView;
@property(nonatomic, strong) UIButton *reloadButton;

@end

@implementation SSBaseRenderController

+(SSBaseRenderController *)currentController
{
    return _currentRenderController;
}

+(void)setCurrentController:(SSBaseRenderController *)controller
{
    _currentRenderController=controller;
}

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title                                = @"详情";
    self.view.backgroundColor                 = [UIColor whiteColor];
    self.jsContext                            = [SSJSContext context];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self startRender];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SSBaseRenderController setCurrentController:self];
    [[NSNotificationCenter defaultCenter] postNotificationName:SSViewDidAppearNotification object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [SSBaseRenderController setCurrentController:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:SSViewDidDisappearNotification object:nil];
    [self.jsContext evaluateScript:@"controller.viewDidUnmount()"];
}


#pragma mark - event
-(void)didPressedRightItem
{
    [self.jsContext evaluateScript:@"controller.rightButtonClick()"];
}

-(void)didReceiveRenderJSON:(NSDictionary *)json{
    UIView *wrapperView  = [self.jsContext renderWithJSON:json];
    [self.view addSubview:wrapperView];
    [self.view addSubview:self.reloadButton];
    [self.view bringSubviewToFront:self.reloadButton];
    [self.view bringSubviewToFront:self.indicatorView];
    self.config  = json[@"controller"];
    [self.jsContext evaluateScript:@"controller.viewDidMount()"];
}

-(void)startRenderWithJSON:(NSDictionary *)json{
    NSAssert([json isKindOfClass:[NSDictionary class]], @"the json is not a dictionary,please check it!");
    [self didReceiveRenderJSON:json];
}

#pragma mark - main actions
-(void)startRender
{
    if (self.jsonRequest == nil) return;
    if (!(self.jsonRequest.url && [self.jsonRequest.url hasPrefix:@"http"])) return;
    [self showIndicator];
    [SSJSContext setCurrentContext:self.jsContext];
    if (self.jsonRequest.type == SSJSONRequestGET) {
        [JSONSpider getWithURLString:self.jsonRequest.url parameters:self.jsonRequest.parameters success:^(id responseObject) {
            [self hideIndicator];
            NSDictionary *json  = responseObject;
            [self didReceiveRenderJSON:json];
        } failure:^(NSError *netError) {
            [self.indicatorView stopAnimating];
            CXDebugLog(@"%@",netError);
        }];
    }
    else {
        [JSONSpider postWithURLString:self.jsonRequest.url parameters:self.jsonRequest.parameters success:^(id responseObject) {
            [self hideIndicator];
            NSDictionary *json  = responseObject;
            [self didReceiveRenderJSON:json];
        } failure:^(NSError *netError) {
            [self.indicatorView stopAnimating];
            CXDebugLog(@"%@",netError);
        }];
    }
}

-(void)showIndicator
{
    [self.view bringSubviewToFront:self.indicatorView];
    [self.indicatorView startAnimating];
}

-(void)hideIndicator
{
    [self.indicatorView stopAnimating];
}

#pragma mark - touch event 
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)reloadJson{
    [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

    [self startRender];
}

#pragma mark - setter
-(void)setConfig:(NSDictionary *)config
{
    _config = config;
    if (_config == nil) return;
    self.title = _config[@"title"]?:@"详情";
    NSString *bgColor = _config[@"backgroundColor"];
    if (bgColor) { self.view.backgroundColor=[UIColor ss_colorWithString:bgColor];}
    
    NSDictionary *rightButton = _config[@"rightButton"];
    if (!rightButton) return;
    
    NSString *rightItemTitle = rightButton[@"title"];
    if (rightItemTitle) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:rightItemTitle
                                                                                  style:(UIBarButtonItemStylePlain)
                                                                                 target:self action:@selector(didPressedRightItem)];
    }
}

#pragma mark - getter 
-(UIActivityIndicatorView *)indicatorView
{
    if (_indicatorView == nil) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.hidesWhenStopped = YES;
        _indicatorView.center=CGPointMake(kScreenWidth/2, (kScreenHeight)/2-64);
        [self.view addSubview:_indicatorView];
    }
    return _indicatorView;
}

- (UIButton *)reloadButton
{
    if (!_reloadButton){
        _reloadButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 80, 10, 40, 40)];
        _reloadButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _reloadButton.layer.cornerRadius = 20;
        [_reloadButton setTitle:@"Reload" forState:UIControlStateNormal];
        [_reloadButton setBackgroundColor:[UIColor ss_colorWithString:@"#2cbb47"]];
        [_reloadButton addTarget:self action:@selector(reloadJson) forControlEvents:UIControlEventTouchDown];
    }
    return _reloadButton;
}

#pragma mark -
-(void)dealloc
{
    [_jsContext releaseObjcs];
    _jsContext = nil;
    [SSJSContext setCurrentContext:nil];
    CXDebugLog(@"SSBaseRenderController dead");
}

@end
