//
//  SimplePolygonViewController2.m
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/28/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#import "SimplePolygonViewController2.h"
#import "SimpleRegularPolygonView.h"

@interface SimplePolygonViewController2 () <ViewEffects>

@end

@implementation SimplePolygonViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self.delegate initDrawView];
    self.viewEffectsDelegate = self;
}

#pragma Delegate function
-(void) initDrawView {
    NSUInteger width = CGRectGetWidth(self.view.bounds) / 8;
    NSUInteger height = (CGRectGetHeight(self.view.frame))/ 8; // 25 x 7
    UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    for (int i = 0 ; i < 8; i++) {
        CGFloat yCoord = i * height;
        for (int j = 0; j < 8; j ++) {
            int side = 3 + arc4random() % 8;
            CGFloat xCoord = j * width;
            CGRect frame = CGRectMake(xCoord, yCoord, width, height);
            SimpleRegularPolygonView* view =
            [[SimpleRegularPolygonView alloc] initWithSides:side andRadius:(CGRectGetWidth(frame) / 2) andFrame:frame];
            [view sizeToFit];
            view.viewEffectsDelegate = self;
            [view setTag: (8 * i + j)];
            [self.view addSubview:view];
        }
    }
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    UIView* view = recognizer.view;
   
    CGPoint point = [recognizer locationInView:view];
    UIView *tappedView = [view hitTest:point withEvent:nil];
    if (tappedView.tag == nil) {
        return;
    }
    [self rotateAdjacentView:tappedView];
    
}

-(void) rotateOnTap:(NSArray*) tappedViews {
    if (!tappedViews || [tappedViews count] == 0) {
        return;
    }
    for (UIView* tappedView in tappedViews) {
        if (tappedView == nil) {
            continue;
        }
        CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
        rotationAnimation.duration = 1;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = 1.0;
        rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [tappedView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
}

-(void) rotateAdjacentView:(UIView*) view {
    int tag = view.tag;
    int div= tag / 8;
    int bottomIndex = tag + 8;
    int topIndex = tag - 8;
    int leftIndex = tag - 1;
    int rightIndex = tag + 1;
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    [array addObject:view];
        UIView* leftView = nil;
        if (leftIndex >= 0 && leftIndex / 8 == tag / 8) {
            leftView = [self.view.subviews objectAtIndex:leftIndex];
        }
    if (leftView != nil) {
        [array addObject:leftView];
    }
        UIView* rightView = nil;
        if (rightIndex / 8 == tag/ 8) {
            rightView = [self.view.subviews objectAtIndex:rightIndex];
            
        }
    if (rightView != nil) {
        [array addObject:rightView];
    }
        UIView* bottomView = nil;
        if (div < 7) {
            bottomView = [self.view.subviews objectAtIndex:bottomIndex];
        }
    if (bottomView != nil) {
        [array addObject:bottomView];
    }
        UIView* topView = nil;
   
        if (topIndex >= 0 && div >= 0) {
            topView = [self.view.subviews objectAtIndex:topIndex];
        }
    if (topView != nil) {
        [array addObject:topView];
    }
        [self.viewEffectsDelegate rotateOnTap:[array copy]];
    
}

-(void) colourView:(CGContextRef) context  {
    NSUInteger num = arc4random_uniform(8) + 1;
    UIColor* color = nil;
    switch (num) {
        case 1:
            color = [UIColor redColor];
            break;
        case 2:
            color = [UIColor greenColor];
            break;
        case 3:
            color = [UIColor yellowColor];
            break;
        case 4:
            color = [UIColor blueColor];
            break;
        case 5:
            color = [UIColor orangeColor];
            break;
        case 6:
            color = [UIColor brownColor];
            break;
        case 7:
            color = [UIColor purpleColor];
            break;
        case 8:
            color = [UIColor blackColor];
            break;
        default:
            break;
    }
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
