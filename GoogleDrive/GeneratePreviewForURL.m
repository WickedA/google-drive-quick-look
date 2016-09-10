@import Cocoa;
@import CoreFoundation;
@import CoreServices;
@import QuickLook;


// This function is responsible for generating a preview of some sort (image, HTML, etc.) and
// sending it over to the Quick Look client.
// The main things it receives that we care about are the preview request reference/handle and the
// JSON link file's URL.

OSStatus GeneratePreviewForURL(
    void*               thisInterface,
    QLPreviewRequestRef previewRequest,
    CFURLRef            linkURL,
    CFStringRef         linkUTI,
    CFDictionaryRef     options
){
    NSLog(@"[GoogleDrive] Link file URL: %@", linkURL);
    
    // Read the link file into a string:
    NSString* linkContents = [NSString
        stringWithContentsOfURL:(__bridge NSURL *)(linkURL)
        encoding:NSUTF8StringEncoding
        error:NULL];
    
    // Use some ugly string manipulation to grab the document URL:
    NSString*  urlStart       = @"\"url\": ";
    NSString*  urlEnd         = @"\",";
    NSRange    urlStartRange  = [linkContents rangeOfString:urlStart];
    NSUInteger urlStartOffset = urlStartRange.location + urlStart.length + 1;
    NSString*  urlSearchSpace = [linkContents substringFromIndex:urlStartOffset];
    NSRange    urlEndRange    = [urlSearchSpace rangeOfString:urlEnd];
    NSString*  url            = [urlSearchSpace substringToIndex:urlEndRange.location];
    NSLog(@"[GoogleDrive] Document URL: %@", url);
    
    // Construct the container page:
    NSString* html = [NSString stringWithFormat:
        // Template:
        @"<!DOCTYPE html>"
        "<html><head>"
        "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
        "<style>body, html { margin: 0; padding: 0; height: 100%%; overflow: hidden; }</style>"
        "<style>#content { position: absolute; left: 0; right: 0; bottom: 0; top: 0px; }</style>"
        "</head><body><div id='content'>"
        "<iframe src='%@' width='100%%' height='100%%'></iframe>"
        "</div></body></html>",
        // Substitution:
        url
    ];
    
    // Convert the NSString to a CFDataRef and ship it over to the client:
    CFDataRef htmlDataRef = (__bridge CFDataRef)([html dataUsingEncoding:NSUTF8StringEncoding]);
    QLPreviewRequestSetDataRepresentation(previewRequest, htmlDataRef, kUTTypeHTML, NULL);
    
    // Debug:
    //QLPreviewRequestSetDataRepresentation(previewRequest, htmlDataRef, kUTTypePlainText, NULL);
    
    // We should probably do some error handling here eventually.
    return noErr;
}


// Stub for CancelPreviewGeneration, which we don't support.
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview) {}