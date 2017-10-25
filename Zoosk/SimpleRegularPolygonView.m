//
//  PolygonView.m
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/24/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#import "SimpleRegularPolygonView.h"

@implementation SimpleRegularPolygonView


-(instancetype) initWithSides:(NSUInteger) sides andRadius:(CGFloat) radius andFrame:(CGRect)frame {
        self = [super initWithFrame:frame];
        if (self) {
            [self setBackgroundColor:[UIColor clearColor]];
            self.polygon = [[Polygon alloc] init];
            [self.polygon setSides:sides];
            [self.polygon setPolygonRadius:radius];
        }
        return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGPathRef path = [self.polygon getCgPathRef:CGRectGetMidX(rect) andYCoord: CGRectGetMidY(rect)];
     CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    if (self.viewEffectsDelegate) {
        [self.viewEffectsDelegate colourView:context];
    } else {
        CGColorRef cRef = [UIColor redColor].CGColor;
        CGContextSetStrokeColorWithColor(context, cRef);
        CGContextStrokePath(context);
    }
  }
@end
