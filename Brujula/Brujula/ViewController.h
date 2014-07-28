//
//  ViewController.h
//  Brujula
//
//  Created by Juan Felipe Montoya Gómez on 7/19/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *compassImage;

@property CLLocationManager *locationManager;

@end
