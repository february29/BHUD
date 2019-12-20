//
//  LuosHudView.m
//  Lou_s
//
//  Created by bai on 2017/5/26.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BHudView.h"


@interface BHudView(){

    
}
@end


@implementation BHudView









+(void)showHudInView:(UIView *_Nullable)supperView{
    
   
    [[BHudViewManager sharedInstance] showHudInView:supperView];
    
    

    
}

+(void)showIndicatorInView:(UIView *_Nullable)supperView{
    
     [[BHudViewManager sharedInstance]showIndicatorInView:supperView];
}

+(void)showHudInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
    [[BHudViewManager sharedInstance] showHudInView:supperView indicatorViewStyle:indicatorViewStyle];
    
}

+(void)showIndicatorInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
   [[BHudViewManager sharedInstance] showIndicatorInView:supperView indicatorViewStyle:indicatorViewStyle];
}




+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion{
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:indicatorProportion];
    
}




+(void)showCircleHudInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [[BHudViewManager sharedInstance] showCircleHudInView:supperView indicatorViewColor:indicatorViewColor];
    
    
}

+(void)showCircleIndicatorInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [[BHudViewManager sharedInstance] showCircleIndicatorInView:supperView indicatorViewColor:indicatorViewColor];
}



+(void)showCustomHudView:(UIView *_Nullable)view InView:(UIView *_Nullable)supperView{
    
    
    
    [[BHudViewManager sharedInstance] showCustomHudView:view InView:supperView];

    
    
    
}




+(void)showErrorInView:(UIView *_Nullable)supperView clickBlock:(void(^_Nullable)(void))clickBlock{
    
    [[BHudViewManager sharedInstance] hideHudInView:supperView];
    
    
    [[BHudViewManager sharedInstance] showErrorInView:supperView clickBlock:clickBlock];
    

}

+(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion circleHudindicatorViewColor:(UIColor *_Nullable)indicatorViewColor customHudView:(UIView *_Nullable)customHudView failBtnClickBlock:(void(^_Nullable)(void))failBtnClickBlock{
    
    [[BHudViewManager sharedInstance] showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:indicatorProportion circleHudindicatorViewColor:indicatorViewColor customHudView:customHudView failBtnClickBlock:failBtnClickBlock];
    

    
}



+(void)hideHudInView:(UIView *_Nullable)supperView{
    
    [[BHudViewManager sharedInstance]hideHudInView:supperView];

    
}



@end
