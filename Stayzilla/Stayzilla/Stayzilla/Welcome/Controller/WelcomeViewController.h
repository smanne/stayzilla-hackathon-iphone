//
//  WelcomeViewController.h
//  Stayzilla
//
//  Created by Swapnil Patil on 31/01/15.
//  Copyright (c) 2015 Blackhat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIHelper.h"
#import "HotelsViewController.h"
#import "ComparisionViewController.h"
#import "SPGooglePlacesAutocompleteViewController.h"

@interface WelcomeViewController : UIViewController <UITextFieldDelegate, APIHelperProtocol, LocatioanSelectionDelegate>


@end
