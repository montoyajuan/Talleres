//
//  ViewController.h
//  camera
//
//  Created by Juan Felipe Montoya Gómez on 7/19/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
- (IBAction)takePicture:(id)sender;

- (IBAction)selectPicture:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageSelected;

@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@end
