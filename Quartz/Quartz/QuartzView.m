//
//  QuartzView.m
//  Quartz
//
//  Created by Juan Felipe Montoya Gómez on 7/25/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage= [UIImage imageNamed:@"Bandera_Colombia.png"];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);
    CGContextSetFillColorWithColor(context, _currentColor.CGColor);
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x-_firstTouch.x, _lastTouch.y-_firstTouch.y));
            CGContextStrokePath(context);
            break;
        case kImageShape:{
            CGFloat horizontalOffset = _drawImage.size.width/2;
            CGFloat verticalOffset = _drawImage.size.height/2;
            CGContextDrawImage(context, CGRectMake(_firstTouch.x, _firstTouch.y, horizontalOffset, verticalOffset), _drawImage.CGImage);
            }
            break;
        default:
            break;
    }
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(_useRandomColor){
        _currentColor = [UIColor randomColor];
    }
    
    UITouch * touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, [self currentRect]);
    [self setNeedsDisplayInRect:_redrawRect];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, [self currentRect]);
    [self setNeedsDisplayInRect:_redrawRect];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, [self currentRect]);
    [self setNeedsDisplayInRect:_redrawRect];
}

- (CGRect)currentRect{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x - _firstTouch.x, _lastTouch.y-_firstTouch.y);
}

@end
