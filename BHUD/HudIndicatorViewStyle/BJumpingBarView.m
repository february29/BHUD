//
//  BJumpingView.m
//  BHudDemo
//
//  Created by bai on 2017/9/19.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "BJumpingBarView.h"

#define b_jumbView_Width 50.0f
#define b_jumbView_Height 50.0f


#define b_jumbView_Bar_Width 10.0f
#define b_jumbView_Bar_Height 50.0f

#define bBarColor1 [UIColor colorWithRed: 218/255.0 green: 131/255.0 blue: 57/255.0 alpha: 1]
#define bBarColor2 [UIColor colorWithRed: 0.114 green: 0.41 blue: 1 alpha: 1]
#define bBarColor3 [UIColor colorWithRed: 0.333 green: 0.33 blue: 0.7 alpha: 1]

//#define bBarColor1 [UIColor redColor]
//#define bBarColor2 [UIColor yellowColor]
//#define bBarColor3 [UIColor blueColor]



@interface BJumpingBarView(){
    
}

@property (strong, nonatomic) CALayer *containerLayer;

// Bars
@property (strong, nonatomic) CAShapeLayer *firstBar;
@property (strong, nonatomic) CAShapeLayer *secondBar;
@property (strong, nonatomic) CAShapeLayer *thirdBar;

// Bezier path
@property (strong, nonatomic) UIBezierPath *originalBezierPath;
@property (strong, nonatomic) UIBezierPath *endBezierPath;

// Animation
@property (strong, nonatomic) CABasicAnimation *firstAnimation;
@property (strong, nonatomic) CABasicAnimation *secondAnimation;
@property (strong, nonatomic) CABasicAnimation *thirdAnimation;


@end


@implementation BJumpingBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self initContainerLayer];
        
        [self initBezierPath];
        
        
        
        
        
        [self initBars];
        
        [self initAnimation];

    }
    return self;
}

-(void) initContainerLayer
{
    _containerLayer = [CALayer layer];
    _containerLayer.backgroundColor = [UIColor clearColor].CGColor;
    _containerLayer.frame = CGRectMake(0, 0, b_jumbView_Width, b_jumbView_Height);
    _containerLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    [self.layer addSublayer:_containerLayer];
}
-(void) initBars
{
    
    _firstBar = [CAShapeLayer layer];
    _firstBar.frame = CGRectMake(5, 0, b_jumbView_Bar_Width, b_jumbView_Bar_Width);
    _firstBar.path = _originalBezierPath.CGPath;
    _firstBar.fillColor = bBarColor1.CGColor;
    [_containerLayer addSublayer:_firstBar];
    
    
    _secondBar = [CAShapeLayer layer];
    _secondBar.frame = CGRectMake(20, 0, b_jumbView_Bar_Width, b_jumbView_Bar_Height);
    _secondBar.fillColor = bBarColor2.CGColor;
    _secondBar.path = _originalBezierPath.CGPath;
    [_containerLayer addSublayer:_secondBar];

    
    _thirdBar = [CAShapeLayer layer];
    _thirdBar.frame = CGRectMake(35, 0, b_jumbView_Bar_Width, b_jumbView_Bar_Height);
    _thirdBar.fillColor = bBarColor3.CGColor;
    _thirdBar.path = _originalBezierPath.CGPath;
    [_containerLayer addSublayer:_thirdBar];


    
//    for (NSInteger i = 0; i < 3 ; i++)
//    {
//        CGPoint origin = CGPointMake(b_jumbView_Bar_Width * i, 0);
//        if (i == 0)
//        {
//            _firstBar = [CAShapeLayer layer];
//            _firstBar.frame = CGRectMake(origin.x, origin.y, b_jumbView_Bar_Width, b_jumbView_Bar_Width);
//            _firstBar.path = _originalBezierPath.CGPath;
//            _firstBar.fillColor = bBarColor1.CGColor;
//            
//            
//            [_containerLayer addSublayer:_firstBar];
//        }
//        if (i == 1)
//        {
//            _secondBar = [CAShapeLayer layer];
//            _secondBar.frame = CGRectMake(origin.x, origin.y, b_jumbView_Bar_Width, b_jumbView_Bar_Height);
//            _secondBar.fillColor = bBarColor2.CGColor;
//            _secondBar.path = _originalBezierPath.CGPath;
//            
//            [_containerLayer addSublayer:_secondBar];
//        }
//        if (i == 2)
//        {
//            _thirdBar = [CAShapeLayer layer];
//            _thirdBar.frame = CGRectMake(origin.x, origin.y, b_jumbView_Bar_Width, b_jumbView_Bar_Height);
//            _thirdBar.fillColor = bBarColor3.CGColor;
//            _thirdBar.path = _originalBezierPath.CGPath;
//            
//            [_containerLayer addSublayer:_thirdBar];
//        }
//    }
}
-(void) initBezierPath
{
    // Original Path
    _originalBezierPath = [UIBezierPath bezierPath];
    [_originalBezierPath moveToPoint:CGPointMake(0, b_jumbView_Bar_Height)];
    [_originalBezierPath addLineToPoint:CGPointMake(0, b_jumbView_Bar_Height - 2.0f)];
    [_originalBezierPath addLineToPoint:CGPointMake(b_jumbView_Bar_Width, b_jumbView_Bar_Height - 2.0f)];
    
//    [_originalBezierPath addLineToPoint:CGPointMake(b_jumbView_Bar_Width / 2.0f, b_jumbView_Bar_Height - 2.0f)];
    [_originalBezierPath addLineToPoint:CGPointMake(b_jumbView_Bar_Width, b_jumbView_Bar_Height)];
    [_originalBezierPath addLineToPoint:CGPointMake(0, b_jumbView_Bar_Height)];
    [_originalBezierPath closePath];
    
    // end Path
    _endBezierPath = [UIBezierPath bezierPath];
    [_endBezierPath moveToPoint:CGPointMake(0, b_jumbView_Bar_Height)];
    [_endBezierPath addLineToPoint:CGPointMake(0, b_jumbView_Bar_Height*0.3)];
    [_endBezierPath addLineToPoint:CGPointMake(b_jumbView_Bar_Width , b_jumbView_Bar_Height*0.3)];
//    [_endBezierPath addLineToPoint:CGPointMake(b_jumbView_Bar_Width / 2.0f, 0)];
    [_endBezierPath addLineToPoint:CGPointMake(b_jumbView_Bar_Width, b_jumbView_Bar_Height)];
    [_endBezierPath addLineToPoint:CGPointMake(0, b_jumbView_Bar_Height)];
    [_endBezierPath closePath];
    
}
-(void) initAnimation
{
    // First
    _firstAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _firstAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _firstAnimation.toValue = (id) _endBezierPath.CGPath;
    _firstAnimation.autoreverses = YES;
    _firstAnimation.duration = 0.5f;
    _firstAnimation.repeatCount = MAXFLOAT;
    _firstAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
    
    _secondAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _secondAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _secondAnimation.toValue = (id) _endBezierPath.CGPath;
    _secondAnimation.autoreverses = YES;
    _secondAnimation.duration = 0.5f;
    _secondAnimation.repeatCount = MAXFLOAT;
    _secondAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
    
    _thirdAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _thirdAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _thirdAnimation.toValue = (id) _endBezierPath.CGPath;
    _thirdAnimation.autoreverses = YES;
    _thirdAnimation.duration = 0.5f;
    _thirdAnimation.repeatCount = MAXFLOAT;
    _thirdAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
    
}

-(void)setHidden:(BOOL)hidden{
    [super setHidden:hidden];
    if (!hidden) {
        [self performSelector:@selector(addFirstAniamtion) withObject:nil afterDelay:0];
        [self performSelector:@selector(addSecondAnimation) withObject:nil afterDelay:0.1f];
        [self performSelector:@selector(addThirdAnimation) withObject:nil afterDelay:0.2f];
    }else{
        [_firstBar removeAllAnimations];
        [_secondBar removeAllAnimations];
        [_thirdBar removeAllAnimations];

    }
}

-(void) addFirstAniamtion
{
    [_firstBar addAnimation:_firstAnimation forKey:@"firstAnimation"];
}
-(void) addSecondAnimation
{
    [_secondBar addAnimation:_secondAnimation forKey:@"secondAnimation"];
}
-(void) addThirdAnimation
{
    [_thirdBar addAnimation:_thirdAnimation forKey:@"thirdAnimatin"];
}


@end
