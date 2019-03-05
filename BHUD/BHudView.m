//
//  LuosHudView.m
//  Lou_s
//
//  Created by bai on 2017/5/26.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BHudView.h"


#import "BHudContentView.h"
@interface BHudView(){

    
}
@end


@implementation BHudView









+(void)showHudInView:(UIView *_Nullable)supperView{
    
     [self showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BLoadingAndIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];

    
}

+(void)showIndicatorInView:(UIView *_Nullable)supperView{
    
     [self showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
}

+(void)showHudInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
    [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:BLoadingAndIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
    
}

+(void)showIndicatorInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
   [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
}



+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType{
    
    
    [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
    
}


+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion{
    
    [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:indicatorProportion circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
    
}




+(void)showCircleHudInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [self showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BLoadingAndIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:indicatorViewColor customHudView:nil failBtnClickBlock:nil];
    
    
}

+(void)showCircleIndicatorInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [self showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:indicatorViewColor customHudView:nil failBtnClickBlock:nil];
}



+(void)showCustomHudView:(UIView *_Nullable)view InView:(UIView *_Nullable)supperView{
    
    
    
    [self showInView:supperView indicatorViewStyle:BHudCustomView hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:view failBtnClickBlock:nil];
    
//    BHudContentView *contentView = [[BHudContentView alloc]initWithFrame:supperView.bounds];
//    contentView.indicatorViewStyle = BHudCustomView;
//    contentView.customView = view;
//    contentView.hudType = BIndicatorHud;
//
//
//    [supperView addSubview:contentView];
    
    
    
}




+(void)showErrorInView:(UIView *_Nullable)supperView clickBlock:(BHUDFailBtnClickBlock _Nullable )clickBlock{
    
    [self hideHudInView:supperView];
    
    
    [self showInView:supperView indicatorViewStyle:BHudCustomView hudType:BErrorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:clickBlock];
    

}

+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion circleHudindicatorViewColor:(UIColor *_Nullable)indicatorViewColor customHudView:(UIView *_Nullable)customHudView failBtnClickBlock:(BHUDFailBtnClickBlock _Nullable )failBtnClickBlock{
    
    BHudContentView *contentView = [[BHudContentView alloc]initWithFrame:supperView.bounds];
    
    //加载框样式
    contentView.indicatorViewStyle = indicatorViewStyle;
    
    //旋转加载框颜色
    if (indicatorViewStyle == BHudCircleLoadingIndicatorView && indicatorViewColor) {
        contentView.circleIndicatorViewColor = indicatorViewColor;
    }
    //自定义加载框
    if (indicatorViewStyle == BHudCustomView && customHudView) {
        contentView.customView =customHudView;
    }
    
    //加载框位置
    contentView.indicatorProportion = indicatorProportion;
    
   
    //加载框类型
    contentView.hudType = hudType;
    
    //错误加载框
    if (hudType == BErrorHud && failBtnClickBlock) {
        //添加一个渐变动画
        contentView.alpha = 0;
        [contentView setBackgroundColor:[UIColor whiteColor]];
        contentView.faildBtnBlock = failBtnClickBlock;
        [supperView addSubview:contentView];
       
        [UIView animateWithDuration:0.25 animations:^{
            contentView.alpha = 1;
        }];
    }else{
        [supperView addSubview:contentView];
    }
    
    
    
    
}



+(void)hideHudInView:(UIView *_Nullable)supperView{
    
    for (UIView *view in [supperView subviews]) {
        if ([view isKindOfClass:[BHudContentView class]]) {
            [view removeFromSuperview];
            
        }
    }
    
}



@end
