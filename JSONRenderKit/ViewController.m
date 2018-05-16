//
//  ViewController.m
//  JSONRenderKit
//
//  Created by 陈雄 on 2017/7/3.
//  Copyright © 2017年 com.feelings. All rights reserved.
//


#import "ViewController.h"
#import "SSBaseRenderController.h"
#import "CXMacros.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"JSON示例";
    self.view.backgroundColor                            = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent  = NO;
    self.navigationController.navigationBar.barTintColor = kColor(69, 200, 220);
    self.navigationController.navigationBar.tintColor    = [UIColor whiteColor];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self setUpTableView];
    
    self.dataSource = [NSMutableArray arrayWithArray:@[@{@"url": @"http://127.0.0.1:5000/demo/todo",@"title":@"todo"},
                                                       @{@"url":@"http://127.0.0.1:5000/demo/app",@"title":@"app"},
                                                       @{@"url":@"http://127.0.0.1:5000/demo/translation",@"title":@"translation"},
                                                       @{@"url":@"http://127.0.0.1:5000/demo/newApi",@"title":@"newApi"},
                                                       @{@"url":@"http://127.0.0.1:5000/demo/askList",@"title":@"问大家"},
                                                       @{@"url":@"http://127.0.0.1:5000/baseComponentTest/Text",@"title":@"Text"},
                                                       @{@"url":@"http://127.0.0.1:5000/baseComponentTest/View",@"title":@"View"}]];
}

- (void)setUpTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    CGFloat navHeight = self.navigationController.navigationBar.bounds.size.height;
}

#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.dataSource[indexPath.row] valueForKey:@"title"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSBaseRenderController *obj = [[SSBaseRenderController alloc] init];
    SSJSONRequest *request      = [[SSJSONRequest alloc] init];
    request.type                = SSJSONRequestGET;
    obj.jsonRequest             = request;
    
    if (self.dataSource.count >= indexPath.row){
        request.url = [self.dataSource[indexPath.row] valueForKey:@"url"];
    }
    
    [self.navigationController pushViewController:obj animated:YES];
}
@end
