# Resume
My professional resume.

# Table Of Contents
- [Overview](#overview)
- [Setup](#setup)
- [Spell Check](#spell-check)
- [Building](#building)

# Overview
My resume is written in LaTeX. To view it it must be setup and built.  

Certain personal information is not checked into this repository. It must be 
provided before my resume can be built. See the [Setup](#setup) section for more 
details.  

Once personal contact information has been provided the `.tex` file must be 
transformed into a more viewable format. See the [Building](#building) section 
for more information.

This repository also provides some additional spell check related make targets. 
Be sure to learn how to use these in the [Spell Check](#spell-check) section.

# Setup
My mailing address and phone number are not checked into this repository. This 
was done to prevent bots from crawling this repository and adding me to spam 
lists.  

This information must be provided in a gitignored `privateContact.tex` at build 
time. To do so simply make a copy of `privateContact.example.tex` named 
`privateContact.text`. Then fill in the private contact information.  

This information will appear just below my name in the header.

# Spell Check
Spelling is very important in a resume. This repository provides a couple make 
targets to assist in the task of spell checking.  

To run a spell check on the resume, and any markdown files run the `spell` make 
target:

```bash
$ make spell
```

To check just the resume's spelling run the `spell-resume.tex` target:

```bash
$ make spell-resume.tex
```

This target will ignore certain technical words that appear in the resume, but 
are not official English words.  

To check just the markdown files in this repository for spelling run the 
`spell-md` make target:

```
$ make spell-md
```

# Building
The `resume.tex` file must be transformed into a more universal format which we 
can then view.

To run the transformation process and view the result, run the `resume` make 
target:  

```bash
$ make resume
$ # Or just `make`, b/c `resume` is the default target
```

This target will run the `resume.dvi` target as a pre-requisite. And then view 
the resulting `resume.dvi` file with xdvi in the `resume` target.

