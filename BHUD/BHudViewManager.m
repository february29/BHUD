//
//  BHudViewManager.m
//  BHUD
//
//  Created by edz on 2019/12/20.
//

#import "BHudViewManager.h"

@implementation BHudViewManager

+ (instancetype)sharedInstance{
    static BHudViewManager *sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [BHudViewConfiguration defaultConfiguration];
    }
    return self;
}


-(void)showHudInView:(UIView *_Nullable)supperView{
    
     [self showInView:supperView indicatorViewStyle:self.config.indicatorViewStyle hudType:self.config.hudType indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];

    
}

-(void)showIndicatorInView:(UIView *_Nullable)supperView{
    
     [self showInView:supperView indicatorViewStyle:self.config.indicatorViewStyle hudType:BIndicatorHud indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];
}

-(void)showHudInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
    [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:self.config.hudType indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];
    
}

-(void)showIndicatorInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle{
    
   [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:BIndicatorHud indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];
}



-(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType{
    
    
    [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];
    
}


-(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion{
    
    [self showInView:supperView indicatorViewStyle:indicatorViewStyle hudType:hudType indicatorProportion:indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];
    
}




-(void)showCircleHudInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [self showInView:supperView indicatorViewStyle:self.config.indicatorViewStyle hudType:self.config.hudType indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:indicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];
    
    
}

-(void)showCircleIndicatorInView:(UIView *_Nullable)supperView indicatorViewColor:(UIColor *_Nullable)indicatorViewColor{
    
    [self showInView:supperView indicatorViewStyle:self.config.indicatorViewStyle hudType:self.config.hudType indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:indicatorViewColor customHudView:self.config.customView failBtnClickBlock:nil];
}



-(void)showCustomHudView:(UIView *_Nullable)view InView:(UIView *_Nullable)supperView{
    
    
    
    [self showInView:supperView indicatorViewStyle:BHudCustomView hudType:BIndicatorHud indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:view failBtnClickBlock:nil];
    
    
    
}




-(void)showErrorInView:(UIView *_Nullable)supperView clickBlock:(void(^_Nullable)(void))clickBlock{
    
    [self hideHudInView:supperView];
    
    
    [self showInView:supperView indicatorViewStyle:BHudCustomView hudType:BErrorHud indicatorProportion:self.config.indicatorProportion circleHudindicatorViewColor:self.config.circleIndicatorViewColor customHudView:nil failBtnClickBlock:clickBlock];
    

}

-(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion circleHudindicatorViewColor:(UIColor *_Nullable)indicatorViewColor customHudView:(UIView *_Nullable)customHudView failBtnClickBlock:(void(^_Nullable)(void))failBtnClickBlock{
    
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



-(void)hideHudInView:(UIView *_Nullable)supperView{
    
    for (UIView *view in [supperView subviews]) {
        if ([view isKindOfClass:[BHudContentView class]]) {
            [view removeFromSuperview];
            
        }
    }
    
}






@end
