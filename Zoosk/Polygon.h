//
//  Polygon.h
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/24/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DrawPolygon
-(void) initDrawView;@end

@interface Polygon : NSObject
@property (assign, nonatomic) NSUInteger sides;
@property (assign, nonatomic) NSUInteger radius;
@property (strong, nonatomic) NSMutableArray* points;

-(NSUInteger) getAngleBetweenPoints:(CGPoint) firstPoint second: (CGPoint) secondPoint;
- (void)setSides:(NSUInteger)sides error:(NSError **)error;

-(CGPathRef) getCgPathRef:(CGFloat) xCoord andYCoord:(CGFloat) yCoord;
-(void) setPolygonRadius:(NSUInteger) radius;

@end
