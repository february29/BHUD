# BHUD
加载框显示工具

## 集成说明
### pod
```
pod 敬请期待
```

### 手动集成
拖入BHUD文件夹

## 基本说明
引入头文件
```

```
### 显示indicatorInView和lable
```
[BHudView showHudInView:self.view];
```
### 显示indicatorInView
```
[BHudView showIndicatorInView:self.view];
```
### 显示错误
```
 [BHudView showErrorInView:self.view clickBlock:^{
                        [BHudView hideHudInView:self.view];
                    }];

```

## 高级用法
```
//改变indicatorInView 样式 提供几个简单样式
[BHudView showHudInView:self.view indicatorViewStyle:BHudFchIndicatorView];

```

