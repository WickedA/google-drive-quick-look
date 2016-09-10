## Google Drive Quick Look plugin

### Introduction

This is an experimental Quick Look generator for previewing Google Drive documents.

The Google Drive client for Mac stores documents on your disk as tiny JSON files containing information like the document's URL and your username. This plugin opens the document, authenticates using your Safari cookies, grabs the print version and pushes it to the Quick Look client (Finder) as HTML.

### Original project

This project was originally started as [brock/google-drive-quick-look](https://github.com/brock/google-drive-quick-look).

See the discussion here:  
https://productforums.google.com/forum/#!msg/drive/aHASu_npFMk/NcijNJtPCwgJ

Original references:  
http://blog.10to1.be/cocoa/2012/01/27/creating-a-quick-look-plugin/  
https://github.com/fousa/thong/blob/master/thong/GeneratePreviewForURL.m