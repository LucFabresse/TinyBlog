# TinyBlog

## How to load

Lastest version:

```Smalltalk
Metacello new
   baseline:'TinyBlog';
   repository: 'github://LucFabresse/TinyBlog:master/src';
   onConflict: [ :ex | ex useLoaded ];
   load
```

Chapter 2 solution:

```Smalltalk
Metacello new
   baseline:'TinyBlog';
   repository: 'github://LucFabresse/TinyBlog:chapter2/src';
   onConflict: [ :ex | ex useLoaded ];   
   load
```
