//
//  SMHook.h
//  ShortLinkMetric
//
//  Created by lei li on 2020/5/21.
//  Copyright © 2020 BP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMHook : NSObject
+(void)hookClass:(Class)classObject fromSelector:(SEL)fromSelector toSelector:(SEL)toselector;
@end

NS_ASSUME_NONNULL_END
