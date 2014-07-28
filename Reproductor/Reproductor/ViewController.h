//
//  ViewController.h
//  Reproductor
//
//  Created by Juan Felipe Montoya Gómez on 7/5/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>
- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)changeSpeed:(id)sender;
- (IBAction)changeVolume:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UIView *progress;
@property (strong, nonatomic) AVAudioPlayer *reproductor;
@property (weak, nonatomic) IBOutlet UISlider *volumen;
@property (weak, nonatomic) IBOutlet UISlider *rate;
@property (weak, nonatomic) IBOutlet UIProgressView *status;

- (void)UpdateStatus:(NSTimer *)timer;

@end
