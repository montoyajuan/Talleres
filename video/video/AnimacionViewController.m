//
//  AnimacionViewController.m
//  video
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "AnimacionViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface AnimacionViewController ()
{
    CGFloat posActual;
}
@end

@implementation AnimacionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _userName.text = _userInformation;
    posActual = _optionView.frame.origin.y ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getUserAndChangeLabel: (NSString*) label{
    _userInformation = label;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapBackground:(id)sender {
        [self.view endEditing:YES];
}
- (IBAction)simpleAnimate:(id)sender {
    [_viewContainer.layer removeAllAnimations];
    [_optionView.layer removeAllAnimations];
    _viewContainer.alpha = 1;
    _viewContainer.backgroundColor = [UIColor brownColor];
    
    [UIView animateWithDuration:1 animations:^{
        _viewContainer.frame = CGRectMake(_viewContainer.frame.origin.x, _viewContainer.frame.origin.y, _viewContainer.frame.size.width, 150);
        _viewContainer.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
        
        _optionView.frame = CGRectMake(_optionView.frame.origin.x, posActual + 150, _optionView.frame.size.width, _optionView.frame.size.height);
        _viewContainer.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    }];
}

- (IBAction)doubleAnimate:(id)sender {
    
    [_viewContainer.layer removeAllAnimations];
    [_optionView.layer removeAllAnimations];
    _viewContainer.alpha = 1;
    _viewContainer.backgroundColor = [UIColor brownColor];
    
    
    [UIView animateWithDuration:1 animations:^{
        _viewContainer.frame = CGRectMake(_viewContainer.frame.origin.x, _viewContainer.frame.origin.y, _viewContainer.frame.size.width, 150);
        _viewContainer.alpha = 1;
        
        _optionView.frame = CGRectMake(_optionView.frame.origin.x, posActual + 150, _optionView.frame.size.width, _optionView.frame.size.height);

    } completion:^(BOOL finished) {
        _viewContainer.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    }];
}
- (IBAction)compoundAnimation:(id)sender {
    
    [_viewContainer.layer removeAllAnimations];
    [_optionView.layer removeAllAnimations];
    _viewContainer.alpha = 1;
    _viewContainer.backgroundColor = [UIColor brownColor];
    
    [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionOverrideInheritedCurve | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        _viewContainer.frame = CGRectMake(_viewContainer.frame.origin.x, _viewContainer.frame.origin.y, _viewContainer.frame.size.width, 150);
        _viewContainer.alpha = 1;
        _viewContainer.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];

        _optionView.frame = CGRectMake(_optionView.frame.origin.x, posActual + 150, _optionView.frame.size.width, _optionView.frame.size.height);
        
    } completion:^(BOOL finished) {
        _viewContainer.backgroundColor = [UIColor brownColor];
    }];
    
}
@end
