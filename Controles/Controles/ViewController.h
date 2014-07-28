//
//  ViewController.h
//  Controles
//
//  Created by Juan Felipe Montoya Gómez on 7/5/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)enableConfiguration:(id)sender;

- (IBAction)changeSlider:(id)sender;

- (IBAction)changeStepper:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *boxControl;

@property (weak, nonatomic) IBOutlet UILabel *outputVolume;

@property (weak, nonatomic) IBOutlet UILabel *outputRepeat;
@property (weak, nonatomic) IBOutlet UISwitch *stateConfiguration;

@end
