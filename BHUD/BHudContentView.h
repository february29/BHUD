//
//  LuosContentView.h
//  Lou_s
//
//  Created by bai on 2017/6/29.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

//加载框类型
typedef  NS_ENUM(NSInteger,BHudContentViewType){
    BLoadingAndIndicatorHud,//加载框+文字
    BIndicatorHud,//加载框
    BErrorHud,//错误
};


//加载框样式
typedef  NS_ENUM(NSInteger,BHudIndicatorViewStyle){
    BHudCircleLoadingIndicatorView,
    BHudJumpBarIndicatorView,
    BHudLaunchBarIndicatorView,
    BHudFchIndicatorView,
    BHudCustomView,
    
};



typedef void(^BContentViewFailBtnClickBlock)(void);

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
 indicator 在父视图中距离父视图上边距比例。默认0.5
 */
@property (nonatomic,assign) float indicatorProportion;


/**
 旋转加载框颜色，BHudCircleLoadingIndicatorView有效
 */
@property (nonatomic,strong) UIColor * _Nullable circleIndicatorViewColor;


/**
 自定义样式
 */
@property (nonatomic,strong) UIView * _Nonnull customView;


/**
 加载错误后 重新加载按钮点击回掉
 */
@property (nonatomic,copy)  BContentViewFailBtnClickBlock _Nullable faildBtnBlock;


//- (instancetype _Nonnull )initWithIndicatorViewStyle:(BHudIndicatorViewStyle) indicatorViewStyle;


//======================================私有变量尽量不要修改========================================//

//@property (nonatomic,strong) UIView *smailContentView;
//加载文字lable
@property (nonatomic, strong,readonly) UILabel  * _Nullable label;

@property (nonatomic, strong,readonly) UIView  * _Nullable indicatorView;

// 失败图片
@property (nonatomic,strong,readonly) UIImageView * _Nullable faildImageView;

@property (nonatomic, strong,readonly) UIButton  * _Nullable faildBtn;



@end
