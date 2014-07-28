//
//  Person.h
//  clases
//
//  Created by Juan Felipe Montoya Gómez on 7/5/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString* name;
    int years;
}

- (NSString *) getName;
- (void) setName: (NSString *)  value;

- (int) getYears;
- (void) setYears: (int) value;

-(BOOL) isAdult;

@end
