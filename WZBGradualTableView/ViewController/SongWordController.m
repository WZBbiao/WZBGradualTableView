//
//  SongWordController.m
//  WZBGradualTableView
//
//  Created by 王振标 on 2016/11/10.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "SongWordController.h"
#import "WZBGradualTableView.h"

@interface SongWordController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) WZBGradualTableView *tableView;
@property (nonatomic, strong) NSArray *datas;


@end

@implementation SongWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    [self.view addSubview:backgroundImage];
    backgroundImage.frame = self.view.bounds;
    
    self.view.backgroundColor = [UIColor whiteColor];
    WZBGradualTableView *tableView = [WZBGradualTableView gradualTableViewWithFrame:self.view.bounds direction:(WZBTableViewGradualDirectionTop | WZBTableViewGradualDirectionBottom)  gradualValue:@[@(.3), @0.3]];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    // datas
    self.datas = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SongWords.plist" ofType:nil]];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 30)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}
- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"";
    WZBtableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[WZBtableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

@end

@implementation WZBtableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.frame =  self.bounds;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont systemFontOfSize:13.0f];
    self.textLabel.contentMode = UIViewContentModeScaleAspectFit;
}

@end

