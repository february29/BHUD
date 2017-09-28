//
//  UILabel+BAnimation.m
//  BHudDemo
//
//  Created by bai on 2017/9/25.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "UILabel+BAnimation.h"
#import <CoreText/CoreText.h>
#import <objc/runtime.h>


static char b_layerkey;

@implementation UILabel (BAnimation)

/**
 获取lable文字 path  外轮廓

 @return 字体path
 */
-(UIBezierPath *)textPath{
    
    if (!self.text||[self.text isEqualToString:@""]) {
        return nil;
    }
    CGMutablePathRef letters = CGPathCreateMutable();   //创建path
    
    
    CFStringRef fontName = (__bridge CFStringRef)self.font.fontName;
//    self.font.pointSize
    CTFontRef font = CTFontCreateWithName(fontName, self.font.pointSize, NULL);       //设置字体
    
    
   
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)font, kCTFontAttributeName,
                           nil];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.text attributes:attrs];
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);   //创建line
    CFArrayRef runArray = CTLineGetGlyphRuns(line);     //根据line获得一个数组
    
    // 获得每一个 run
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        // 获得 run 的字体
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        // 获得 run 的每一个形象字
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            // 获得形象字
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            //获得形象字信息
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            // 获得形象字外线的path
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    
    //根据构造出的 path 构造 bezier 对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    
    CGPathRelease(letters);
    CFRelease(font);
    
    return path;
    
}




/**
 创建字体pathCAShapeLayer

 */
-(CAShapeLayer *)textPathLayer{
    CAShapeLayer *pathLayer;// = objc_getAssociatedObject(self, &b_layerkey);
    UIBezierPath *path  = [self textPath];
    pathLayer = [CAShapeLayer layer];
    pathLayer.strokeEnd = 0;
    pathLayer.frame = self.bounds;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    
    pathLayer.strokeColor = self.textColor.CGColor;//[[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 0.5f;
    pathLayer.lineCap = kCALineCapRound;
    pathLayer.lineJoin = kCALineJoinBevel;
       
//        objc_setAssociatedObject(self, &b_layerkey,pathLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return pathLayer;
    
}


-(void)addStrokeEndAnimation{
    
    CAShapeLayer *layer = [self textPathLayer];
    [self.layer addSublayer:layer];
    
    self.textColor = [UIColor clearColor];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.keyTimes = @[@0.0f, @0.6f, @1.0f];
    animation.values =  @[@0.0f, @1.0f, @1.0f];
    animation.duration = 2.0f;
    animation.repeatCount = CGFLOAT_MAX;
    
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}

-(void)addOpacityAnimation{
    
    CALayer *layer = [self glowLayerWithColor:self.textColor glowRadius:0];
    [self.layer addSublayer:layer];
//     self.textColor = [UIColor clearColor];
    // 做动画，从透明到显示出来
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(0.f);
    animation.toValue   = @(0.8f);
    layer.opacity       = 0.8;
    animation.duration = 0.8;
    animation.repeatCount = CGFLOAT_MAX;
    animation.autoreverses = YES;
    [layer addAnimation:animation forKey:@"opacityAnimation"];
}


- (CALayer *)glowLayerWithColor:(UIColor *)color glowRadius:(CGFloat)radius {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIBezierPath* path = \
    [UIBezierPath bezierPathWithRect:(CGRect){CGPointZero, CGSizeMake(self.bounds.size.width, self.bounds.size.height)}];
    [color setFill];
    [path fillWithBlendMode:kCGBlendModeSourceAtop alpha:1.0];
    
    CALayer *glowLayer      = [CALayer layer];
//    glowLayer.name          = GLOWVIEW_LAYER_FLAG;
    glowLayer.frame         = self.bounds;
    glowLayer.contents      = (__bridge id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    glowLayer.shadowOpacity = 1.0f;
    glowLayer.shadowOffset  = CGSizeMake(0, 0);
    glowLayer.shadowColor   = (color == nil ? [UIColor redColor].CGColor : color.CGColor);
    glowLayer.shadowRadius  = (radius > 0 ? radius : 2.f);
    glowLayer.opacity       = 0.f; // 开始时候的透明度为0
//    [self.layer addSublayer:glowLayer];
    
    UIGraphicsEndImageContext();
    return glowLayer;
}


//待完善
-(void)addGradientAnimation{
    CAGradientLayer *layer = [self gradientLayer];
    [self.layer addSublayer:layer];
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.duration = 3.0f;
    animation.toValue = @[@(0.9), @(1.0), @(1.0)];
    animation.removedOnCompletion = NO;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"gradientAnimation"];
//    self.layer.mask = layer;

}


-(CAGradientLayer *)gradientLayer{
    
    CAGradientLayer *graLayer = [CAGradientLayer layer];
    graLayer.frame = self.bounds;
    graLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                        (__bridge id)self.textColor.CGColor,
                        (__bridge id)[UIColor clearColor].CGColor];
    
    graLayer.startPoint = CGPointMake(0, 0);//设置渐变方向起点
    graLayer.endPoint = CGPointMake(1, 0);  //设置渐变方向终点
    graLayer.locations = @[@(0.0), @(0.0), @(0.1)]; //colors中各颜色对应的初始渐变点
    
    return graLayer;
    
}


@end
