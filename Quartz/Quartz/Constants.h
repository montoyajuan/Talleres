//
//  Constants.h
//  Quartz
//
//  Created by Juan Felipe Montoya Gómez on 7/25/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#ifndef Quartz_Constants_h
#define Quartz_Constants_h

typedef enum {
    kLineShape = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
} ShapeType;
typedef enum {
    kRedColorTab = 0,
    kBlueColorTab,
    kYellowColorTab,
    kRandomColorTab
} ColorTabIndex;

#define degressToRadian(x) (M_PI * x / 180.0)
#endif
