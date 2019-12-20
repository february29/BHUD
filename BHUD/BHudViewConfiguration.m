//
//  ZLPhotoConfiguration.m
//  BHUD
//
//  Created by edz on 2019/12/20.
//

#import "BHudViewConfiguration.h"

@implementation BHudViewConfiguration

+ (instancetype)defaultConfiguration
{

    BHudViewConfiguration *configuration = [BHudViewConfiguration new];
    
    configuration.indicatorViewStyle = BHudCircleLoadingIndicatorView;
   
    configuration.hudType = BLoadingAndIndicatorHud;
    
    configuration.indicatorProportion = 0.5;
    
    configuration.circleIndicatorViewColor =  [UIColor colorWithRed:60/255.0 green:139/255.0 blue:246/255.0 alpha:0.6];
    
    configuration.customView = nil;
  
    return configuration;

}




@end
