# Description
#   Archive.today Public API
#
# Configuration:
#   None
#
# Commands:
#   hubot archive <url> - Archives the contents of <url> and returns the Archive.today link
#
# Notes:
#   TODO: Error checking
#   Dummy proofing
#
# Author:
#   MrSaints

ARCHIVE_TODAY_SUBMIT_URL = "https://archive.today/submit/"

module.exports = (robot) ->
    PATTERNS =
        FOUND: /https:\/\/archive.is\/.{5}/i
        NOT_FOUND: /Invalid URL:/i

    robot.respond /archive (.+)/i, id: "archive.new", (res) ->
        data = "url=#{encodeURIComponent(res.match[1])}&anyway=1"
        res.http(ARCHIVE_TODAY_SUBMIT_URL)
            .header("content-type", "application/x-www-form-urlencoded")
            .post(data) (err, httpRes, body) ->
                robot.logger.debug "hubot-archive-today: #{body}"

                if err or httpRes.statusCode isnt 200
                    res.reply "I'm unable to process your request at this time due to a server error. Please try again later."
                    return robot.logger.error "hubot-archive-today: #{err}"

                if body.match(PATTERNS.NOT_FOUND)
                    return res.reply "#{res.match[1]} is not a valid URL."

                links = body.match PATTERNS.FOUND
                res.reply links[0]
