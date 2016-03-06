# Description
#   archive.is Public API (formerly archive.today)
#
# Configuration:
#   None
#
# Commands:
#   hubot archive <url> - Archives the contents of <url> and returns the archive.is link
#
# Notes:
#   TODO: Error checking
#   Dummy proofing
#
# Author:
#   MrSaints

ARCHIVE_TODAY_SUBMIT_URL = "https://archive.is/submit/"

module.exports = (robot) ->
    PATTERNS =
        FOUND: /https:\/\/archive.is\/.{5}/i
        NOT_FOUND: /Invalid URL:/i

    robot.respond /archive (.+)/i, id: "archive.new", (res) ->
        data = "url=#{encodeURIComponent(res.match[1])}&anyway=1"
        res.http(ARCHIVE_TODAY_SUBMIT_URL)
            .header("content-type", "application/x-www-form-urlencoded")
            .post(data) (err, httpRes, body) ->
                robot.logger.debug "hubot-archive-today: headers -> #{httpRes.headers}"
                robot.logger.debug "hubot-archive-today: body -> #{body}"

                if err or (httpRes.statusCode isnt 200 and httpRes.statusCode isnt 302)
                    res.reply "I'm unable to process your request at this time due to a server error. Please try again later."
                    return robot.logger.error "hubot-archive-today: #{err}"

                if body.match(PATTERNS.NOT_FOUND)
                    return res.reply "#{res.match[1]} is not a valid URL."

                if link = httpRes.headers.location
                    return res.reply link

                links = body.match PATTERNS.FOUND
                res.reply links[0]
