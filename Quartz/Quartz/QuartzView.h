//
//  QuartzView.h
//  Quartz
//
//  Created by Juan Felipe Montoya Gómez on 7/25/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "UIColor_Random.h"

@interface QuartzView : UIView

@property CGPoint firstTouch;
@property CGPoint lastTouch;

@property UIColor * currentColor;
@property ShapeType shapeType;

@property UIImage * drawImage;
@property BOOL useRandomColor;

//@property CGRect currentRect;
@property CGRect redrawRect;

@end
