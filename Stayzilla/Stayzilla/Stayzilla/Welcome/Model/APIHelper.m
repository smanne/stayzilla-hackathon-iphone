//
//  APIHelper.m
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import "APIHelper.h"

@implementation APIHelper

@synthesize delegate;

-(void) getHotelsForLocation:(NSString *) location checkInDate:(NSString *) checkIn checkOutDate:(NSString *) checkOut{
    
    NSString *post =[NSString stringWithFormat:@"location=%@&checkin=%@&checkout=%@&property_type=Hotels",location, checkIn, checkOut];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",(int)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://180.92.168.7/hotels"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:urlData
                                                                       options:kNilOptions
                                                                         error:&error];;
    [delegate didGetHotels:[responseDictionary objectForKey:@"hotels"]];
}

-(void) getSavingOfferForLocation:(NSString *) location checkInDate:(NSString *) checkIn checkOutDate:(NSString *) checkOut userDestination:(NSString *) userDestination{
    
    NSString *urlString = [NSString stringWithFormat:@"http://128.199.160.52/web/caluclate_saving.php?usersource=%@,&destination=%@",location, userDestination];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:postData];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:urlData
                                                                       options:kNilOptions
                                                                         error:&error];;
    [delegate didGetOffer:responseDictionary];

}

@end
