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

typedef void(^LuosFailBtnClickBlock)();

@interface BHudView : NSObject



+(void)showHudInView:(UIView *_Nullable)supperView;

+(void)showIndicatorInView:(UIView *_Nullable)supperView;


+(void)showHudInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle;

+(void)showIndicatorInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle;


+(void)showErrorInView:(UIView *_Nullable)supperView clickBlock:(LuosFailBtnClickBlock _Nullable )clickBlock;

+(void)hideHudInView:(UIView *_Nullable)supperView;


+(void)showCustomHudView:(UIView *_Nullable)view InView:(UIView *_Nullable)supperView;


+(void)showCircleHudInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor;

+(void)showCircleIndicatorInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor;

@end
