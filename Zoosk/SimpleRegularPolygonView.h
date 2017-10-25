//
//  PolygonView.h
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/24/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Polygon.h"

@protocol ViewEffects
-(void) rotateOnTap:(NSArray*) views;
-(void) colourView :(CGContextRef) context;

@end

@interface SimpleRegularPolygonView : UIView

@property (nonatomic, strong) Polygon* polygon;
@property id<ViewEffects> viewEffectsDelegate;

-(instancetype) initWithSides:(NSUInteger) sides andRadius:(CGFloat) radius andFrame:(CGRect)frame;

@end
