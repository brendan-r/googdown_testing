# TODO

- Try to get an end-to-end process going. Disregarding the JSON approach makes this easier, as there's no diffing for uploads, only downloads.

The steps:

- Document is written in .Rmd
- The AST of the remote doc (at that version) is downloaded for diffing
- A change is made to the google doc
- The AST of the new doc is downloaded
- The old and new ASTs are diffed
- The diff is somehow passed to the original md
- The diff is somehow passed to the original Rmd

For a first-step, enforce common-mark standards on the input Rmd.

The idea of diffing the remote ASTs is to preserve formatting which may not survive a round-trip, for example, formatting in-line or block code statements.



- Get the test suite written
- Allow TOC from the YAML to be expressed when creating a doc
- A data store to record the local AST, the remote AST (e.g. the location of images on google servers), the local google representation (e.g. less things like figure captions)
- Move the authentication setp into it's own function using a custom environment
- Change function prefix to GD



# DONE

- Get an account for testing set-up
- Test behaviour for updates on PUT/PATCH (no dice)