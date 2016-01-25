//
//  ViewController.m
//  MapKitAnnotation
//
//  Created by Apple on 1/23/16.
//  Copyright © 2016 AMOSC. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnnotation.h"
#import "DetailFTUViewController.h"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, strong) MKMapView* mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    
    // Display TechMaster
    MKMapCamera *mapCamera  = [MKMapCamera new];
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(21.023274, 105.802344);
    mapCamera = [MKMapCamera cameraLookingAtCenterCoordinate:location fromDistance:20000 pitch:0 heading:0];
    self.mapView.camera = mapCamera;
    
    MKPointAnnotation*pointAnnotation = [MKPointAnnotation new];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(21.027665, 105.797411);
    pointAnnotation.title = @"My Home";
    pointAnnotation.subtitle = @"I have lived here for 4 years";

    [self.mapView addAnnotation:pointAnnotation];
    
//    add other place with tincolor :
    CustomAnnotation *pointAnnotation2 = [[CustomAnnotation alloc]
                                          initwithCoordinate:CLLocationCoordinate2DMake(21.023274, 105.802344) andTitle:@"My University"
                                          andSubTitle:@"91, chua lang str"
                                          andPinColor:[UIColor blueColor]];
    

    [self.mapView addAnnotation:pointAnnotation2];
    
    
    [self.view addSubview:self.mapView];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView*poinAnnotation = (MKAnnotationView*) [mapView dequeueReusableAnnotationViewWithIdentifier:@"MapViewAnnotationCell"];
    
    if ([annotation isMemberOfClass:[CustomAnnotation class]]){
        
        if (!poinAnnotation){
            poinAnnotation = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"MapViewAnnotationCell"];
            poinAnnotation.image = [UIImage imageNamed:@"ftu.jpg"];
            
            poinAnnotation.canShowCallout = YES;
            
//            poinAnnotation.pinTintColor = ((CustomAnnotation*)annotation).pinColor;
            
            
            
            poinAnnotation.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ftu.jpg"]];
            poinAnnotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
            
            
        }else{
            poinAnnotation.annotation = annotation;
        }
        return poinAnnotation;
    }
    return nil;
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    DetailFTUViewController*detailView = [DetailFTUViewController new];
    [self.navigationController pushViewController:detailView animated:true];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
