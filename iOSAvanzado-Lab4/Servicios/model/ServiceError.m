//
//  ServiceError.m
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import "ServiceError.h"

@interface ServiceError()

@end

@implementation ServiceError

+(instancetype) errorWithReason: (NSString*) reason{
    ServiceError* error = [ServiceError new];
    if (error) {
        error.reason = reason;
    }
    return error;
}

@end
