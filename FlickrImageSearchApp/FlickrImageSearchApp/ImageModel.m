//
//  ImageModel.m
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
- (instancetype)initWithFarm:(NSString *)farm server:(NSString *)server imageID:(NSString *)imageID secret:(NSString *)secret {
    self = [super init];
    if(self) {
        self.farm = farm;
        self.server = server;
        self.imageID = imageID;
        self.secret = secret;
    }
    return self;
}
@end
