# hubot-archive-today

A Hubot script for archiving the contents of a URL on Archive.today.

See [`src/hubot-archive-today.coffee`](src/hubot-archive-today.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-archive-today --save`

Then add **hubot-archive-today** to your `external-scripts.json`:

```json
[
  "hubot-archive-today"
]
```

## Sample Interaction

```
user1>> hubot archive https://www.google.com/
hubot>> https://archive.today/baTKw
```
