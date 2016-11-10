# WZBGradualTableView
一个透明度渐变的TableView

很多app用到了这种效果，比如歌词显示、直播间聊天记录等。
效果如下：

 ![image](https://github.com/WZBbiao/WZBGradualTableView/blob/master/1.png?raw=true)
 ![image](https://github.com/WZBbiao/WZBGradualTableView/blob/master/2.png?raw=true)
 
 使用方法：
 
``` 
/*
 * frame：tableView的frame
 * direction：透明渐进的方向
 * gradualValue：透明范围值，如果只有一个方向，此值传一个NSNumber、NSString即可，值的范围0—1。如果是两个方向，则需要传一个数组，数组里边传两个NSNumber或者NSString
 ***/
+ (instancetype)gradualTableViewWithFrame:(CGRect)frame direction:(WZBTableViewGradualDirection)direction gradualValue:(id)gradualValue;
```
>参数值说明一下，direction代表方向，是一个位移枚举，如果想让tableView顶部渐变，则此值为WZBTableViewGradualDirectionTop，如果为底部渐变，则此值为WZBTableViewGradualDirectionBottom，如果上下都要渐变，则需要WZBTableViewGradualDirectionTop | WZBTableViewGradualDirectionBottom。gradualValue代表渐变范围值，值的范围为0-1，如果想让顶部20%渐变，此值为@(0.2)。如果想顶部底部都有20%渐变，此值为@[@(0.2), @(0.2)]。

如下：

```
WZBGradualTableView *tableView = [WZBGradualTableView gradualTableViewWithFrame:self.view.bounds direction:(WZBTableViewGradualDirectionTop | WZBTableViewGradualDirectionBottom)  gradualValue:@[@(.3), @0.3]];
```
则显示效果为：

 ![image](https://github.com/WZBbiao/WZBGradualTableView/blob/master/4.gif?raw=true)
 
 如果这样写
 
 ```
 [WZBGradualTableView gradualTableViewWithFrame:CGRectMake(0, self.view.frame.size.height - 180, self.view.frame.size.width, 140) direction:WZBTableViewGradualDirectionTop  gradualValue:@.3f]
 ```
 效果如下：
 
  ![image](https://github.com/WZBbiao/WZBGradualTableView/blob/master/3.gif?raw=true)
  
 怎么样，您学会怎么用了吗？

 您还可以加入我们的群，大家庭期待您的加入！
 
 ![image](https://raw.githubusercontent.com/WZBbiao/WZBSwitch/master/IMG_1850.JPG)
