# plain-handlebars

Unmodified [Handlebars](http://handlebarsjs.com/) version 1.0.0,
packaged for Meteor.

This version doesn't have the many enhancements of Meteor's templates,
but it does run on both the client and the server.

The Handlebars variable is exported as `PlainHandlebars`.

The main entry points in the API are `compile`, `registerHelper`,
and `registerPartial`.

`compile` is described in the Handlebars documentation
[Getting Started](http://handlebarsjs.com/#getting-started) and
`registerHelper` in [Helpers](http://handlebarsjs.com/#helpers).

`registerPartial` doesn't seem to be in the Handlebars documentation,
but is described in a treehouse blog post
[Partials and
Helpers](http://blog.teamtreehouse.com/handlebars-js-part-2-partials-and-helpers).

```
var myTemplate = PlainHandlebars.compile("Hello {{name}}.");

console.log(myTemplate({name: "Alice"}));
```

For convenience, files with the `.plain` extension are parsed for
`<template name="...">...</template>` definitions, which are saved in
`PlainTemplate` and also registered as partials.

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
nor are the `rendered`, `created` etc. callbacks.

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


## Support

If you found this package helpful,
[donate](https://www.gittip.com/awwx/) to support ongoing maintenance
and development.
