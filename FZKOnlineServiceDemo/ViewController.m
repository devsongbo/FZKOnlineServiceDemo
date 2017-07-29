//
//  ViewController.m
//  FZKOnlineServiceDemo
//
//  Created by 宋搏 on 06/07/2017.
//  Copyright © 2017 FZK. All rights reserved.
//

#import "ViewController.h"
#import <FZKOnlineService/FZKOnlineService.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)push:(UIButton *)sender {
    

    [[FZKOnlineService shared] pushToOnlineServiceWithSessionTitle:@"思锐管家" customID:@"123" Nav:self.navigationController];

    
    
    //用户手机 当前车ID 品牌车型 坐标 手机型号 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
