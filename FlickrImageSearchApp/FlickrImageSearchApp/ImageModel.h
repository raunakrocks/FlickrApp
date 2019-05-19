//
//  ImageModel.h
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageModel : NSObject
@property(nonatomic, strong) NSString *farm;
@property(nonatomic, strong) NSString *server;
@property(nonatomic, strong) NSString *imageID;
@property(nonatomic, strong) NSString *secret;
    
@property (nonatomic, strong) UIImage *image;
    
- (instancetype)initWithFarm:(NSString *)farm server:(NSString *)server imageID:(NSString *)imageID secret:(NSString *)secret;
@end

