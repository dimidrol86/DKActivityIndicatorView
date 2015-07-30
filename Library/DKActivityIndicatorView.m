//
//  DKActivityIndicatorView.m
//
//  Created by Dmitry Konygin on 27.10.14.
//
//

#import "DKActivityIndicatorView.h"

@implementation DKActivityIndicatorView


-(id)initInsideView:(UIView*)view
{
    self=[super init];
    if(self)
    {
        CGFloat z=80,x=37;
        
        CGSize size=[DKActivityIndicatorView screenSize];
        
        [self setFrame:CGRectMake(0, 0, size.width, size.height)];
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0]];
        [self setHidden:YES];
        [view addSubview:self];
        
        self.view=[[UIView alloc] initWithFrame:CGRectMake((size.width/2)-(z/2), (size.height/2)-(z/2), z, z)];
        [self.view setHidden:YES];
        
        [self.view setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.8f]];
        
        self.view.layer.cornerRadius=15.0f;
        [self.view.layer setMasksToBounds:YES];
        
        self.indi=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.indi setFrame:CGRectMake((z/2)-(x/2),(z/2)-(x/2), x, x)];
        
        [self.view addSubview:self.indi];
        [self addSubview:self.view];
        
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
    [[self superview] bringSubviewToFront:self];
    [self setHidden:NO];
    
    [self.indi startAnimating];
    [self.view setHidden:NO];
    
    [UIView animateWithDuration:0.1f animations:^{
        
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)stopAnimating
{
    [UIView animateWithDuration:0.1f animations:^{
        
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0]];
        
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
