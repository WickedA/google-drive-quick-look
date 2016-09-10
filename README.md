## Google Drive Quick Look plugin

### This project is probably doomed, ignore it

This was a brief attempt to create a Quick Look plugin to go with the Mac client for Google Drive. Unfortunately, this is unlikely to go anywhere due to sandboxing. Quick Look doesn't allow plugins to access much of anything, especially not the network.

Exactly _what_ the sandbox allows them to do doesn't seem to be documented anywhere. If some form of IPC is allowed, getting around all this would be possible.

The paragraphs below are kept for archival's sake.

--

### Introduction

This is an experimental Quick Look generator for previewing Google Drive documents.

The Google Drive client for Mac stores documents on your disk as tiny JSON files containing information like the document's URL and your username. This plugin opens the document, authenticates using your Safari cookies, grabs the print version and pushes it to the Quick Look client (Finder) as HTML.

### Build procedure

Run `bash build.sh` in the repository root to build and install the plugin.

Delete the `GoogleDrive.qlgenerator` directory from `~/Library/QuickLook` to get rid of it once you're satisfied that it doesn't work.

If xcodebuild fails with an error about the active developer directory, you might need to do a `sudo xcode-select -r` or read [this FAQ page](https://developer.apple.com/library/ios/technotes/tn2339/_index.html).

If you follow the procedure exactly and xcodebuild fails with any other error, that's probably a bug and should be reported. Unless the error is "command not found", in which case you should [install Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12).

### Testing

Since `qlmanage` appears to be broken, you'll have to test it through Finder.

### Original project

This project was originally started as [brock/google-drive-quick-look](https://github.com/brock/google-drive-quick-look).

See the discussion here:  
https://productforums.google.com/forum/#!msg/drive/aHASu_npFMk/NcijNJtPCwgJ

Original references:  
http://blog.10to1.be/cocoa/2012/01/27/creating-a-quick-look-plugin/  
https://github.com/fousa/thong/blob/master/thong/GeneratePreviewForURL.m
