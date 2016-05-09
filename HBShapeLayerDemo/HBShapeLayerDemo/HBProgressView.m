//
//  HBProgressView.m
//  CircleAnimationTest
//
//  Created by wangfeng on 16/5/9.
//  Copyright © 2016年 zmit. All rights reserved.
//

#import "HBProgressView.h"

@implementation HBProgressView

- (instancetype)init{
    if (self = [super init]) {
        self.bounds = CGRectMake(0, 0, 43, 40);

        [self initSubLayer:self.bounds];
    }
    return self;
}

- (void)initSubLayer:(CGRect)frame
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = frame;
        //延迟的时间
    replicatorLayer.instanceDelay = 0.6 / 5;
        //重复个数
    replicatorLayer.instanceCount = 5;
        //间隔
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(10,0,0);
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = CGRectMake(0, 0, 3,40);
    shape.lineWidth = 3;
    shape.lineCap = kCALineCapRound;
    shape.strokeColor = [UIColor redColor].CGColor;
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(1.5, 0)];
    [path addLineToPoint:CGPointMake(1.5, shape.frame.size.height)];
    shape.path = path.CGPath;
    
    [shape addAnimation:[self extendAnimation] forKey:@"scaleAnimation"];
    
    [replicatorLayer addSublayer:shape];
    
    [self.layer addSublayer:replicatorLayer];
}
- (CABasicAnimation*)extendAnimation
{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0)];
    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1.0/5, 0.0)];
    scale.autoreverses = YES;
    scale.repeatCount = HUGE;
    scale.duration = 0.6;
    return scale;
}
@end
