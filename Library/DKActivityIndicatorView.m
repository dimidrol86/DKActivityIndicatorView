//
//  DKActivityIndicatorView.m
//
//  Created by Dmitry Konygin on 27.10.14.
//
//

#import "DKActivityIndicatorView.h"

@implementation DKActivityIndicatorView


-(id)initInsideView:(UIView*)v
{
    self=[super init];
    if(self)
    {
        CGFloat z=80,x=37;
        [self setFrame:v.frame];
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0]];
        [self setHidden:YES];
        [v addSubview:self];
        self.view=[[UIView alloc] initWithFrame:CGRectMake((v.frame.size.width/2)-(z/2), (v.frame.size.height/2)-(z/2), z, z)];
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

-(void)startAnimating
{
    [self setHidden:NO];

    [UIView animateWithDuration:0.1f animations:^{
        
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]];
        
    } completion:^(BOOL finished) {
        
        [self.indi startAnimating];
        [self.view setHidden:NO];
        
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

@end
