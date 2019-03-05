//
//  LuosHudView.h
//  Lou_s
//
//  Created by bai on 2017/5/26.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHudContentView.h"

#define LuosAnimationTime 0.25f

typedef void(^BHUDFailBtnClickBlock)(void);

@interface BHudView : NSObject



/**
 显示一个旋转的加载框 底部有正在加载文字

 @param supperView 所在view
 */
+(void)showHudInView:(UIView *_Nullable)supperView;

/**
 显示一个旋转的加载框

 @param supperView 所在view
 */
+(void)showIndicatorInView:(UIView *_Nullable)supperView;


/**
 显示一个加载框 底部有正在加载文字

 @param supperView 所在view
 @param indicatorViewStyle 加载框样式
 */
+(void)showHudInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle;

/**
 显示一个加载框

 @param supperView 所在view
 @param indicatorViewStyle 加载框样式
 */
+(void)showIndicatorInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle;

/**
 显示一个加载框

 @param supperView 所在view
 @param indicatorViewStyle 加载框样式
 @param hudType 加载框类型
 @param indicatorProportion 中心所在supperView的位置
 */
+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion;


/**
 显示一个旋转的加载框 底部有正在加载文字

 @param supperView 所在view
 @param indicatorViewColor 加载框颜色
 */
+(void)showCircleHudInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor;


/**
 显示一个旋转的加载框

 @param supperView 所在view
 @param indicatorViewColor 加载框颜色
 */
+(void)showCircleIndicatorInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor;


/**
 显示自定义的view

 @param view 显示的view
 @param supperView 所在view
 */
+(void)showCustomHudView:(UIView *_Nullable)view InView:(UIView *_Nullable)supperView;


/**
 显示错误

 @param supperView 所在view
 @param clickBlock 点击重新加载回调
 */
+(void)showErrorInView:(UIView *_Nullable)supperView clickBlock:(BHUDFailBtnClickBlock _Nullable )clickBlock;


/**
 显示加载框

 @param supperView 所在view
 @param indicatorViewStyle 加载框样式
 @param hudType 加载框类型
 @param indicatorProportion 中心所在supperView的位置
 @param indicatorViewColor 加载框颜色 BHudCircleLoadingIndicatorView时有效
 @param customHudView 自定义加载框 BHudCustomView时有效
 @param failBtnClickBlock 重新加载回掉 BErrorHud时有效
 */
+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion circleHudindicatorViewColor:(UIColor *_Nullable)indicatorViewColor customHudView:(UIView *_Nullable)customHudView failBtnClickBlock:(BHUDFailBtnClickBlock _Nullable )failBtnClickBlock;

/**
 隐藏所在view中所有hud

 @param supperView 所在view
 */
+(void)hideHudInView:(UIView *_Nullable)supperView;







@end
