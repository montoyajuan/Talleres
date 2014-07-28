//
//  UIColor_Random.m
//  Quartz
//
//  Created by Juan Felipe Montoya Gómez on 7/25/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "UIColor_Random.h"

@implementation UIColor (UIColor_Random)

+(UIColor*) randomColor{
    CGFloat red = (arc4random() % 256)/255.0;
    CGFloat green = (arc4random() % 256)/255.0;
    CGFloat blue = (arc4random() % 256)/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
