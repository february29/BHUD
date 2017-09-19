//
//  LuosHudView.m
//  Lou_s
//
//  Created by bai on 2017/5/26.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BHudView.h"
#import "UIView+BAGlowView.h"

#import "BHudContentView.h"
@interface BHudView(){

}
@end


@implementation BHudView






+(void)showHudInView:(UIView *_Nullable)supperView{
    
    BHudContentView *contentView = [[BHudContentView alloc]initWithFrame:supperView.bounds];
    
    contentView.hudType = BLoadingAndIndicatorHud;
    
    
    
    [supperView addSubview:contentView];
    
}

+(void)showIndicatorInView:(UIView *_Nullable)supperView{
    BHudContentView *contentView = [[BHudContentView alloc]initWithFrame:supperView.bounds];
    
    contentView.hudType = BIndicatorHud;
    
    
    [supperView addSubview:contentView];
    
}

+(void)showErrorInView:(UIView *_Nullable)supperView clickBlock:(LuosFailBtnClickBlock _Nullable )clickBlock{
    
    [self hideHudInView:supperView];
    
    BHudContentView *contentView = [[BHudContentView alloc]initWithFrame:supperView.bounds];
    [contentView setBackgroundColor:[UIColor whiteColor]];
    contentView.hudType = BErrorHud;
    
    contentView.faildBtnBlock = clickBlock;
    
    
    [supperView addSubview:contentView];
    
}

+(void)hideHudInView:(UIView *_Nullable)supperView{
    
    for (UIView *view in [supperView subviews]) {
        if ([view isKindOfClass:[BHudContentView class]]) {
            [view removeFromSuperview];
            
        }
    }
    
}


@end
