//
//  GoogleMaps.h
//  Tortoise
//
//  Created by Namit Nayak on 10/7/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface GoogleMaps : UIView
-(id)initWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude zoom:(float)zoomScale frame:(CGRect)rect;

@end
