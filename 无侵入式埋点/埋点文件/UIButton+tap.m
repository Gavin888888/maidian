//
//  UIButton+tap.m
//  无侵入式埋点
//
//  Created by lei li on 2020/5/21.
//  Copyright © 2020 lei li. All rights reserved.
//

#import "UIButton+tap.h"
#import "SMHook.h"

@implementation UIButton (tap)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL fromSelector = @selector(sendAction:to:forEvent:);
        SEL toSelector = @selector(hook_sendAction:to:forEvent:);
        [SMHook hookClass:self fromSelector:fromSelector toSelector:toSelector];
    });
}
-(void)hook_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [self insertToSendAction:action to:target forEvent:event];
    [self hook_sendAction:action to:target forEvent:event];
}
-(void)insertToSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([[[event allTouches] anyObject] phase] == UITouchPhaseEnded) {
        NSString *actionString = NSStringFromSelector(action);
        NSString *targetName = NSStringFromClass([target class]);
        NSLog(@"%@",[NSString stringWithFormat:@"%@ %@",targetName,actionString]);
    }
}
@end
