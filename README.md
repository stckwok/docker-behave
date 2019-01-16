Docker image for Python-based SBE/BDD tools
===


## Summary

Repository name in Docker Hub: **[stckwok/behave](https://hub.docker.com/r/stckwok/behave/)**

This repository contains Dockerized Python tools for SBE/BDD, published to the public [Docker Hub](https://hub.docker.com/) via **automated build** mechanism.


## Configuration

This docker image contains the following software stack:

- Base image: Debian Stretch + [Python 3](https://hub.docker.com/_/python/).

- [Behave](https://pypi.python.org/pypi/behave): behavior-driven development, Python style.

- [Selenium WebDriver](http://www.seleniumhq.org/projects/webdriver/): a suite of tools to automate web browsers across many platforms.

- Selenium wrapper for Python:
  - [Elementium](https://github.com/actmd/elementium): jQuery-style syntactic sugar for Selenium.
  - [Capybara](https://elliterate.github.io/capybara.py/): a port of [Capybara from Ruby](https://en.wikipedia.org/wiki/Capybara_(software)).

- Other useful Python testing libraries for convenience:
  - [Mockito](http://mockito-python.readthedocs.io/en/latest/): a spying framework ported from Java.
  - [PyShould](https://github.com/drslump/pyshould): "Should"-style asserts based on [PyHamcrest](https://github.com/hamcrest/PyHamcrest).




## Usage


**Given** a `features` sub-directory as follows:

```
.
└── features
    ├── environment.py
    ├── requirements.txt
    ├── xxx.feature
    ├── yyy.feature
    └── steps
        ├── xxx_step.py
        └── yyy_step.py
```

**When** I invoke the program as follows:

```
$ docker run -it --rm -v "$(pwd):/behave:ro"  stckwok/docker-behave
```

**Then** I can see the output as follows:

```
Feature: ...
[...]
1 feature passed, 0 failed, 0 skipped
1 scenarios passed, 0 failed, 0 skipped
3 steps passed, 0 failed, 0 skipped, 0 undefined
Took 0m0.001s
```


Note: `requirements.txt` in `features` directory.


## Run 

sk1@sk1-VirtualBox:~/bdd/docker-behave/example$ ./run-test.sh 


## TODO

1. Update document
2. Flow with Jenkins



## Tutorial

*Behave*

 - [Behave tutorial](https://jenisys.github.io/behave.example/tutorials/index.html)

