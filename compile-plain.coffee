templateRegex = ///
  < \s* template \s+ name \s* = \s* \" ([^"]*) \" \s* >
    ([\u0000-\uffff]*?)
  < \s* / \s* template \s* >
  ([\u0000-\uffff]*)
///


handler = (compileStep) ->
  source = compileStep.read().toString('utf8')
  outputFile = compileStep.inputPath + ".js"

  output = "\n"

  loop
    match = source.match(templateRegex)
    break unless match?
    [x, templateName, contents, rest] = match
    output += """
      PlainTemplate[#{JSON.stringify(templateName)}] =
        PlainHandlebars.compile(#{JSON.stringify(contents)});

      PlainHandlebars.registerPartial(
        #{JSON.stringify(templateName)},
        PlainTemplate[#{JSON.stringify(templateName)}]
      );

    """
    source = rest

  compileStep.addJavaScript({
    path: outputFile,
    sourcePath: compileStep.inputPath,
    data: output
  })

  return


Plugin.registerSourceHandler("plain", handler)
