//
//  LuosContentView.m
//  Lou_s
//
//  Created by bai on 2017/6/29.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BHudContentView.h"

#import "UIView+BAGlowView.h"
#import "BJumpingBarView.h"
#import "BLaunchBarView.h"


@interface BHudContentView(){
    
}
@end


@implementation BHudContentView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpView];
        
    }
    return self;
}

-(void)setUpView{
    
    
    
    self.hudType = BLoadingAndIndicatorHud;
    
}

-(void)layoutSubviews{
    
    
    self.indicatorView.frame = CGRectMake(self.frame.size.width*0.5-25, self.frame.size.height*0.5-50, 50, 50);
    self.label.frame = CGRectMake(0, self.frame.size.height*0.5,self.frame.size.width, 30);
    
    
    self.faildImageView.frame  = CGRectMake(self.frame.size.width*0.5-25, self.frame.size.height*0.5-60, 50, 50);
    self.faildBtn.frame = CGRectMake((self.frame.size.width-100)/2, self.frame.size.height*0.5,100, 25);
    
    
}



-(void)setHudType:(BHudContentViewType)hudType{
    _hudType = hudType;
    if (hudType == BLoadingAndIndicatorHud) {
        self.indicatorView.hidden = NO;
       
        self.label.hidden = NO;
        
        self.faildBtn.hidden = YES;
        self.faildImageView.hidden = YES;
        

    }else if (hudType == BIndicatorHud){
        self.indicatorView.hidden = NO;
        
        self.label.hidden = YES;
        
        self.faildBtn.hidden = YES;
        self.faildImageView.hidden = YES;

    }else if (hudType == BErrorHud){
        self.indicatorView.hidden = YES;
        
        self.label.hidden = YES;
        
        self.faildBtn.hidden = NO;
        self.faildImageView.hidden = NO;

    }
}


-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, 30)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"loading";
        _label.GCDTimerInterval = @(0.8f);
        _label.glowDuration     = @(0.7f);
        _label.glowLayerOpacity = @(1.f);
        [_label createGlowLayerWithColor:[UIColor blackColor]
                              glowRadius:2.f];
        [_label startGlow];
        [self addSubview:_label];
    }
    return _label;
}

-(UIView *)indicatorView{
    if (!_indicatorView) {
        
        _indicatorView = [BJumpingBarView new];
        _indicatorView.center = self.center;
                
        
        
        [self addSubview:_indicatorView];
        
    }
    return _indicatorView;
}

-(UIImageView *)faildImageView{
    if (!_faildImageView) {
        _faildImageView = [UIImageView new];
        _faildImageView.image = [UIImage imageNamed:@"img_network_error"];
        [self addSubview:_faildImageView];
    }
    return _faildImageView;
}

-(UIButton *)faildBtn{
    if (!_faildBtn) {
        _faildBtn = [UIButton new];
        [_faildBtn setTitle:@"重新加载" forState:0];
        _faildBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_faildBtn setTitleColor:[UIColor grayColor] forState:0];
        _faildBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _faildBtn.layer.cornerRadius = 5;
        _faildBtn.layer.borderWidth = 1;
        [_faildBtn addTarget:self action:@selector(faildBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_faildBtn];
        
        
    }
    return _faildBtn;
}
-(void)faildBtnClick:(id )sender{
    
    //    [self show];
//    [self hide];
//    
    if (self.faildBtnBlock) {
        self.faildBtnBlock();
    }
    
    [self removeFromSuperview];
    
    //    [UIView animateWithDuration:LuosAnimationTime*2 animations:^{
    //
    //    }];
    
    
}






@end
