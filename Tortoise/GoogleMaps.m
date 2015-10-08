//
//  GoogleMaps.m
//  Tortoise
//
//  Created by Namit Nayak on 10/7/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import "GoogleMaps.h"
@import GoogleMaps;


@interface GoogleMaps ()

@property (nonatomic,strong) GMSCameraPosition *camera;
@property (nonatomic,strong) GMSMapView *mapView;


@end

@implementation GoogleMaps



-(id)init{
    
    if(self = [super init]){
        
        
    }
    return self;
    
}




-(id)initWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude zoom:(float)zoomScale frame:(CGRect)rect{
    
    
    if(self=[super initWithFrame:rect]){
        _camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                              longitude:151.20
                                                   zoom:6];
        _mapView = [GMSMapView mapWithFrame:rect camera:_camera];
        _mapView.myLocationEnabled = YES;
        
        // Creates a marker in the center of the map.
        self.frame = rect;
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
        marker.title = @"Sydney";
        marker.snippet = @"Australia";
        marker.map = _mapView;
        [self addSubview:_mapView];
    }
    
    
    return self;
}


@end
