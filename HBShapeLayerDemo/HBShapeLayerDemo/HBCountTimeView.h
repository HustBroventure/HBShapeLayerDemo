//
//  HBCountTimeView.h
//  CircleAnimationTest
//
//  Created by wangfeng on 16/4/20.
//  Copyright © 2016年 zmit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBCountTimeView : UIView

@property (nonatomic, copy) void(^tapBlock)();
- (void)startAnimation;
@end
