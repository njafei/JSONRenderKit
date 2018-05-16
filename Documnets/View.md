# View
View是最基本的UI组件。

```
{
    "controller":{
        "title":"View"
    },
    "components":[
        {
            "type":"View",
            "style":{
                "position":"`{{6,6},{${UI.screenW-80},36}}`",
                "backgroundColor":"#FF6666",
            },
        },
        {
            "type":"View",
            "style":{
                "position":"`{{6,50},{${UI.screenW-80},36}}`",
                "backgroundColor":"#009999",
                "borderRadius":20,
            },
        },
        {
            "type":"View",
            "style":{
                "position":"`{{6,100},{${UI.screenW-80},36}}`",
                "backgroundColor":"#FFCCCC",
                "borderWidth": 1,
                "borderColor": "#66CCCC",
            }
        },
        {
            "type":"View",
            "style":{
                "position":"`{{6,150},{${UI.screenW-80},36}}`",
                "backgroundColor":"#FFCCCC",
                "opacity": 0.5,
            }
        },
    ],
}
```

# 截图

![](http://on0hv7n2x.bkt.clouddn.com/JsonRenderKit:Component:View.png)

# 属性

* position `frme`
* borderWidth `number` 边框宽度
* backgroundColor `color` 背景颜色
* borderRadius `number` 边框圆角
* borderColor `color` 边框颜色
* opacity `number` 透明度