# JSONRenderKit

![](http://ou3yprhbt.bkt.clouddn.com/JSONRenderKitBanner.png)

## 项目目标

这个项目希望解决移动开发中的几个问题： 热修复、快速迭代上线、提高开发效率。

热修复问题很好理解，目前iOS中已经禁止了热修复，所以在遇到棘手的bug时只能通过服务端来想办法控制，非常不方便，而且可能会造成经济的损失。

快速迭代上线是很多小的优化和改进，产品经理是希望能够做完就上线的，但是受制于APP发布的整体迭代，还要依赖苹果等商店的审核效率，一般的周期至少在两周以上，虽然相对传统开发模式快了很多，但是还不够快。

提高开发效率则是针对react-native等两端或者三端融合框架相对于native开发的，在我的体会中，普通界面react-native的效率比native高很多，而且一套代码，iOS、android都可以适用，开发速度会快很多。而react-native在应对比较大的页面的情况比较乏力，内存等控制都不是太好，而且只有两端适用，H5还是要独立开发。

通过这个项目，我们希望最终能够做到一套三端融合的框架，在这个框架中，配置一个新页面就像请求一个接口的数据一样简单，上线也非常方便，最重要的是，将开发从繁杂重复的劳动中解放出来，去做更多有价值的事情。

## 快速开始
开始写一个JSON尝试一下吧！[JSON文档](https://github.com/cx478815108/JSONRenderKit/blob/master/Document.md)在这里。

![](http://ou3yprhbt.bkt.clouddn.com/all.png)

------------------------


**Objective-C**

```
#import "SSBaseRenderController.h"
.
{
        ...
        SSBaseRenderController *obj = [[SSBaseRenderController alloc] init];
        obj.url = @"http://xxxxxxxxxx";
        [self.navigationController pushViewController:obj animated:YES];
}
```

## Run

1. 运行`node app.js`
2. 用Xcode打开这个project，并运行即可

## 安装

### 手动安装

[下载这个Demo](https://github.com/cx478815108/JSONRenderKit/archive/master.zip) 

```
pod install
```

