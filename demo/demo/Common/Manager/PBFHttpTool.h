//
//  PBFHttpTool.h
//  LHGIM
//
//  Created by bran on 16/8/10.
//  Copyright © 2016年 bran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBFHttpTool : NSObject

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 *  @param responseHeaders 请求响应头信息
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure responseHeaders:(void (^)(NSDictionary *headers))responseHeaders;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formDataArray  文件参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 *  @param responseHeaders 请求响应头信息
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id json))success failure:(void (^)(NSError *error))failure responseHeaders:(void (^)(NSDictionary *headers))responseHeaders;

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 *  @param responseHeaders 请求响应头信息
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure responseHeaders:(void (^)(NSDictionary *headers))responseHeaders;

/**
 *  获取请求响应头信息
 */
+ (NSDictionary *)getResponseHeaders:(NSURLSessionDataTask *)task;

@end

/**
 *  用来封装文件数据的模型
 */
@interface FormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;
@end

