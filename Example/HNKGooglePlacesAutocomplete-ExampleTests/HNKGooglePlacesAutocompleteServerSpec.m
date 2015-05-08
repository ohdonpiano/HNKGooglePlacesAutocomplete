//
//  HNKGooglePlacesServerSpec.m
//  HNKGooglePlacesAutocomplete-Example
//
//  Created by Harlan Kellaway on 4/28/15.
//  Copyright (c) 2015 Harlan Kellaway. All rights reserved.
//

#import "Kiwi.h"

#import <HNKGooglePlacesAutocomplete/HNKGooglePlacesServer.h>
#import <HNKServerFacade/HNKServer.h>

SPEC_BEGIN(HNKGooglePlacesServerSpec)

describe(@"HNKGooglePlacesServer", ^{

    describe(@"Method: initialize",
             ^{

                 it(@"Should setup HNKServer",
                    ^{
                        [[HNKServer should] receive:@selector(setupWithBaseUrl:)
                                      withArguments:@"https://maps.googleapis.com/maps/api/place/"];

                        [HNKGooglePlacesServer initialize];
                    });
             });

    describe(@"Method: GET:parameters:completion:",
             ^{
                 it(@"Should call HNKServer GET",
                    ^{
                        [[HNKServer should] receive:@selector(GET:parameters:completion:)
                                      withArguments:@"autocomplete/json",
                                                    @{ @"input" : @"Vict",
                                                       @"key" : @"apikey" },
                                                    any()];

                        [HNKGooglePlacesServer GET:@"autocomplete/json"
                                        parameters:@{
                                            @"input" : @"Vict",
                                            @"key" : @"apikey"
                                        }
                                        completion:nil];

                    });
             });

});

SPEC_END