//
//  HBCountTimeView.m
//  CircleAnimationTest
//
//  Created by wangfeng on 16/4/20.
//  Copyright © 2016年 zmit. All rights reserved.
//

#import "HBCountTimeView.h"
@interface HBCountTimeView ()

@property (nonatomic, strong) CAShapeLayer* shapeLayer;
@end
@implementation HBCountTimeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
       
        [self initSubView];
        CGFloat radius =ceil(MIN(frame.size.width, frame.size.height)) / 2;
        
        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.fillColor = [[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor;
            //设置线条的宽度和颜色
        self.shapeLayer.lineWidth = 2.0f;
        self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
            //设置stroke起始点
        self.shapeLayer.strokeStart = 0;
        self.shapeLayer.strokeEnd = 1;
            //创建出圆形贝塞尔曲线
        
        UIBezierPath* circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle: -M_PI_2 endAngle:  -M_PI_2 + 0.00000001   clockwise:NO];
        
        self.shapeLayer.path = circlePath.CGPath;
        
        [self.layer addSublayer:self.shapeLayer];

    }
    return self;
}

- (void)initSubView
{
    UILabel* label = [UILabel new];
    label.text = @"跳过";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = self.bounds;
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
    UITapGestureRecognizer* rec = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:rec];
    

}

- (void)tapClick
{
    NSLog(@"%s",__func__);

    if (self.tapBlock) {
                self.tapBlock();
    }
}
- (void)startAnimation {
    
    CABasicAnimation* animation =[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2;
    animation.toValue = @0;
    [self.shapeLayer addAnimation:animation forKey:nil];
    
}

@end
