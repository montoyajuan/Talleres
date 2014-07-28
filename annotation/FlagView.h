//
//  FlagView.h
//  annotation
//
//  Created by Juan Felipe Montoya Gómez on 7/19/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface FlagView : MKAnnotationView

@property (strong, nonatomic) IBOutlet UILabel *titleView;

-(void) setTitle: (NSString *) t;

@end
