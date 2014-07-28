//
//  ViewController.m
//  camera
//
//  Created by Juan Felipe Montoya Gómez on 7/19/14.
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
    
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [self alertStatus:@"El dispositivo no tiene camara disponible" :@"Error" :0];
        _cameraButton.enabled = NO;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [picker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
    [self presentViewController:picker animated:YES completion:NULL];    
}

- (IBAction)selectPicture:(id)sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
   [self presentViewController:picker animated:YES completion:NULL];
}


- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *capturedImage = info [UIImagePickerControllerEditedImage];
    _imageSelected.image = capturedImage;
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        UIImageWriteToSavedPhotosAlbum(capturedImage, nil, nil, nil);
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
