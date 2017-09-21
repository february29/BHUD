//
//  BLaunchVarView.m
//  BHudDemo
//
//  Created by bai on 2017/9/19.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BLaunchBarView.h"

#define b_Bar_Count 8
#define b_Bar_Launch_Duration 1.0f
#define b_Bar_Launch_Delay 0.1f

@interface BLaunchBarView(){
    
}

@property (nonatomic, strong) NSMutableDictionary * layers;

// Bezier path
@property (strong, nonatomic) UIBezierPath *bezierPath;


@end


@implementation BLaunchBarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initBezierPath];
        
        [self initBars];
        
    }
    return self;
}



- (void)initBars {
    
    self.layers = [NSMutableDictionary dictionary];
   
    for (int i = 0; i < b_Bar_Count; i++) {
        NSString *shapeLayerName = [NSString stringWithFormat:@"rectangle%d",i+1];
        CAShapeLayer *rectangle = [CAShapeLayer layer];
        rectangle.frame = CGRectMake(25, 25, 1, 1);
        rectangle.path = self.bezierPath.CGPath;
        rectangle.fillColor = [UIColor colorWithRed:0.875 green: 0.227 blue:0.118 alpha:1].CGColor;
        rectangle.lineWidth = 0;
        [self.layer addSublayer:rectangle];
       
        self.layers[shapeLayerName] = rectangle;
    }
    
//    CAShapeLayer * oval = [CAShapeLayer layer];
//    oval.frame = CGRectMake(0, 0, 2, 2);
//    oval.position = CGPointMake(self.center.x, self.center.y);
//    oval.backgroundColor = [UIColor colorWithRed:0.875 green: 0.227 blue:0.118 alpha:1].CGColor;
//    [self.layer addSublayer:oval];
}


-(void)initBezierPath{
    _bezierPath = [UIBezierPath bezierPath];
    [_bezierPath moveToPoint:CGPointMake(0.189, 0.995)];
    [_bezierPath addCurveToPoint:CGPointMake(0.459, 0.993) controlPoint1:CGPointMake(0.26, 0.996) controlPoint2:CGPointMake(0.388, 0.992)];
    [_bezierPath addCurveToPoint:CGPointMake(0.758, 1) controlPoint1:CGPointMake(0.53, 0.994) controlPoint2:CGPointMake(0.687, 0.999)];
    [_bezierPath addLineToPoint:CGPointMake(1, 0.059)];
    [_bezierPath addCurveToPoint:CGPointMake(0.502, 0) controlPoint1:CGPointMake(0.877, 0.022) controlPoint2:CGPointMake(0.635, 0.002)];
    [_bezierPath addCurveToPoint:CGPointMake(0, 0.046) controlPoint1:CGPointMake(0.381, -0.002) controlPoint2:CGPointMake(0.128, 0.028)];
    [_bezierPath closePath];
    [_bezierPath moveToPoint:CGPointMake(0.189, 0.995)];
}


- (CABasicAnimation *) eachPartAnimation:(NSInteger)index
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue      = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-360/b_Bar_Count*index * M_PI/180, 0, 0, -1)];
    animation.toValue        = [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DConcat(CATransform3DMakeScale(10, 10, 10), CATransform3DMakeTranslation(0, -20, 0)), CATransform3DMakeRotation(360/b_Bar_Count*index * M_PI/180, 0, -0, 1))];
    animation.duration       = b_Bar_Launch_Duration;
    animation.beginTime      = CACurrentMediaTime()+b_Bar_Launch_Delay*index;
//    if (index == 0) {
//        animation.beginTime      = CACurrentMediaTime()+b_Bar_Launch_Delay*index;
//    }else{
//        animation.beginTime      = CACurrentMediaTime()+b_Bar_Launch_Delay*index;
//    }
    
    animation.autoreverses   = YES;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    return animation;
}


-(void)setHidden:(BOOL)hidden{
    [super setHidden:hidden];
    if (!hidden) {
        for (int i = 0; i < b_Bar_Count; i++) {
            CABasicAnimation *transformAnimation = [self eachPartAnimation:i];
            NSString *layerNameStr = [NSString stringWithFormat:@"rectangle%d",i+1];
            
            
            
            [self.layers[layerNameStr] addAnimation:transformAnimation forKey:nil];
            
//            [self performSelector:@selector(pauseLayer:) withObject:self.layers[layerNameStr] afterDelay:1];
//            [self performSelector:@selector(resumeLayer:) withObject:self.layers[layerNameStr] afterDelay:b_Bar_Launch_Delay*8];

//            [self performSelector:@selector(resumeLayer:) withObject:self.layers[layerNameStr] afterDelay:(i)*b_Bar_Launch_Duration];
//            if (i == 0) {
//                [self.layers[layerNameStr] addAnimation:transformAnimation forKey:nil];
//                [self performSelector:@selector(pauseLayer:) withObject:self.layers[layerNameStr] afterDelay:1];
//                [self performSelector:@selector(resumeLayer:) withObject:self.layers[layerNameStr] afterDelay:b_Bar_Launch_Duration*8+1];
//            }
//            else
//            {
//                
//                CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
//                animationGroup.animations = @[transformAnimation];
////                animationGroup.duration   = [DurModel initWithTheDuration:transformAnimation];
//                animationGroup.duration =  MAX(transformAnimation.beginTime + transformAnimation.duration * (CGFloat)(transformAnimation.repeatCount == 0 ? b_Bar_Launch_Duration : transformAnimation.repeatCount*b_Bar_Launch_Duration) * (transformAnimation.autoreverses ? 2.0f : 1.0f), animationGroup.duration);
//                [self.layers[layerNameStr] addAnimation:animationGroup forKey:nil];
//                
//                [self performSelector:@selector(pauseLayer:) withObject:self.layers[layerNameStr] afterDelay:1+(i)*b_Bar_Launch_Duration];
//                [self performSelector:@selector(resumeLayer:) withObject:self.layers[layerNameStr] afterDelay:b_Bar_Launch_Duration*8+1+(i)*b_Bar_Launch_Duration];
//            }
            
        }
    }else{
       
        
    }
}

//-(void)addAnimation:(CALayer *)layer
//{
//    [layer addAnimation:_firstAnimation forKey:@"firstAnimation"];
//}
//

////暂停动画
//-(void)pauseLayer:(CALayer*)layer
//{
//    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
//    layer.speed = 0.0;
//    layer.timeOffset = pausedTime;
//}
//
////重新启动动画
//-(void)resumeLayer:(CALayer*)layer
//{
//    
//    CFTimeInterval pausedTime = [layer timeOffset];
//    layer.speed = 1.0;
//    layer.timeOffset = 0.0;
//    layer.beginTime = 0.0;
//    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
//    layer.beginTime = timeSincePause;
//}

@end
