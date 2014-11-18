//
//  DKActivityIndicatorView.h
//
//  Created by Dmitry Konygin on 27.10.14.
//
//

#import <UIKit/UIKit.h>

@interface DKActivityIndicatorView : UIView

@property (nonatomic,strong) UIView *view;

@property (nonatomic,strong) UIActivityIndicatorView *indi;

-(id)initInsideView:(UIView*)view;

-(void)startAnimating;

-(void)stopAnimating;



@end