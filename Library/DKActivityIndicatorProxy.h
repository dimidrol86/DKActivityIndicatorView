//
//  DKActivityIndicatorProxy.h
//  Example
//
//  Created by Dmitry on 1/25/17.
//  Copyright © 2017 Grapefruit. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DKActivityIndicatorView;

@interface DKActivityIndicatorProxy : NSProxy
@property (nonatomic, strong) DKActivityIndicatorView *instance;
+(instancetype) decoratedInstanceOf:(DKActivityIndicatorView*)instance;
@end
