//
//  LuosContentView.m
//  Lou_s
//
//  Created by bai on 2017/6/29.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#define BHUDBundle [NSBundle bundleForClass:[self class]]
#define BHUDImagesSrc [BHUDBundle.resourcePath stringByAppendingString:@"/BHUDImagesBundle.bundle"]
#define BHUDImagesBundle [NSBundle bundleWithPath:BHUDImagesSrc]

#import "BHudContentView.h"
#import "BJumpingBarView.h"
#import "BLaunchBarView.h"
#import "BCircleLoadingView.h"
#import "BFchView.h"
#import "UILabel+BAnimation.h"


@interface BHudContentView(){
    
}
@end


@implementation BHudContentView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         _indicatorProportion = 0.5;
//        [self setIndicatorViewStyle:BHudCircleLoadingIndicatorView];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, 30)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"loading";
//        [_label addStrokeEndAnimation];
//        [_label addOpacityAnimation];
        [_label addOpacityAnimation];
        [self addSubview:_label];
        
        
        
        _faildImageView = [UIImageView new];
        
        if (@available(iOS 8.0, *)) {
            _faildImageView.image = [UIImage imageNamed:@"img_network_error" inBundle:BHUDImagesBundle compatibleWithTraitCollection:nil];
        } else {
            // Fallback on earlier versions
            _faildImageView.image = [UIImage imageWithContentsOfFile:[BHUDImagesBundle pathForResource:@"img_network_error" ofType:@"png"]];
        }
        [self addSubview:_faildImageView];
        
        
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
    return self;
}



-(void)layoutSubviews{
    
    
    self.indicatorView.frame = CGRectMake(self.frame.size.width*0.5-25, self.frame.size.height*_indicatorProportion-50, 50, 50);
    self.label.frame = CGRectMake(0, self.frame.size.height*_indicatorProportion,self.frame.size.width, 30);
    
    
    self.faildImageView.frame  = CGRectMake(self.frame.size.width*0.5-25, self.frame.size.height*_indicatorProportion-60, 50, 50);
    self.faildBtn.frame = CGRectMake((self.frame.size.width-100)/2, self.frame.size.height*_indicatorProportion,100, 25);
    
    
}

-(void)setCircleIndicatorViewColor:(UIColor *)circleIndicatorViewColor{
    _circleIndicatorViewColor = circleIndicatorViewColor;
    [self setIndicatorViewStyle:_indicatorViewStyle];
}

-(void)setIndicatorViewStyle:(BHudIndicatorViewStyle)indicatorViewStyle{
    
    
    _indicatorViewStyle = indicatorViewStyle;
    if (_indicatorView) {
        [_indicatorView removeFromSuperview];
    }
    switch (indicatorViewStyle) {
            case BHudCustomView:
        {
            return;
        }
            
            case BHudCircleLoadingIndicatorView:
        {
            _indicatorView = [BCircleLoadingView new];
            if (_circleIndicatorViewColor) {
                ((BCircleLoadingView *)_indicatorView).bHUDForegroundColor = _circleIndicatorViewColor;
            }
            [self addSubview:_indicatorView];
            break;
        }
            case BHudJumpBarIndicatorView:
        {
            _indicatorView = [BJumpingBarView new];
            [self addSubview:_indicatorView];
            break;
        }
            
            case BHudLaunchBarIndicatorView:
        {
            _indicatorView = [BLaunchBarView new];
            [self addSubview:_indicatorView];
            break;
        }
            case BHudFchIndicatorView:
        {
            _indicatorView = [BFchView new];
            [self addSubview:_indicatorView];
            break;
        }
            
        default:
        {
            
            _indicatorView = [BCircleLoadingView new];
            if (_circleIndicatorViewColor) {
                ((BCircleLoadingView *)_indicatorView).bHUDForegroundColor = _circleIndicatorViewColor;
            }
            [self addSubview:_indicatorView];
            break;
        }
            
            
    }
    
    
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

-(void)setCustomView:(UIView *)customView{
    _customView = customView;
    if (customView) {
        
        customView.center = self.center;
        [self addSubview:customView];
    }
   
}


-(void)faildBtnClick:(id )sender{
    
 
    if (self.faildBtnBlock) {
        self.faildBtnBlock();
    }
    
    [self removeFromSuperview];
    
    
    
}






@end
