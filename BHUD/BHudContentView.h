//
//  LuosContentView.h
//  Lou_s
//
//  Created by bai on 2017/6/29.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger,BHudContentViewType){
    BLoadingAndIndicatorHud,
    BIndicatorHud,
    BErrorHud,
};

typedef  NS_ENUM(NSInteger,BHudIndicatorViewStyle){
    BHudCircleLoadingIndicatorView,
    BHudJumpBarIndicatorView,
    BHudLaunchBarIndicatorView,
    BHudFchIndicatorView,
    BHudCustomView,
    
};



typedef void(^BContentViewFailBtnClickBlock)();

@interface BHudContentView : UIView






/**
 hud类型 ：
 BLoadingAndIndicatorHud： 显示底部label和indicator 由hudview不同函数调用决定用户不要修改
 BIndicatorHud： 只显示indicator 自定义模式也使用该type
 BErrorHud：显示网络错误 和重新加载按钮
 */
@property (nonatomic,assign) BHudContentViewType hudType;


/**
 设置indicatorView的样式，
 */
@property (nonatomic,assign) BHudIndicatorViewStyle indicatorViewStyle;


/**
 设置circleIndicatorViewColor的样式，
 */
@property (nonatomic,strong) UIColor * _Nullable circleIndicatorViewColor;


/**
 自定义样式
 */
@property (nonatomic,strong) UIView * _Nonnull customView;


//- (instancetype _Nonnull )initWithIndicatorViewStyle:(BHudIndicatorViewStyle) indicatorViewStyle;


//======================================私有变量尽量不要修改========================================//

@property (nonatomic,strong) UIView *smailContentView;
//加载
@property (nonatomic, strong,readonly) UILabel  * _Nullable label;

@property (nonatomic, strong,readonly) UIView  * _Nullable indicatorView;

// 失败
@property (nonatomic,strong,readonly) UIImageView * _Nullable faildImageView;

@property (nonatomic, strong,readonly) UIButton  * _Nullable faildBtn;

@property (nonatomic,copy)  BContentViewFailBtnClickBlock _Nullable faildBtnBlock;

@end
