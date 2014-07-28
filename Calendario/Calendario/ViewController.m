//
//  ViewController.m
//  Calendario
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"
#import "modelDate.h"
#import "currentDateViewController.h"


@interface ViewController ()
    @property (readonly, strong, nonatomic) modelDate * modelController;
@end

@implementation ViewController

@synthesize pageViewController=_pageViewController;
@synthesize modelController = _modelController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    
    self.pageViewController.delegate = self;
    
    currentDateViewController * startingViewContrtoller = [self.modelController viewControllerAtIndex:0 year:2014 storyboard:self.storyboard];
    
    NSArray * viewControllers = [NSArray arrayWithObject:startingViewContrtoller];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.dataSource = self.modelController;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    CGRect pageViewRect = self.view.bounds;
    self.pageViewController.view.frame = pageViewRect;
    [self.pageViewController didMoveToParentViewController:self];
    
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (modelDate *) modelController{
    if(!_modelController){
        _modelController = [[modelDate alloc] init];
    }
    return _modelController;
}

@end
