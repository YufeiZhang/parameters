# Parameters

* http://parameters.rubyforge.org/
* http://github.com/postmodern/parameters/
* Postmodern (postmodern.mod3 at gmail.com)

## Description

Parameters allows you to add annotated variables to your classes which may
have configurable default values.

## Features

* Give parameters default values.
  * Default values maybe either objects or lambdas used to generate the
    default value.
* Change default values of parameters.
* Give descriptions to parameters.
* Set parameters en-mass.
* Parse strings of the form `name=value` into a Hash of parameters.

## Examples

    class Octagon
  
      include Parameters
  
      parameter :x, :default => 0
  
      parameter :y, :default => 0.5
  
      parameter :radius, :description => 'The radius of the Octagon'

      parameter :opacity,
                :default => lambda { rand },
                :description => 'The opacity of the Octagon'
  
    end
  
    # Create an object with default values for all parameters
    oct = Octagon.new
    oct.x # => 0
    oct.y # => 0.5
    oct.opacity # => 0.25
  
    # Create an object with the given parameter values.
    oct = Octagon.new(:radius => 10)
    oct.radius # => 10
    oct.opacity # => 0.7
  
    # Set parameter values of a class
    Octagon.radius = 33
    Octagon.opacity = 0.3
  
    # Create an object with parameter defaulte values inherited from the
    # class parameters
    oct = Octagon.new
    oct.radius # => 33
    oct.opacity # => 0.3

    # Parse user given name=value parameter strings
    oct.params = Parameters::Parser.parse(ARGV)

## Install

    $ sudo gem install parameters

## License

(The MIT License)

Copyright (c) 2008-2010 Hal Brodigan

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
