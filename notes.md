# Notes

- You should test and record what the upload a new version type behaviour is like with the Drive API. E.g. does it overwrite comments on sections which are not affected? If not, then this could be really useful.

- You should probably harvest that code in the driver package which could be a good way to drag things like span objects off re-imported-html.

- Take a look at how difficult it would be to write a json -> gdoc transformer. There can only be so many parts to write!

- There can only be so many actions when converting: Add, remove, or alter. Adding and removing should be pretty easy, altering can be done with find/replace text (if text within a para.)

- The tricky part is adding -- for each type of object in markdown / a google doc, you'll need to come up with some way to convert between the two. The markdown part will be handed by the pandoc AST translation.

