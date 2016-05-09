# HBShapeLayerDemo


###1. 加载框
先上效果图：

![效果图1](http://upload-images.jianshu.io/upload_images/1083284-d3fd54f2e0242a9a.gif?imageMogr2/auto-orient/strip)

再上代码:

```
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

```
在分析思路：
1. 创建一个CAShapeLayer的条条，方式不限
2. 加入动画改变scale的高度
3. CAReplicatorLayer复制为多个


###2. 跳过框

使用场景之一：

![示例图](http://upload-images.jianshu.io/upload_images/1083284-ff1585fc95d60840.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

先上效果图

![效果图2](http://upload-images.jianshu.io/upload_images/1083284-d6b049adc3afe19b.gif?imageMogr2/auto-orient/strip)
再上代码
```
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

- (void)startAnimation {
    
    CABasicAnimation* animation =[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2;
    animation.toValue = @0;
    [self.shapeLayer addAnimation:animation forKey:nil];
    
}
```

再分析思路：
1. 创建一个CAShapeLayer的圆形
2. 设置好起始的角度
3. 添加动画改变`strokeEnd `属性
