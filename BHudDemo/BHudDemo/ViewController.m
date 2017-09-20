//
//  ViewController.m
//  BHudDemo
//
//  Created by bai on 2017/9/19.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "BHudView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *hudBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 100, 200, 40)];
    [hudBtn setBackgroundColor:[UIColor greenColor]];
    [hudBtn setTitle:@"hud" forState:0];
    hudBtn.tag = 1;
    [hudBtn addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hudBtn];
    
    UIButton *hudBtn2 = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 200, 200, 40)];
    [hudBtn2 setBackgroundColor:[UIColor greenColor]];
    hudBtn2.tag = 2;
    [hudBtn2 setTitle:@"hud2" forState:0];
    [hudBtn2 addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hudBtn2];
    
    UIButton *hudBtn3 = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 300, 200, 40)];
    [hudBtn3 setBackgroundColor:[UIColor greenColor]];
    [hudBtn3 setTitle:@"hud3" forState:0];
    hudBtn3.tag = 3;
    [hudBtn3 addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hudBtn3];
    
    
}

- (void)show:(UIButton *)sender {
   NSInteger tag =  sender.tag;
    switch (tag) {
        case 1:
        {
        
            [BHudView showHudInView:self.view indicatorViewStyle:BHudJumpBarIndicatorView];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //耗时任务
                
                [NSThread sleepForTimeInterval:8.0];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    //更新UI
                    [BHudView hideHudInView:self.view];
                    
                });
            });

            break;
        }
        case 2:
        {
            [BHudView showIndicatorInView:self.view];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //耗时任务
                
                [NSThread sleepForTimeInterval:3.0];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    //更新UI
                    [BHudView hideHudInView:self.view];
                    
                });
            });

            break;
        }

        case 3:
        {
            [BHudView showHudInView:self.view];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //耗时任务
                
                [NSThread sleepForTimeInterval:3.0];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    //更新UI
                    [BHudView showErrorInView:self.view clickBlock:^{
                        [BHudView hideHudInView:self.view];
                    }];

                    
                    
                });
            });

            break;
        }

        
            
           
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
