#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

#import <Cocoa/Cocoa.h>

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options);
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview);

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   ----------------------------------------------------------------------------- */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
    NSString *_content = [NSString stringWithContentsOfURL:(__bridge  NSURL *)url encoding:NSUTF8StringEncoding error:nil];
    
    QLPreviewRequestSetDataRepresentation(preview,(__bridge CFDataRef)[_content dataUsingEncoding:NSUTF8StringEncoding],kUTTypePlainText,NULL);
    // To complete your generator please implement the function GeneratePreviewForURL in GeneratePreviewForURL.c
    return noErr;
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview)
{
    // Implement only if supported
}
