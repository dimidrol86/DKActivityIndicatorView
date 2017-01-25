//
//  DKActivityIndicatorProxy.m
//  Example
//
//  Created by Dmitry on 1/25/17.
//  Copyright © 2017 Grapefruit. All rights reserved.
//

#import "DKActivityIndicatorProxy.h"
#import "DKActivityIndicatorView.h"

@interface DKActivityIndicatorProxy ()

@end

@implementation DKActivityIndicatorProxy

- (instancetype) initWithObject:(DKActivityIndicatorView*)object
{
    _instance = object;
    return self;
}

+ (instancetype) decoratedInstanceOf:(DKActivityIndicatorView*)instance
{
    return [[self alloc] initWithObject:instance];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [_instance methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:_instance];
}

#pragma mark -
-(UIColor*)contextColor{
    id color = [[DKActivityIndicatorView proxy] contextColor];
    if(color){
        return color;
    }
    return [[UIColor blackColor] colorWithAlphaComponent:0.5f];
}

#pragma mark - proxying methods
-(void)startAnimating{
    [_instance setBackgroundColor:[self contextColor]];
    [_instance startAnimating];
}

@end
