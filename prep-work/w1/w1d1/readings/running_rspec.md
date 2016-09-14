# Running Rspec Tests

No need to look at any code yet; let's just run some tests and see what
happens!

First, navigate to the `exercises` directory in your terminal and run
the command `bundle exec rspec`. By using `bundle exec`, we tell Bundler
to run the version of rspec specified in the Gemfile. The `rspec` command
will run ALL of the spec files in the project directory.

If you got the error `bundle: command not found`, make sure you installed
rspec as specified in the [previous reading][rspec].

[rspec]: ./installing_rspec

Otherwise, you should see a whole mess of errors. Ew. Don't even bother
scrolling through them.

Instead, go ahead and run `bundle exec rspec spec/00_hello_spec.rb`. This
will only run the specified spec file; there should just be three errors
this time. We can deal with that!

### Watching Things Fail

Let's take a look at the terminal output. At the bottom, you should see
something like this:

```
Finished in 0.00186 seconds (files took 0.14132 seconds to load)
3 examples, 3 failures

Failed examples:

rspec ./spec/00_hello_spec.rb:4 # the hello function says hello
rspec ./spec/00_hello_spec.rb:10 # the greet function says hello to someone
rspec ./spec/00_hello_spec.rb:14 # the greet function says hello to someone else
```

This is a summary of the rspec tests. We can see that there were three tests,
and we failed all of them. At the bottom, it specifies which tests we failed.
This is a nice overview, but if you want to see what actually went wrong, you'll
have to scroll to the top. You should see this error:

```
1) the hello function says hello
     Failure/Error: expect(hello).to eq("Hello!")

       expected: "Hello!"
            got: "oh hey there"

       (compared using ==)
     # ./spec/00_hello_spec.rb:5:in `block (2 levels) in <top (required)>'
```

So, what can we tell from this error message?

0. We wanted the `hello` function to say hello.
0. Specifically, we expected it to return the string `"Hello!"`
0. It actually returned `"oh hey there"`, giving us a failure
0. The test itself can be found in the `00_hello_spec.rb` file on line 5

Open up `lib/00_hello.rb`; this is where you'll be writing your code.
Go ahead and fix up the code with the correct return value, then run
the specs again. You shouldn't be getting that error message any more!
Hopefully, you'll have something like this now:

```
Finished in 0.00187 seconds (files took 0.13949 seconds to load)
3 examples, 2 failures

Failed examples:

rspec ./spec/00_hello_spec.rb:10 # the greet function says hello to someone
rspec ./spec/00_hello_spec.rb:14 # the greet function says hello to someone else
```

Feels good, yeah?

Let's move on to the next specs: Looks like we have two specs for the `greet`
function that aren't passing. Take a look at the first error; you should see
something like this:

```
1) the greet function says hello to someone
   Failure/Error: expect(greet("Alice")).to eq("Hello, Alice!")
   NameError:
     undefined local variable or method 'soneone' for #<RSpec::ExampleGroups::TheGreetFunction:0x0055f86f38ec90>
   # ./lib/00_hello.rb:11:in `greet'
   # ./spec/00_hello_spec.rb:11:in `block (2 levels) in <top (required)>'
```

First up, let's look at those bottom two lines. They're what we call
the "stack trace," all of the method calls that led up to our error. The
topmost is where the error was encountered; it tells us exactly which
line caused the error. The line below it is where that method was called
from, and so forth. When dealing with complicated methods, this helps us
pinpoint our error and trace back to where it originated.

In this case, what was that error?
`undefined local variable or method 'soneone'`.
This means we made a reference to something that doesn't actually exist.
This is an incredibly common error. Here, it was a typo; other times,
you'll forget to rename variables, or reference methods you haven't
written yet.

Fix that typo, and run the spec again. Do you see success?

```
the hello function
  says hello

the greet function
  says hello to someone
  says hello to someone else

Finished in 0.00113 seconds (files took 0.07916 seconds to load)
3 examples, 0 failures
```

Great work! Things will get harder from here on out, but you should
understand how to work with rspec now. Here are some useful commands
for reference:

### RSpec Commands

All these commands should be run from the `exercises` folder, or
whatever your current project directory is.

You'll most often want to run a single spec file. Just pass in the file name:

```
~$ bundle exec rspec spec/00_hello_spec.rb
```

Sometimes it's useful to run just a single test, or a subgroup of tests.
This is often the case when working with long, slow spec files.
To do so, you can append the line number to the filename argument. The
following code will run both tests within the `describe "the greet function"`
block in the spec file:

```
~$ bundle exec rspec spec/00_hello_spec.rb:9
```

To run all the specs for a day:

```
~$ bundle exec rspec
```
