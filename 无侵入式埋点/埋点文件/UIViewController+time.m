//
//  UIViewController+time.m
//  ShortLinkMetric
//
//  Created by lei li on 2020/5/21.
//  Copyright © 2020 BP. All rights reserved.
//

#import "UIViewController+time.h"
#import "SMHook.h"

@implementation UIViewController (time)
+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL fromSelector = @selector(viewWillAppear:);
        SEL toSelector = @selector(hook_viewWillAppear:);
        [SMHook hookClass:self fromSelector:fromSelector toSelector:toSelector];
        
        SEL fromDisappear = @selector(viewWillDisappear:);
        SEL toDisappear = @selector(hook_viewWillDisAppear:);
        [SMHook hookClass:self fromSelector:fromDisappear toSelector:toDisappear];
    });
}
-(void)hook_viewWillAppear:(BOOL)animated{
    // 进来的时间 根据具体的业务去加时间的统计
    [self comeIn];
    [self hook_viewWillAppear:animated];
}

-(void)hook_viewWillDisAppear:(BOOL)animated{
    // 出去的时间 统计方法根据具体的业务加
    [self comeOut];
    [self hook_viewWillDisAppear:animated];
}
-(void)comeIn{
    NSLog(@"%@",[NSString stringWithFormat:@"%@ Appear",NSStringFromClass([self class])]);
}
-(void)comeOut{
    NSLog(@"%@",[NSString stringWithFormat:@"%@ disAppear",NSStringFromClass([self class])]);
}
@end
