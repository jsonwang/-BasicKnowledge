//
//  Person.m
//  MessageForwarding
//
//  Created by AK on 2018/3/18.
//  Copyright © 2018年 yoyo. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
#import "Monkey.h"
@implementation Person

- (int)age
{
    return 18;
    
}

////////////////////////////////////////////////////////////////////
//1.1动态方法解析 类方法
/*
 BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types) 参数说明
 cls:要添加方法的类
 name:选择器
 imp:方法实现,IMP在objc.h中的定义是：typedef id (*IMP)(id, SEL, ...);该方法至少有两个参数,self(id)和_cmd(SEL)
 types:方法,参数和返回值的描述,"v@:"表示返回值为void,没有参数,这些编码参考@see https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 
 
 */
+ (BOOL)resolveClassMethod:(SEL)sel
{
    NSLog(@"%s",__func__);
    if (sel == @selector(number))
    {
        return class_addMethod(object_getClass(self), sel, (IMP)number, "v@:");
    }
    return [super resolveClassMethod:sel];
}

void number(id self,SEL _cmd)
{
    NSLog(@"类方法: %s",__func__);
    
}

////1.2 动态方法解析 对象方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"动态方法解析 %s",__func__);
//    if (sel == @selector(run))
//    {
//        return class_addMethod([self class], sel, (IMP)run, "v@:");
//    }
//    return [super resolveInstanceMethod:sel];
//}

void run(id self,SEL _cmd)
{
    NSLog(@"对象方法: %s",__func__);
}
////////////////////////////////////////////////////////////////////

////2 消息重定向,让别的类开处理这个消息
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    NSLog(@"消息重定向 %s",__func__);
//    if (aSelector == @selector(run))
//    {
//        return [Monkey new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
////////////////////////////////////////////////////////////////////
//3消息转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSLog(@"消息转发:%s",__func__);
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"消息转发:%s",__func__);
    if (anInvocation.selector == @selector(run))
    {
        [anInvocation invokeWithTarget:[Monkey new]];
        return;
    }
    [super forwardInvocation:anInvocation];
}

@end
