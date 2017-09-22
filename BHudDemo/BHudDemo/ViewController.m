//
//  ViewController.m
//  BHudDemo
//
//  Created by bai on 2017/9/19.
//  Copyright © 2017年 北京仙指信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "BHudView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@"cirlcle",@"jumbingbar",@"luunchbar",@"fch",@"failth",@"custom"];
    
    
    
}
#pragma mark UITableViewDataSource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //cell配置
    cell.textLabel.text = _dataArray[indexPath.row];
    
    
    return cell;
}


#pragma mark UITableViewDelegate delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [BHudView showHudInView:self.view ];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //耗时任务

            [NSThread sleepForTimeInterval:5.0];

            dispatch_async(dispatch_get_main_queue(), ^{
                //更新UI
                [BHudView hideHudInView:self.view];
                
            });
        });

    }else if(indexPath.row == 1){
        [BHudView showHudInView:self.view indicatorViewStyle:BHudJumpBarIndicatorView];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //耗时任务
            
            [NSThread sleepForTimeInterval:5.0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //更新UI
                [BHudView hideHudInView:self.view];
                
            });
        });

        
    }else if(indexPath.row == 2){

        [BHudView showIndicatorInView:self.view indicatorViewStyle:BHudLaunchBarIndicatorView];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //耗时任务
            
            [NSThread sleepForTimeInterval:5.0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //更新UI
                [BHudView hideHudInView:self.view];
                
            });
        });

        
    }else if(indexPath.row == 3){
        [BHudView showIndicatorInView:self.view indicatorViewStyle:BHudFchIndicatorView];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //耗时任务
            
            [NSThread sleepForTimeInterval:5.0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //更新UI
                [BHudView hideHudInView:self.view];
                
            });
        });

        
    }else if(indexPath.row == 4){
        [BHudView showHudInView:self.view indicatorViewStyle:BHudFchIndicatorView];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //耗时任务

            [NSThread sleepForTimeInterval:5.0];

            dispatch_async(dispatch_get_main_queue(), ^{
                //更新UI
                [BHudView showErrorInView:self.view clickBlock:^{
                    [BHudView hideHudInView:self.view];
                }];

                
                
            });
        });

        
    }else if(indexPath.row == 5){
        
        UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
        [customView setBackgroundColor: [UIColor greenColor]];
        [BHudView showCustomHudView:customView InView:self.view];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //耗时任务
            
            [NSThread sleepForTimeInterval:5.0];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //更新UI
                [BHudView hideHudInView:self.view];
                
            });
        });

        
    }




}



//- (void)show:(UIButton *)sender {
//   NSInteger tag =  sender.tag;
//    switch (tag) {
//        case 1:
//        {
//        
//            [BHudView showHudInView:self.view indicatorViewStyle:BHudJumpBarIndicatorView];
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                //耗时任务
//                
//                [NSThread sleepForTimeInterval:8.0];
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    //更新UI
//                    [BHudView hideHudInView:self.view];
//                    
//                });
//            });
//
//            break;
//        }
//        case 2:
//        {
//            [BHudView showIndicatorInView:self.view];
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                //耗时任务
//                
//                [NSThread sleepForTimeInterval:3.0];
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    //更新UI
//                    [BHudView hideHudInView:self.view];
//                    
//                });
//            });
//
//            break;
//        }
//
//        case 3:
//        {
//            [BHudView showHudInView:self.view indicatorViewStyle:BHudFchIndicatorView];
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                //耗时任务
//                
//                [NSThread sleepForTimeInterval:3.0];
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    //更新UI
//                    [BHudView showErrorInView:self.view clickBlock:^{
//                        [BHudView hideHudInView:self.view];
//                    }];
//
//                    
//                    
//                });
//            });
//
//            break;
//        }
//
//        
//            
//           
//            
//        default:
//            break;
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
