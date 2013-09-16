# plain-handlebars

Unmodified [Handlebars](http://handlebarsjs.com/) version 1.0.0,
packaged for Meteor.

This version doesn't have the many enhancements of Meteor's templates,
but it does run on both the client and the server.


## Version

1.0.0.2  (Handlebars version 1.0.0, this packaging release 2).

This package works with Meteor 0.6.5 and above only.


## API

The Handlebars variable as described in the [Handlebars
documentation](http://handlebarsjs.com/) is exported as
`PlainHandlebars`, and is available on both the client and the server.

This is completely separate from the `Handlebars` variable that Meteor
exports on the client.  (The two versions don't share helpers or
templates, for example).

The main entry points in the API are `compile`, `registerHelper`,
and `registerPartial`.

`compile` is described in the Handlebars documentation
[Getting Started](http://handlebarsjs.com/#getting-started), and
`registerHelper` is described in
[Helpers](http://handlebarsjs.com/#helpers).

`registerPartial` doesn't seem to be in the Handlebars documentation,
but is described in a treehouse blog post
[Partials and
Helpers](http://blog.teamtreehouse.com/handlebars-js-part-2-partials-and-helpers).

```
var myTemplate = PlainHandlebars.compile("Hello {{name}}.");

console.log(myTemplate({name: "Alice"}));
```

## Template Definitions

Files with the `.plain` extension are parsed for
`<template name="...">...</template>` definitions, which are saved by
name in `PlainTemplate` and also registered as partials (so that they
can be referenced using the `{{> subtemplateName}}` notation).

However, while Meteor automatically loads `.html` files first,
`.plain` files are **not** automatically loaded before code files.
Instead, they follow the load order as described in [Structuring Your
App](http://docs.meteor.com/#structuringyourapp).  Thus, for your code
to see a template in `PlainTemplate`, you need to either get the
`.plain` file loaded first (such as by putting it in the `lib`
directory), or use `Meteor.startup`.

Also note that adding a helper to a template won't work, as that's a
Meteor extension: helpers can only be defined globally using
`PlainTemplate.registerHelper`.  There are also no template instances,
nor are there the `rendered`, `created` etc. callbacks.

```
<template name="greetings">
  {{> hello}}
  Welcome.
</template>

<template name="hello">
  Hello {{name}}.
</template>
```

```
console.log(PlainTemplate.greetings({name: "Bob"}));
```


## Donate

An easy and effective way to support the continued maintenance of this
package and the development of new and useful packages is to [donate
through Gittip](https://www.gittip.com/awwx/).

Gittip is a [platform for sustainable
crowd-funding](https://www.gittip.com/about/faq.html).

Help build an ecosystem of well maintained, quality Meteor packages by
joining the
[Gittip Meteor Community](https://www.gittip.com/for/meteor/).


## Hire

Need support, debugging, or development for your project?  You can
[hire me](http://awwx.ws/hire-me) to help out.
