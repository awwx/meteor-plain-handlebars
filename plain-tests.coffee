Tinytest.add "plain-handlebars", (test) ->
  test.equal(
    PlainTemplate.greetings({name: "Bob"}),
    "Hello Bob. Welcome."
  )
