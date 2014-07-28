//
//  MapPoint.m
//  UbicacionMapa
//
//  Created by Juan Felipe Montoya Gómez on 7/18/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "MapPoint.h"


@implementation MapPoint

-(id) initWithCoordinate: (CLLocationCoordinate2D) c title:(NSString*) t{
    self = [super init];
    
    if (self){
        _coordinate = c;
        [self setTitle:t];
    }
    
    return self;
}

-(id) init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(5.07,-75.52056) title:@"Manizales"];
}

@end
