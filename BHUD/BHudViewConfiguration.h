//
//  ZLPhotoConfiguration.h
//  BHUD
//
//  Created by edz on 2019/12/20.
//


// 过期
#define BHudDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)


#import <Foundation/Foundation.h>

//加载框类型
typedef  NS_ENUM(NSInteger,BHudContentViewType){
    BLoadingAndIndicatorHud,//加载框+文字
    BIndicatorHud,//加载框
    BErrorHud,//错误
};


//加载框样式
typedef  NS_ENUM(NSInteger,BHudIndicatorViewStyle){
    BHudCircleLoadingIndicatorView,
    BHudJumpBarIndicatorView,
    BHudLaunchBarIndicatorView,
    BHudFchIndicatorView,
    BHudCustomView,
    
};



typedef void(^BContentViewFailBtnClickBlock)(void);


typedef void(^BContentViewFailBtnClickBlock)(void);



@interface BHudViewConfiguration : NSObject

- (instancetype _Nonnull )init NS_UNAVAILABLE;



+ (instancetype _Nonnull )defaultConfiguration;

//-(void)showInView:(UIView *_Nullable)supperView indicatorViewStyle:(BHudIndicatorViewStyle )indicatorViewStyle hudType:(BHudContentViewType)hudType indicatorProportion:(float)indicatorProportion circleHudindicatorViewColor:(UIColor *_Nullable)indicatorViewColor customHudView:(UIView *_Nullable)customHudView failBtnClickBlock:(void(^_Nullable)(void))failBtnClickBlock

/**
 设置indicatorView的样式，
 */
@property (nonatomic,assign) BHudIndicatorViewStyle indicatorViewStyle;


@property (nonatomic,assign) BHudContentViewType hudType;



/**
 indicator 在父视图中距离父视图上边距比例。默认0.5
 */
@property (nonatomic,assign) float indicatorProportion;


/**
 旋转加载框颜色，BHudCircleLoadingIndicatorView有效
 */
@property (nonatomic,strong) UIColor * _Nullable circleIndicatorViewColor;


//自定义的hudView 默认为空
@property (nonatomic,strong) UIView * _Nullable customView;


@end


