# Text

Text是用来展示文本的组件。

```
{
    "controller":{
        "title":"Text"
    },
    "components":[
        {
            "id":"text",
            "type":"Text",
            "style":{
                "position":"`{{6,6},{${UI.screenW-80},36}}`",
                "text":"文本1"
            }
        },
        {
            "type":"Text",
            "style":{
                "position":"`{{6,50},{${UI.screenW-80},36}}`",
                "textColor":"rgb(80,80,80)",
                "backgroundColor":"rgb(240,240,240)",
                "cornerRadius":4,
                "text":"修改背景颜色"
            }
        },
        {
            "type":"Text",
            "style":{
                "position":"`{{6,50},{${UI.screenW-80},36}}`",
                "textColor":"#CC3333",
                "backgroundColor":"#FFCCCC",
                "cornerRadius":4,
                "text":"修改字体大小和颜色",
                "fontSize": 15,
            }
        },
        {
            "type":"Text",
            "style":{
                "position":"`{{6,90},{${UI.screenW-80},80}}`",
                "text":"这里可以修改行数，默认是1行，如果给0的话，会自动换行至最大的行数.",
                "numberOfLines": 2,
            }
        },
        {
            "type":"Text",
            "style":{
                "position":"`{{6,160},{${UI.screenW-80},80}}`",
                "text":"文字在中间展示",
                "textAlign": "center",
                "backgroundColor":"#CCCCCC",
            }
        }
    ],
}

```

## 截图

![](http://on0hv7n2x.bkt.clouddn.com/JsonRenderKit:Component:Text.png)

## 属性： 

* text `string` 文字内容
* textColor `color` 文本颜色
* backgroundColor `color` 背景颜色
* fontSize `number` 字体大小
* numberOfLines `number` 行数 为0则为不限
* textAlign `string enum(left, right, center)` 对齐方式
