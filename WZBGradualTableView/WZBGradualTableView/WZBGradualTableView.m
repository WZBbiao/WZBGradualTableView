//
//  WZBGradualTableView.m
//  WZBGradualTableView
//
//  Created by 王振标 on 2016/11/6.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "WZBGradualTableView.h"

@interface WZBGradualTableView () <UITableViewDelegate>

@property (nonatomic, assign) WZBTableViewGradualDirection direction;

@end

@implementation WZBGradualTableView

+ (instancetype)gradualTableViewWithFrame:(CGRect)frame direction:(WZBTableViewGradualDirection)direction gradualValue:(id)gradualValue {
    return [[self alloc] initWithFrame:frame direction:direction gradualValue:gradualValue];
}

- (instancetype)initWithFrame:(CGRect)frame direction:(WZBTableViewGradualDirection)direction gradualValue:(id)gradualValue {
    self = [super initWithFrame:frame];
    if (self) {
        self.direction = direction;
        NSNumber *topValue = @0, *bottomValue = @0;
        if (direction & WZBTableViewGradualDirectionTop) {
            if ([gradualValue isKindOfClass:[NSNumber class]]) {
                topValue = gradualValue;
            } else {
                topValue = [(NSArray*)gradualValue firstObject];
            }
        }
        if (direction & WZBTableViewGradualDirectionBottom) {
            if ([gradualValue isKindOfClass:[NSNumber class]]) {
                bottomValue = gradualValue;
            } else {
                bottomValue = [(NSArray*)gradualValue lastObject];
            }
        }
        
        if (!self.layer.mask) {
            CAGradientLayer *maskLayer = [CAGradientLayer layer];
            maskLayer.locations = @[@0.0, topValue, @(1-bottomValue.doubleValue), @1.0f];
            maskLayer.bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            maskLayer.anchorPoint = CGPointZero;
            self.layer.mask = maskLayer;
        }
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        [self change];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self change];
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)change {
    UIScrollView *scrollView = (UIScrollView *)self;
    CGColorRef outerColor = [UIColor colorWithWhite:1.0 alpha:0.0].CGColor;
    CGColorRef innerColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    NSArray *colors;
    
    if (scrollView.contentOffset.y + scrollView.contentInset.top <= 0) {
        //Top of scrollView
        colors = @[(__bridge id) innerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) outerColor];
    } else if (scrollView.contentOffset.y + scrollView.frame.size.height
               >= scrollView.contentSize.height) {
        //Bottom of tableView
        colors = @[(__bridge id) outerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) innerColor];
    } else {
        //Middle
        colors = @[(__bridge id) outerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) outerColor];
    }
    ((CAGradientLayer *) scrollView.layer.mask).colors = colors;
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    scrollView.layer.mask.position = CGPointMake(0, scrollView.contentOffset.y);
    [CATransaction commit];
}

@end
