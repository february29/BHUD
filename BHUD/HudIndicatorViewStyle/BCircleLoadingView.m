//
//  BCircleLoadingView.m
//  BHudDemo
//
//  Created by bai on 2017/9/20.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BCircleLoadingView.h"

//#define BDotW 8
//#define BDotCount 100
//#define BHUDForegroundColor [UIColor colorWithRed:60/255.0 green:139/255.0 blue:246/255.0 alpha:0.6]


@interface BCircleLoadingView(){
    
}

@property (nonatomic,strong) CAReplicatorLayer * replicatorLayer ;

@property (nonatomic,strong) CALayer * mylayer;

@property (nonatomic,strong) CABasicAnimation  * basicAnimation;
@end


@implementation BCircleLoadingView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _bHUDForegroundColor = [UIColor colorWithRed:60/255.0 green:139/255.0 blue:246/255.0 alpha:0.6];
        _bDotW = 8;
        _bDotCount = 100;
        float width = _bDotW;
        self.mylayer.backgroundColor = _bHUDForegroundColor.CGColor;
        self.mylayer.frame = CGRectMake(0, 0, width, width);
        self.mylayer.cornerRadius = width / 2;
//        self.mylayer.anchorPoint = CGPointMake(0.5, 0.5);
        self.mylayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
        
        self.replicatorLayer.instanceCount = _bDotCount;
        
        CGFloat angle = 2 * M_PI / _bDotCount;
        self.replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
        self.replicatorLayer.instanceDelay = 0.8 / _bDotCount;
        
        self.basicAnimation.keyPath = @"transform.scale";
        self.basicAnimation.duration = 0.8;
        self.basicAnimation.fromValue = @1;
        self.basicAnimation.toValue = @0.1;
        
        [self.replicatorLayer addSublayer:self.mylayer];
        [self.layer addSublayer:self.replicatorLayer];
        
        
        
    }
    return self;
}

-(void)layoutSubviews{
    
    self.mylayer.frame = CGRectMake(_bDotW, _bDotW, _bDotW, _bDotW);
    self.replicatorLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

-(void)setBHUDForegroundColor:(UIColor *)bHUDForegroundColor{
    _bHUDForegroundColor = bHUDForegroundColor;
     self.mylayer.backgroundColor = _bHUDForegroundColor.CGColor;
}

-(CAReplicatorLayer *)replicatorLayer
{
    if (_replicatorLayer) {
        return _replicatorLayer;
    }
    self.replicatorLayer = [CAReplicatorLayer layer];
    self.replicatorLayer.cornerRadius = 10.0;
    
    return self.replicatorLayer;
}

-(CALayer *)mylayer
{
    if (_mylayer) {
        return _mylayer;
    }
    self.mylayer = [CALayer layer];
    self.mylayer.masksToBounds = YES;
    return self.mylayer;
}

-(CABasicAnimation *)basicAnimation
{
    if (_basicAnimation) {
        return _basicAnimation;
    }
    self.basicAnimation = [CABasicAnimation animation];
    self.basicAnimation.repeatCount = MAXFLOAT;
    self.basicAnimation.removedOnCompletion = NO;
    self.basicAnimation.fillMode = kCAFillModeForwards;
    
    return self.basicAnimation;
}

-(void)setHidden:(BOOL)hidden{
    if (!hidden) {
        [self.mylayer addAnimation:self.basicAnimation forKey:@"DotAn"];
    }else{
        [self.layer removeAllAnimations];
    }
}



@end
