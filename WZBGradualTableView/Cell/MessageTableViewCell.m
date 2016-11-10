//
//  MessageTableViewCell.m
//  WZBGradualTableView
//
//  Created by 王振标 on 2016/11/6.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "MessageTableViewCell.h"

@interface MessageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *messageContentView;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@end

@implementation MessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.messageContentView.layer.cornerRadius = 5;
    self.levelLabel.layer.masksToBounds = YES;
    self.levelLabel.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
