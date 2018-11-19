//
//  WebImageOperations.m
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import "WebImageOperations.h"

@implementation WebImageOperations

+ (void)processImageDataWithURLString:(NSString *)urlString
                             andBlock:(void (^)(NSData *imageData))processImage {
    NSURL *url = [NSURL URLWithString:urlString];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            processImage(imageData);
        });
    });
}

+(UIImage*)getImageFrmUrlString: (NSString*) urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSData * imageData = [NSData dataWithContentsOfURL:url];
    return [UIImage imageWithData:imageData];
}

@end
