//
//  DrawPolygonControllerViewController.h
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/24/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"

@interface DrawPolygonControllerViewController : UIViewController <DrawPolygon>
@property id <DrawPolygon> delegate;

@end
