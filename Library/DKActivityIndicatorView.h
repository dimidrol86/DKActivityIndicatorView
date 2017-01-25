//
//  DKActivityIndicatorView.h
//
//  Created by Dmitry Konygin on 27.10.14.
//
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>

@protocol DKActivityIndicatorProps <NSObject>
@property (nonatomic, strong) UIColor* contextColor;
@end

@interface DKActivityIndicatorView : UIView

@property (nonatomic,strong) UIView *view;
@property (nonatomic,strong) UIActivityIndicatorView *indi;

#pragma mark Proxy
+(id<DKActivityIndicatorProps>)proxy;

-(id)initInsideView:(UIView*)view;

-(void)startAnimating;

-(void)stopAnimating;

-(BOOL)isAnimating;

@end
