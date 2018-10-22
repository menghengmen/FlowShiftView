# FlowShiftView
瀑布流标签筛选框

![gif图](https://github.com/menghengmen/FlowShiftView/blob/master/gif5%E6%96%B0%E6%96%87%E4%BB%B6.gif)  

##使用
SideView的协议方法
```
@protocol SideViewDatasource <NSObject>

@required
-(NSInteger)numberOfSection:(SideView*)sideView ;///有几个区
-(NSInteger)sideView:(SideView*)sideView numberOfRowInSection:(NSInteger)section;//
-(NSString*)sideView:(SideView*)sideView titleForSection:(NSInteger)section;///区头标题
@optional
-(NSString*)sideView:(SideView*)sideView titleForRow:(NSIndexPath*)indexPath;

@end
```
在VC里面遵循SideViewDatasource，而协议里边的方法都是用`@required`修饰的，所以必须要实现它
