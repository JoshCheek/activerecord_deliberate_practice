ActiveRecord Deliberate Practice
================================

ActiveRecord is a foundational part of most Rails apps, so in order to be professional Rails developers,
we need to hone our knowledge and ability with it. To do this, we'll practice it, focusing deliberately
on small parts of its functionality, with the explicit intent of improving within that limited domain.

This allows us to make the most progress with the least amount of effort.
Deliberate practice [1](http://calnewport.com/blog/2010/01/06/the-grandmaster-in-the-corner-office-what-the-study-of-chess-experts-teaches-us-about-building-a-remarkable-life/),
[2](http://calnewport.com/blog/2010/01/06/the-grandmaster-in-the-corner-office-what-the-study-of-chess-experts-teaches-us-about-building-a-remarkable-life/)
is shockingly more effective than all other forms of practice.


Setup:
------

Get the dependencies:

```
$ bundle install
```

Run the tests in orer:

```
$ bundle exec mrspec 1_migrations_create_table.rb

# and once that passes:
$ bundle exec mrspec 2_migrations_change_table.rb
```


First Pass
----------

**Your goal is to learn these well enough to perform this again, without reference.**

Take your time, think it through, try to see how one piece is similar to other pieces,
the naming, the formatting, etc.
You are trying to soak in the patterns and internalize the knowledge.

Checkout a branch names `first_pass`

```
$ git checkout -b first_pass
```

Find the section "Your work goes here!", that's where you're going to
put your code.

Read the description of what you need to do, look at the example to see
one that is similar. Then write your code there so that it meets the requirements.

You may need to follow the references, you may not.
Either way, try guessing at what
you think it might be before you try to look them up.

As you get them solved, commit your solution.
If you get stuck on one for very long, skip that test and move to the next one.


Second Pass
-----------

**Your goal is to solidify your knowledge and correct any errors**

Make sure your work in `first_pass` is committed.
Then make a `second_pass` branch off of master.

```
$ git checkout master
$ git checkout -b second_pass
```

Now go through them again.
Take your time again, think it through, only look at the example and other references after you try a guess that doesn't work.
Only try a guess after trying to recall the correct way.

#### Pay attention immediately after you make a mistake

> Most of us are allergic to mistakes. When we make one, our every instinct urges us to look away, ignore it, and pretend it didn’t happen. This is not good, because as we’ve seen, mistakes are our guideposts for improvement. Brain-scan studies reveal a vital instant, 0.25 seconds after a mistake is made, in which people do one of two things—they look hard at the mistake or they ignore it. People who pay deeper attention to an error learn significantly more than those who ignore it.
Develop the habit of attending to your errors right away. Don’t wince, don’t close your eyes; look straight at them and see what really happened, and ask yourself what you can do next to improve. Take mistakes seriously, but never personally.
>
> -- The Little Book of Talent #22

**After getting past one that you have to look up, or that you guess incorrectly**,
stop, erase the solution, and try to immediately perform it again, but correctly this time.
Do that until you can do it correctly, then undo 2 more steps, solve your way through them,
and solve the difficult challenge correctly again. Do not move past this until you can do it correctly.


Third Pass
----------

**Your goal is to optimize the knowledge in your brain by doing these as quickly as possible with no errors and no references**

When you get to one that you struggled on in the second pass, slow down and make sure you get it right.
If you get it wrong, peform the same correcting behaviour you did in the second pass.

Do this in a branch named `third_pass`, the process to do this will be the same as switching from `first_pass` to `second_pass`.


Fourth through x passes
-----------------------

These are all the same as the third pass. You are finished when you can get completely through a pass in a single sitting,
without error and without referencing the example or anything else. Cache this knowledge in your brain.


If you want to be shockingly good:
----------------------------------

* Delete the bodies of all the tests, and rewrite them using the same iterative strategy as you did for the code they were testing.
* Write your own examples of these things that mimics the ones provided here.

There is no such thing as natural talent, there is just deliberate practice.
I was shockingly bad at all of this, I just kept practiced my way to competence.
