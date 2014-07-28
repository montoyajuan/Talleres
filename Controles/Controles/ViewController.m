//
//  ViewController.m
//  Controles
//
//  Created by Juan Felipe Montoya Gómez on 7/5/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if(_stateConfiguration.on)
    {
        _boxControl.hidden = NO;
    }
    else
    {
        _boxControl.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enableConfiguration:(id)sender {
    
    UISwitch* encendido = sender;
    
    if (encendido.on)
    {
        _boxControl.hidden = NO;
    }
    else
    {
        _boxControl.hidden = YES;
    }
    
}

- (IBAction)changeSlider:(id)sender {
    UISlider* slider = sender;
    _outputVolume.text = [NSString stringWithFormat:@"%f",slider.value];
}

- (IBAction)changeStepper:(id)sender {
    UIStepper* steppert = sender;
    _outputRepeat.text = [NSString stringWithFormat:@"%f",steppert.value];
}
@end
