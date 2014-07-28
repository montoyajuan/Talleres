//
//  AnimacionViewController.h
//  video
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimacionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *userName;

-(void)getUserAndChangeLabel: (NSString*) label;

@property(strong, nonatomic) NSString *userInformation;
@property (strong, nonatomic) IBOutlet UIView *optionView;


- (IBAction)tapBackground:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewContainer;
- (IBAction)simpleAnimate:(id)sender;

- (IBAction)doubleAnimate:(id)sender;

- (IBAction)compoundAnimation:(id)sender;
@end
