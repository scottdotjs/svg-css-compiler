# SVG to CSS compiler

A simplistic tool to take SVG files and compile them into a CSS file as classes that use `data:` URIs for background images.

This is the first revision and doesn't have options or anything nice yet. I wrote it to use with [Lipis' country flags](https://flagicons.lipis.dev/) so
it's still geared to that use.

It looks in a directory (currently `input`) for files with the names (not including `.svg`) that you specify in the array `@file_names`. The resulting file will be `output/compiled.css` with classes that look like this:

```css
    .flag-whatever {
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' ...");
        background-repeat: no-repeat;
        width: 320px;
        height: 240px;
    }
```

"whatever" in each case will be the name of each file as specified earlier. You can edit the constant `CSS_TEMPLATE` to change this - a future version of this tool will have the template externally to avoid needing to touch the code.

## Author and license

Copyright 2022 [Scott Martin](https://github.com/scottdotjs).

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.