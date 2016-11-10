//
//  LiveVideoController.m
//  WZBGradualTableView
//
//  Created by 王振标 on 2016/11/10.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "LiveVideoController.h"
#import "WZBGradualTableView.h"
#import "MessageTableViewCell.h"

static NSString *const cellId = @"MessageTableViewCellId";

@interface LiveVideoController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) WZBGradualTableView *tableView;

@end

@implementation LiveVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [self.view addSubview:backgroundImage];
    backgroundImage.frame = self.view.bounds;
    
    self.view.backgroundColor = [UIColor whiteColor];
    WZBGradualTableView *tableView = [WZBGradualTableView gradualTableViewWithFrame:CGRectMake(0, self.view.frame.size.height - 180, self.view.frame.size.width, 140) direction:WZBTableViewGradualDirectionTop  gradualValue:@.3f];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [tableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:cellId];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 30)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
