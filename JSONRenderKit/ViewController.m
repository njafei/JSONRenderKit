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

@interface ViewController ()
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
    self.tableView.tableFooterView=[UIView new];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSBaseRenderController *obj = [[SSBaseRenderController alloc] init];
    SSJSONRequest *request      = [[SSJSONRequest alloc] init];
    request.type                = SSJSONRequestGET;
    obj.jsonRequest             = request;
    
    switch (indexPath.row) {
        case 0:
            request.url=@"http://127.0.0.1:5000/demo/todo";
            break;
        case 1:
            request.url=@"http://127.0.0.1:5000/demo/app";
            break;
        case 2:
            request.url=@"http://127.0.0.1:5000/demo/translation";
            break;
        case 3:
            request.url=@"http://127.0.0.1:5000/demo/newApi";
            break;
        case 4:
            request.url=@"http://127.0.0.1:5000/demo/askList";
            break;
        case 5:
            request.url=@"http://127.0.0.1:5000/baseComponentTest/Text";
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:obj animated:YES];
}
@end
