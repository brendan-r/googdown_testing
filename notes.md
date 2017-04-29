# Notes

Using the Drive API saves you a tonne of work, so much of the formatting is already done for you. It has two problems:

- Whenever you upload a new version, comments and other google formatting are blown away
- Certain information could be lost, e.g. code formatting (there could be a way around this with sensible diffing)

It's probably worth working around this for the time-being to get an end-to-end version working, perhaps persuing the full JSON based effort at a later date.


## Chose upload format

## Choose a download format

## Find a way to 'unknit' a document

## Come up with a sensible way to do 'diffing'


## Uses of Google Apps Script

Even if you're not going to make GAS a primary reader/writer, you could still use some of it's functionality, for example, for adding a TOC. Hm, but how would that come-back?

- Take a look at how difficult it would be to write a json -> gdoc transformer. There can only be so many parts to write!

- There can only be so many actions when converting: Add, remove, or alter. Adding and removing should be pretty easy, altering can be done with find/replace text (if text within a para.)

- The tricky part is adding -- for each type of object in markdown / a google doc, you'll need to come up with some way to convert between the two. The markdown part will be handed by the pandoc AST translation.

# On file formats and interoperability

- Pandoc can write to RTF, but not read from it.



# On the Google Docs format compared to Commonmark

- Neither format has the concept of formal table or figure captions, but you'll need one
- Images are the `InlineImage`  element

## Types of dynamic content

- R code
- MathJax
- References


## Design considerations

- When the google doc changes from the source in a way that you can't understand (e.g. an image changes, or some other output from code), then you should flag this with a comment in the markdown when it comes back, so that the user can make some kind of adjustment to the code.

