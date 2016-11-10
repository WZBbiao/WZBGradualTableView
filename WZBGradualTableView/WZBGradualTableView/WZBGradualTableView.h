//
//  WZBGradualTableView.h
//  WZBGradualTableView
//
//  Created by 王振标 on 2016/11/6.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import <UIKit/UIKit.h>

// 渐进方向
typedef NS_OPTIONS(NSInteger, WZBTableViewGradualDirection) {
    WZBTableViewGradualDirectionTop                                         = 1 << 0, // top
    WZBTableViewGradualDirectionBottom                                   = 1 <<  1,    // bottom
};

@interface WZBGradualTableView : UITableView

+ (instancetype)gradualTableViewWithFrame:(CGRect)frame direction:(WZBTableViewGradualDirection)direction gradualValue:(id)gradualValue;

- (void)change;

@end
