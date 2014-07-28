//
//  ViewController.h
//  SQLLite
//
//  Created by Juan Felipe Montoya Gómez on 7/26/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    sqlite3  *contactDB;
}

@property (strong, nonatomic) IBOutlet UITextField *empIdText;
@property (strong, nonatomic) IBOutlet UITextField *empNameText;
@property (strong, nonatomic) IBOutlet UITextField *empAgeText;
@property (strong, nonatomic) IBOutlet UITextField *empAddressText;
@property (strong, nonatomic) IBOutlet UILabel *empStatus;
@property (strong, nonatomic) IBOutlet UILabel *empIdDB;


- (IBAction)saveData:(id)sender;
- (IBAction)loadData:(id)sender;
- (IBAction)updateData:(id)sender;
- (IBAction)deleteData:(id)sender;

@end
