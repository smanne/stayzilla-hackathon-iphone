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
    
    NSArray *splitString = [location componentsSeparatedByString:@","];
    NSString *mainLocation = location;
    if (splitString.count > 0) {
        mainLocation = [splitString firstObject];
    }
   
    
    NSString *post =[NSString stringWithFormat:@"location=%@&checkin=%@&checkout=%@&property_type=Hotels",mainLocation, checkIn, checkOut];
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
                                                                         error:&error];
    [delegate didGetHotels:[responseDictionary objectForKey:@"hotels"]];
}


-(void) getInterestPlacesForLocation:(NSString *) location{

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=12.9746239,77.6097423&type=hindu_temple%7Cbar&radius=3000&key=AIzaSyA_umdjHwaK3R9hepK1x6_OUI-VoQCbgMI"]];
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:urlData
                                                                       options:kNilOptions
                                                                         error:&error];
    [delegate didGetInterestPlaces:[responseDictionary objectForKey:@"results"]];


}


- (UIImage*) placePhoto:(NSDictionary*) photoDetails{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=100&photoreference=%@&key=AIzaSyA_umdjHwaK3R9hepK1x6_OUI-VoQCbgMI", [photoDetails objectForKey:@"photo_reference"]]]];
    //    [request setHTTPMethod:@"GET"];
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
     
     UIImage* img = [UIImage imageWithData:urlData];
     
     return img;
}

- (UIImage*) placeHotelPhoto:(NSString*) photoPath{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:photoPath]];
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    UIImage* img = [UIImage imageWithData:urlData];
    
    return img;
}

-(void) getSavingOfferForLocation:(NSString *) location checkInDate:(NSString *) checkIn checkOutDate:(NSString *) checkOut userDestination:(NSString *) userDestination{
    
    NSString *urlString = [NSString stringWithFormat:@"http://128.199.160.52/web/caluclate_saving.php?usersource=%@,&destination=%@",location, userDestination];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    
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
