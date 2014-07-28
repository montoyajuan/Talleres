//
//  ViewController.m
//  clases
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validClick:(id)sender {
    
    Person* person1 = [[Person alloc]init];
    NSString* edad = [self edadfield].text;
    [person1 setName: [self namefield].text ];
    [person1 setYears: [edad intValue]];
    if ([person1 isAdult])
    {
        [self resultfield].text = [NSString stringWithFormat:@"%@ es adulto",person1.getName];
    }
    else
    {
        [self resultfield].text = [NSString stringWithFormat:@"%@ no es adulto",person1.getName];
    }

}
@end
