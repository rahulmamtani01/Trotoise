//
//  TTAPIHandler.m
//  Tortoise
//
//  Created by Namit Nayak on 10/15/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import "TTAPIHandler.h"
#import "AFNetworking.h"
static NSString *const TTAPIHandlerBaseDomain = @"https://m.bedbathandbeyond.com";
static NSString *const TTAPIHandlerBaseURL = @"/m/getRestResponse";

//static NSString *const TTAPIHandlerBaseDomain = @"http://52.16.49.213";
//static NSString *const TTAPIHandlerBaseURL = @"/Trotoise.Services/Monument.asmx";


static NSString *const TTAPIHandlerMethodGET = @"GET";
static NSString *const TTAPIHandlerMethodPOST = @"POST";
static NSUInteger const TTAPIHandlerDefaultCount = 50;

#define SERVICE_GETMONUMENTLISTBYCITYID @"GetMonumentListOnCityId?id="
@interface TTAPIHandler()

@property (nonatomic, strong) AFHTTPClient *httpClient;


@end

@implementation TTAPIHandler


+ (id)sharedWorker
{
    static TTAPIHandler *sharedInstance = nil;
    static dispatch_once_t pred;
    
    if (sharedInstance) return sharedInstance;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[TTAPIHandler alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        
        NSString *baseURL = [NSString stringWithFormat:@"%@%@",TTAPIHandlerBaseDomain,TTAPIHandlerBaseURL];
        self.httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        
        
        [self.httpClient setDefaultHeader:@"application/x-www-form-urlencoded; charset=utf-8" value:@"application/json"];
        [self.httpClient setDefaultHeader:@"client123" value:@"token"];
        [self.httpClient setDefaultHeader:@"client123" value:@"clientID"];
        [self.httpClient setDefaultHeader:@"BedBathUS" value:@"X-bbb-site-id"];
        [self.httpClient setDefaultHeader:@"MobileApp" value:@"v"];
        
        
        
    }
    
    return self;
}

- (void)getMonumentListByCityID:(NSString*)cityID withRequestType:(REQUEST_TYPE)requestType responseHandler:(TTCityMonumentListResponse)responseHandler{
    
    
}
- (void)getMonumentListByRange:(NSString*)latitude withLongitude:(NSString*)longitude withRequestType:(REQUEST_TYPE)requestType responseHandler:(TTCityMonumentListResponse)responseHandler{
    
    
}
-(void)getMonumentListByCityName:(NSString *)cityName withRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTCityMonumentListResponse)responseHandler{
    
}

-(void)getMonumentListByCountryID:(NSString *)countryID withRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTCityMonumentListResponse)responseHandler{
    
    
}

-(void)getLanguageMappingwithRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTLanguageMappingResponse)responseHandler{
    
    
}

-(void)getMonumentDetailByMonumentID:(NSString *)monumentID withRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTMonumentDetailResponse)responseHandler{
    
    
}

@end
