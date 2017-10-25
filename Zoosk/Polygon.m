//
//  Polygon.m
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/24/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)
#import "Polygon.h"

@implementation Polygon

-(instancetype) init {
    self = [super init];
    if (self) {
        self.points = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSUInteger) getAngleBetweenPoints:(CGPoint) firstPoint second: (CGPoint) secondPoint {
    return atan2f( secondPoint.y - firstPoint.y , secondPoint.x - firstPoint.x);
}


// Set sides
- (void)setSides:(NSUInteger)sides error:(NSError **)error {
    if (sides <= 0) {
        self.sides = sides;
    } else {
        *error =
            [NSError errorWithDomain:@"com.zoosk.assigment" code:14
                userInfo:[NSDictionary dictionaryWithObject:@"Number of polygon sides can not be 0."
                forKey:NSLocalizedDescriptionKey]];
    }
}

-(void) setPolygonRadius:(NSUInteger) radius {
    self.radius = radius;
}

- (CGPathRef) getCgPathRef:(CGFloat) xCoord andYCoord:(CGFloat) yCoord {
    CGFloat angle = DEGREES_TO_RADIANS(360 / ((CGFloat) self.sides));
    int count = 0;
    
    while (count < self.sides) {
        CGFloat xPosition =
            xCoord + self.radius * cos(angle * ((CGFloat) count));
        CGFloat yPosition =
            yCoord + self.radius * sin(angle * ((CGFloat) count));
        
        [self.points addObject:[NSValue valueWithCGPoint:CGPointMake(xPosition, yPosition)]];
        
        count ++;
    }

    NSValue* v = [self.points firstObject];
    CGPoint first = v.CGPointValue;
    
    CGMutablePathRef path = CGPathCreateMutable();
     CGPathMoveToPoint(path, nil, first.x, first.y);
    
    for (int ix = 1; ix < [self.points count]; ix++) {
        NSValue* pValue = [self.points objectAtIndex:ix];
        CGPoint p = pValue.CGPointValue;
        CGPathAddLineToPoint(path, nil, p.x, p.y);
    }
    
    CGPathCloseSubpath(path);
    return path;
}

@end
