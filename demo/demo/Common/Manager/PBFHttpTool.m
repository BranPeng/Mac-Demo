//
//  PBFHttpTool.m
//  LHGIM
//
//  Created by bran on 16/8/10.
//  Copyright © 2016年 bran. All rights reserved.
//

#import "PBFHttpTool.h"
#import "AFNetworking.h"

@implementation PBFHttpTool

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure responseHeaders:(void (^)(NSDictionary *headers))responseHeaders
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    // 设置请求header
    [session.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [session.requestSerializer setValue:@"tapir" forHTTPHeaderField:@"SNG_DID"];
    [session.requestSerializer setValue:@"com.samsclub.now.qa" forHTTPHeaderField:@"SNG_APP_ID"];
    [session.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    
    // 设置请求超时时间
    session.requestSerializer.timeoutInterval = 100.f;
    
    // 2.发送请求
    [session POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
        NSDictionary *rHeaders = [PBFHttpTool getResponseHeaders:task];
        if (responseHeaders) {
            responseHeaders(rHeaders);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
        NSDictionary *rHeaders = [PBFHttpTool getResponseHeaders:task];
        if (responseHeaders) {
            responseHeaders(rHeaders);
        }
    }];
    
    
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure responseHeaders:(void (^)(NSDictionary *headers))responseHeaders
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    // 2.发送请求
    [session POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (FormData *formData1 in formDataArray) {
            [formData appendPartWithFileData:formData1.data name:formData1.name fileName:formData1.filename mimeType:formData1.mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
        NSDictionary *rHeaders = [PBFHttpTool getResponseHeaders:task];
        if (responseHeaders) {
            responseHeaders(rHeaders);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
        NSDictionary *rHeaders = [PBFHttpTool getResponseHeaders:task];
        if (responseHeaders) {
            responseHeaders(rHeaders);
        }
    }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure responseHeaders:(void (^)(NSDictionary *headers))responseHeaders
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 2.发送请求
    [session GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        if(responseObject != nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
            if (success) {
                success(dic);
            }
        }
        
        NSDictionary *rHeaders = [PBFHttpTool getResponseHeaders:task];
        if (responseHeaders) {
            responseHeaders(rHeaders);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
        NSDictionary *rHeaders = [PBFHttpTool getResponseHeaders:task];
        if (responseHeaders) {
            responseHeaders(rHeaders);
        }
    }];
    
}

+ (NSDictionary *)getResponseHeaders:(NSURLSessionDataTask *)task
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    NSDictionary *allHeaders = response.allHeaderFields;
    return allHeaders;
}

@end
/**
 *  用来封装文件数据的模型
 */
@implementation FormData

@end
