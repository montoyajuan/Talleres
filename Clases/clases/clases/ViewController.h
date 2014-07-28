//
//  ViewController.h
//  clases
//
//  Created by Juan Felipe Montoya Gómez on 7/5/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *namefield;

@property (weak, nonatomic) IBOutlet UITextField *edadfield;

@property (weak, nonatomic) IBOutlet UILabel *resultfield;

- (IBAction)validClick:(id)sender;

@end
