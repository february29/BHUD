//
//  LuosContentView.h
//  Lou_s
//
//  Created by bai on 2017/6/29.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger,BHudContentViewType){
    BLoadingAndIndicatorHud,
    BIndicatorHud,
    BErrorHud,
};

typedef void(^BContentViewFailBtnClickBlock)();

@interface BHudContentView : UIView



//加载
@property (nonatomic, strong) UILabel  * _Nullable label;

@property (nonatomic, strong) UIView  * _Nullable indicatorView;

// 失败
@property (nonatomic,strong) UIImageView * _Nullable faildImageView;

@property (nonatomic, strong) UIButton  * _Nullable faildBtn;

@property (nonatomic,copy)  BContentViewFailBtnClickBlock _Nullable faildBtnBlock;



@property (nonatomic,assign) BHudContentViewType hudType;


@end
