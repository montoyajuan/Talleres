//
//  Person.m
//  clases
//
//  Created by Juan Felipe Montoya Gómez on 7/5/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "Person.h"

@implementation Person


- (NSString *) getName
{
    return name;
}
- (void) setName: (NSString *)  value
{
    name = value;
}

- (int) getYears
{
    return years;
}
- (void) setYears: (int) value
{
    years = value;
}

-(BOOL) isAdult
{
    if (years >= 18){
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
