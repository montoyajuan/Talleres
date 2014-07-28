//
//  ViewController.h
//  picker
//
//  Created by Juan Felipe Montoya Gómez on 7/11/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerPaises;

@property (strong, nonatomic) NSArray *paises;

@end
