//
//  CustomAnnotation.h
//  MapKitAnnotation
//
//  Created by Apple on 1/23/16.
//  Copyright © 2016 AMOSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface CustomAnnotation : NSObject <MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;
@property (nonatomic, strong) UIColor *pinColor;

- (id) initwithCoordinate:(CLLocationCoordinate2D)coordinate
                 andTitle:(NSString*)title
              andSubTitle:(NSString*)subTitle
              andPinColor:(UIColor*)pinColor;



@end
