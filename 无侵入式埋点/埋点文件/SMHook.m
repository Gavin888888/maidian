//
//  SMHook.m
//  ShortLinkMetric
//
//  Created by lei li on 2020/5/21.
//  Copyright © 2020 BP. All rights reserved.
//

#import "SMHook.h"
#import <objc/runtime.h>

@implementation SMHook
+(void)hookClass:(Class)classObject fromSelector:(SEL)fromSelector toSelector:(SEL)toselector{
    Class class = classObject;
    // 得到被替换类的实例方法
    Method fromMethod = class_getInstanceMethod(class, fromSelector);
    // 得到替换类的实例方法
    Method toMethod = class_getInstanceMethod(class, toselector);
    if (class_addMethod(class, fromSelector, method_getImplementation(toMethod), method_getTypeEncoding(fromMethod))) {
        class_replaceMethod(class, toselector, method_getImplementation(fromMethod), method_getTypeEncoding(toMethod));
    }else{
        method_exchangeImplementations(fromMethod, toMethod);
    }
}
@end
