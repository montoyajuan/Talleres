//
//  ViewController.m
//  Reproductor
//
//  Created by Juan Felipe Montoya Gómez on 7/5/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *progressTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSError *error;
    NSString *ruta = [[NSBundle mainBundle] pathForResource:@"himno_de_colombia" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    _reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    _reproductor.volume = 1;
    _reproductor.pan = 0.5;
    _reproductor.rate = 1;
    _reproductor.enableRate = YES;
    //Infinito
    _reproductor.numberOfLoops = -1;
    _reproductor.delegate = self;
    
    _volumen.value = _reproductor.volume;
    _rate.value = _reproductor.rate;
    
    _status.progress = 0;
    
    [_reproductor prepareToPlay];
    
    //NSLog(&error);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    [_reproductor play];
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(UpdateStatus:) userInfo:nil repeats:YES];
}

- (IBAction)stop:(id)sender {
    [_reproductor stop];
    _reproductor.currentTime = 0;
    _status.progress = 0;
    [progressTimer invalidate];
}

- (IBAction)pause:(id)sender {
    [_reproductor pause];
}

- (IBAction)changeSpeed:(id)sender {
    UISlider* speed = sender;
    _reproductor.rate = speed.value;
}

- (IBAction)changeVolume:(id)sender {
    UISlider* volumen = sender;
    _reproductor.volume = volumen.value;
}

- (void)UpdateStatus:(NSTimer *)timer{
    _status.progress = _reproductor.currentTime / _reproductor.duration;
    _time.text = [NSString stringWithFormat:@"Duration: %f CurrentTime: %f", _reproductor.duration, [_reproductor currentTime]];
}
@end
