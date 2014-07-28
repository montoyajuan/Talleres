//
//  ViewController.m
//  video
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"
#import "AnimacionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"pronostico" ofType:@"mp4"];
    
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    _reproductor = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    _reproductor.view.frame = CGRectMake(10, 10, 300, 200);
    
    [self.view addSubview:_reproductor.view];
    [_reproductor play];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AnimacionViewController * animacionView = [ segue destinationViewController];
    [animacionView getUserAndChangeLabel:_userText.text];
}

- (IBAction)tapClick:(id)sender {
    [self.view endEditing:YES];
}
@end
