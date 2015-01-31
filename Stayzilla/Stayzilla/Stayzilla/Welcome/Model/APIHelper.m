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
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
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

@end
