//
//  SimplePolygonViewController2.h
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/28/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"
#import "SimpleRegularPolygonView.h"

@interface SimplePolygonViewController2 : UIViewController <DrawPolygon, ViewEffects>
@property id <DrawPolygon> delegate;
@property id<ViewEffects> viewEffectsDelegate;

@end
