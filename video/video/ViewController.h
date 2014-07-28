//
//  ViewController.h
//  video
//
//  Created by Juan Felipe Montoya Gómez on 7/12/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
@property   (nonatomic, strong) MPMoviePlayerController * reproductor;

- (IBAction)tapClick:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *userText;

@end
