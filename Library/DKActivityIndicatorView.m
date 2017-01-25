//
//  DKActivityIndicatorView.m
//
//  Created by Dmitry Konygin on 27.10.14.
//
//

#import "DKActivityIndicatorView.h"
#import "DKActivityIndicatorProxy.h"
#pragma mark -
@interface DKActivityIndicatorAppearance : NSObject <DKActivityIndicatorProps>
@property (nonatomic, strong) UIColor* contextColor;
@end

@implementation DKActivityIndicatorAppearance

@end

#pragma mark -
@implementation DKActivityIndicatorView

/** customized appearance */
+(id<DKActivityIndicatorProps>)proxy
{
    static DKActivityIndicatorAppearance *proxy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        proxy = [[DKActivityIndicatorAppearance alloc] init];
    });
    return proxy;
}

-(id)initInsideView:(UIView*)view
{
    self=[super init];
    if(self)
    {
        CGFloat z=80,x=37;
        
        CGSize size=[DKActivityIndicatorView screenSize];
        [self setAlpha:0];
        [self setFrame:CGRectMake(0, 0, size.width, size.height)];
        [self setHidden:YES];
        [view addSubview:self];
        [self autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        _view=[[UIView alloc] initWithFrame:CGRectMake((size.width/2)-(z/2), (size.height/2)-(z/2), z, z)];
        [_view setHidden:YES];
        
        [_view setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.8f]];
        
        _view.layer.cornerRadius=15.0f;
        [_view.layer setMasksToBounds:YES];
        
        _indi=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_indi setFrame:CGRectMake((z/2)-(x/2),(z/2)-(x/2), x, x)];
        
        [_view addSubview:_indi];
        [self addSubview:_view];
        [_view autoSetDimensionsToSize:CGSizeMake(z, z)];
        [_view autoCenterInSuperview];
        
        //proxying
        self = (DKActivityIndicatorView*)[DKActivityIndicatorProxy decoratedInstanceOf:self];
    }
    return self;
}

+ (CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


-(void)startAnimating
{
    if ([self superview]) [[self superview] bringSubviewToFront:self];
    [self setHidden:NO];
    
    [self.indi startAnimating];
    [self.view setHidden:NO];

    [UIView animateWithDuration:0.3f animations:^{
        [self setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)stopAnimating
{
    [UIView animateWithDuration:0.2f animations:^{
        [self setAlpha:0];
        
    } completion:^(BOOL finished) {
        
        [self.indi stopAnimating];
        [self.view setHidden:YES];
        [self setHidden:YES];
        
        
    }];
}

-(BOOL)isAnimating
{
    return !self.hidden;
}

@end
