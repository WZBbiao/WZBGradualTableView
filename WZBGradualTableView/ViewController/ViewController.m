//
//  ViewController.m
//  WZBGradualTableView
//
//  Created by 王振标 on 2016/11/6.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "ViewController.h"
#import "SongWordController.h"
#import "LiveVideoController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)jumpSongWordController:(id)sender {
    [self presentViewController:[SongWordController new] animated:YES completion:nil];
}

- (IBAction)jumpLiveVideoController:(id)sender {
    [self presentViewController:[LiveVideoController new] animated:YES completion:nil];
}

@end
