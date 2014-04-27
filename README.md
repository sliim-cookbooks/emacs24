emacs24 Cookbook
================
Download and install GNU Emacs 24.3 from source.

Requirements
------------
#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- Debian wheezy

Attributes
----------
#### emacs24::default
* `default["emacs24"]["build_dir"]` - Where emacs archive will be extracted and builded
* `default["emacs24"]["version"]` - Emacs version to install

Usage
-----
#### emacs24::default
Just include `emacs24` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[emacs24]"
  ]
}
```

#### Tests
This cookbook contains serverspec for test-kitchen, foodcritic and knife tests.

- First, install dependencies:  
`bundle install`  

- Install cookbook dependencies  
`berks install`

- To run all tests:  
`bundle exec strainer test`

- To run integration tests:
`bundle exec kitchen test`

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sliim <sliim@mailoo.org> 

License: All rights reserved
