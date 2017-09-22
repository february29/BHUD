//
//  BFchView.m
//  BHudDemo
//
//  Created by bai on 2017/9/21.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BFchView.h"

@interface BFchView(){
    
}
@property (nonatomic,strong) CAShapeLayer * fchLayer;

@property (strong, nonatomic) CAKeyframeAnimation *loadingKeyframeAnimation;
@end



@implementation BFchView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        [self setBackgroundColor:[UIColor greenColor]];
        [self initLayer];
        [self initAnimation];
        
        
    }
    return self;
}

- (void)initLayer {
    
    
    _fchLayer = [CAShapeLayer layer];
    _fchLayer.frame = self.bounds;
    _fchLayer.path = [self fchShapeBezierPath].CGPath;
    _fchLayer.strokeEnd = 0;
    _fchLayer.strokeColor = [UIColor colorWithRed: 0.67 green: 0.037 blue: 0.037 alpha: 1].CGColor;
    _fchLayer.fillColor = [UIColor clearColor].CGColor;
    _fchLayer.lineWidth = 2.5f;
    _fchLayer.lineCap = kCALineCapRound;
    _fchLayer.lineJoin = kCALineJoinRound;
    
    [self.layer addSublayer:_fchLayer];

}


-(void) initAnimation
{
    // Loading
    _loadingKeyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    _loadingKeyframeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    _loadingKeyframeAnimation.keyTimes = @[@0.0f, @0.6f, @1.0f];
    _loadingKeyframeAnimation.values =  @[@0.0f, @1.0f, @1.0f];
    _loadingKeyframeAnimation.duration = 2.0f;
    _loadingKeyframeAnimation.repeatCount = CGFLOAT_MAX;
    
    
   }


-(UIBezierPath *)fchShapeBezierPath {
    

    
   
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(20.2, 11.5)];
    [bezierPath addLineToPoint: CGPointMake(14.2, 7)];
    [bezierPath addLineToPoint: CGPointMake(13, 43)];
    [bezierPath addLineToPoint: CGPointMake(5, 32.5)];
    [bezierPath addLineToPoint: CGPointMake(29.8, 23.88)];
    [bezierPath addLineToPoint: CGPointMake(23.8, 29.5)];
    [bezierPath addLineToPoint: CGPointMake(20.6, 35.12)];
    [bezierPath addLineToPoint: CGPointMake(23.8, 40)];
    [bezierPath addLineToPoint: CGPointMake(31.8, 41.88)];
    [bezierPath addLineToPoint: CGPointMake(35.8, 8.12)];
    [bezierPath addLineToPoint: CGPointMake(34.6, 24.25)];
    [bezierPath addLineToPoint: CGPointMake(43, 24.25)];
    [bezierPath addLineToPoint: CGPointMake(45, 41.88)];
    bezierPath.miterLimit = 0;

    bezierPath.lineWidth = 1;

    return bezierPath;

}


-(void)setHidden:(BOOL)hidden{
    [super setHidden:hidden];
    if (!hidden) {
        [_fchLayer addAnimation:_loadingKeyframeAnimation forKey:@"stoke"];
    }else{
        [_fchLayer removeAllAnimations];
    }
}




@end
