//
//  CustomAnnotation.m
//  MapKitAnnotation
//
//  Created by Apple on 1/23/16.
//  Copyright © 2016 AMOSC. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation
- (id) initwithCoordinate:(CLLocationCoordinate2D)coordinate
                 andTitle:(NSString*)title
              andSubTitle:(NSString*)subTitle
              andPinColor:(UIColor*)pinColor{
    self.coordinate = coordinate;
    self.title = title;
    self.subtitle = subTitle;
    self.pinColor = pinColor;
    
    return  self;
}


@end
