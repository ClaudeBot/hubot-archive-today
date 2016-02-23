# hubot-archive-today

[![Build Status](https://travis-ci.org/ClaudeBot/hubot-archive-today.svg)](https://travis-ci.org/ClaudeBot/hubot-archive-today)
[![devDependency Status](https://david-dm.org/ClaudeBot/hubot-archive-today/dev-status.svg)](https://david-dm.org/ClaudeBot/hubot-archive-today#info=devDependencies)

A Hubot script for archiving the contents of a URL on [archive.today][archive] (now known as [archive.is][archive]).

See [`src/hubot-archive-today.coffee`](src/hubot-archive-today.coffee) for full documentation.


## Installation via NPM

1. Install the __hubot-archive-today__ module as a Hubot dependency by running:

    ```
    npm install --save hubot-archive-today
    ```

2. Enable the module by adding the __hubot-archive-today__ entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-archive-today"
    ]
    ```

3. Run your bot and see below for available config / commands


## Commands

Command | Listener ID | Description
--- | --- | ---
hubot archive `url` | `archive.new` | Archives the contents of `url` and returns the archive.is link


## Sample Interaction

```
user1>> hubot archive https://www.google.com/
hubot>> user1: https://archive.is/baTKw
```


[archive]: http://archive.is/