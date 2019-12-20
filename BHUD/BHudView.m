//
//  LuosHudView.m
//  Lou_s
//
//  Created by bai on 2017/5/26.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BHudView.h"
#import "BHudViewManager.h"
#import "BHudContentView.h"

@interface BHudView(){

    
}
@end


@implementation BHudView









+(void)showHudInView:(UIView *_Nullable)supperView{
    
   
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BLoadingAndIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];

    
}

+(void)showIndicatorInView:(UIView *_Nullable)supperView{
    
     [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
}

+(void)showHudInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:BLoadingAndIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
    
}

+(void)showIndicatorInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
   [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
}



+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType{
    
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
    
}


+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion{
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:indicatorProportion circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:nil];
    
}




+(void)showCircleHudInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BLoadingAndIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:indicatorViewColor customHudView:nil failBtnClickBlock:nil];
    
    
}

+(void)showCircleIndicatorInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:BHudCircleLoadingIndicatorView hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:indicatorViewColor customHudView:nil failBtnClickBlock:nil];
}



+(void)showCustomHudView:(UIView *_Nullable)view InView:(UIView *_Nullable)supperView{
    
    
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:BHudCustomView hudType:BIndicatorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:view failBtnClickBlock:nil];
    
//    BHudContentView *contentView = [[BHudContentView alloc]initWithFrame:supperView.bounds];
//    contentView.indicatorViewStyle = BHudCustomView;
//    contentView.customView = view;
//    contentView.hudType = BIndicatorHud;
//
//
//    [supperView addSubview:contentView];
    
    
    
}




+(void)showErrorInView:(UIView *_Nullable)supperView clickBlock:(void(^_Nullable)(void))clickBlock{
    
    [[BHudViewManager sharedInstance] hideHudInView:supperView];
    
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:BHudCustomView hudType:BErrorHud indicatorProportion:0.5 circleHudindicatorViewColor:nil customHudView:nil failBtnClickBlock:clickBlock];
    

}

+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion circleHudindicatorViewColor:(UIColor *_Nullable)indicatorViewColor customHudView:(UIView *_Nullable)customHudView failBtnClickBlock:(void(^_Nullable)(void))failBtnClickBlock{
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:indicatorProportion circleHudindicatorViewColor:indicatorViewColor customHudView:customHudView failBtnClickBlock:failBtnClickBlock];
    

    
}



+(void)hideHudInView:(UIView *_Nullable)supperView{
    
    [[BHudViewManager sharedInstance]hideHudInView:supperView];

    
}



@end
