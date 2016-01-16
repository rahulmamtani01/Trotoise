//
//  TTAPIHandler.m
//  Tortoise
//
//  Created by Namit Nayak on 10/15/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import "TTAPIHandler.h"
#import "AFNetworking.h"
static NSString *const TTAPIHandlerBaseDomain = @"http://52.16.49.213";
static NSString *const TTAPIHandlerBaseURL = @"/Trotoise.Services/Monument.asmx/";

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
        
        
        [self.httpClient setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
//        [self.httpClient setDefaultHeader:@"client123" value:@"token"];
//        [self.httpClient setDefaultHeader:@"client123" value:@"clientID"];
//        [self.httpClient setDefaultHeader:@"BedBathUS" value:@"X-bbb-site-id"];
//        [self.httpClient setDefaultHeader:@"MobileApp" value:@"v"];
//        
        
        
    }
    
    return self;
}

- (void)getMonumentListByCityID:(NSString*)cityID withRequestType:(REQUEST_TYPE)requestType responseHandler:(TTCityMonumentListResponse)responseHandler{
    
    NSString *aPath = @"GetMonumentListOnCityId";
    
    NSDictionary *aParametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:cityID,@"id" , nil];
    
    NSMutableURLRequest *aURLRequest = [self.httpClient requestWithMethod:TTAPIHandlerMethodGET path:aPath parameters:aParametersDictionary];

    AFJSONRequestOperation *anOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:aURLRequest
                                                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                              
                                                                                              
//                                                                                              responseHandler(anArray, nil);
                                                                                          }
                                                                                          failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                              responseHandler(nil, error);
                                                                                          }];
    // execute the operation
    [anOperation start];

    
}
- (void)getMonumentListByRange:(NSString*)latitude withLongitude:(NSString*)longitude withrad:(NSString *)rad withRequestType:(REQUEST_TYPE)requestType responseHandler:(TTCityMonumentListResponse)responseHandler{
    
    NSString *aPath = @"GetMonumentListByRange";
    
    
    
    NSDictionary *aParametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:latitude,@"lat",longitude,@"lng",rad,@"rad" , nil];
    
    NSMutableURLRequest *aURLRequest = [self.httpClient requestWithMethod:TTAPIHandlerMethodGET path:aPath parameters:aParametersDictionary];
    
    AFJSONRequestOperation *anOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:aURLRequest
                                                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                              
                                                                                              
                                                                                              //                                                                                              responseHandler(anArray, nil);
                                                                                          }
                                                                                          failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                              responseHandler(nil, error);
                                                                                          }];
    // execute the operation
    [anOperation start];
}
-(void)getMonumentListByCityName:(NSString *)cityName withRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTCityMonumentListResponse)responseHandler{
    NSString *aPath = @"GetMonumentListOnCityName";
    
    NSDictionary *aParametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:cityName,@"name" , nil];
    
    NSMutableURLRequest *aURLRequest = [self.httpClient requestWithMethod:TTAPIHandlerMethodGET path:aPath parameters:aParametersDictionary];
    
    AFJSONRequestOperation *anOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:aURLRequest
                                                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                              
                                                                                              
                                                                                              //                                                                                              responseHandler(anArray, nil);
                                                                                          }
                                                                                          failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                              responseHandler(nil, error);
                                                                                          }];
    // execute the operation
    [anOperation start];
}

-(void)getMonumentListByCountryID:(NSString *)countryID withRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTCityMonumentListResponse)responseHandler{
    
    NSString *aPath = @"GetMonumentListOnCountryId";
    
    NSDictionary *aParametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:countryID,@"id" , nil];
    
    NSMutableURLRequest *aURLRequest = [self.httpClient requestWithMethod:TTAPIHandlerMethodGET path:aPath parameters:aParametersDictionary];
    
    AFJSONRequestOperation *anOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:aURLRequest
                                                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                              
                                                                                              
                                                                                              //                                                                                              responseHandler(anArray, nil);
                                                                                          }
                                                                                          failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                              responseHandler(nil, error);
                                                                                          }];
    // execute the operation
    [anOperation start];
}

-(void)getLanguageMappingwithRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTLanguageMappingResponse)responseHandler{
    
    NSString *aPath = @"GetLanguageMapping";
    
    NSDictionary *aParametersDictionary = nil;
    
    NSMutableURLRequest *aURLRequest = [self.httpClient requestWithMethod:TTAPIHandlerMethodGET path:aPath parameters:aParametersDictionary];
    
    AFJSONRequestOperation *anOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:aURLRequest
                                                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                              
                                                                                              
                                                                                              //                                                                                              responseHandler(anArray, nil);
                                                                                          }
                                                                                          failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                              responseHandler(nil, error);
                                                                                          }];
    // execute the operation
    [anOperation start];
}

-(void)getMonumentDetailByMonumentID:(NSString *)monumentID withRequestType:(REQUEST_TYPE)requestType withResponseHandler:(TTMonumentDetailResponse)responseHandler{
    NSString *aPath = @"GetMonumentDetail";
    
    NSDictionary *aParametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:monumentID,@"id" , nil];
    
    NSMutableURLRequest *aURLRequest = [self.httpClient requestWithMethod:TTAPIHandlerMethodGET path:aPath parameters:aParametersDictionary];
    
    AFJSONRequestOperation *anOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:aURLRequest
                                                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                              
                                                                                              
                                                                                              //                                                                                              responseHandler(anArray, nil);
                                                                                          }
                                                                                          failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                              responseHandler(nil, error);
                                                                                          }];
    // execute the operation
    [anOperation start];
    
}


- (id)processJSONResponse:(id)JSON forRequest:(id)request
{
    
//    if()
    // when all else fails
    return nil;
}

@end
