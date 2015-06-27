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

    robot.respond /archive (.+)/i, (msg) ->
        data = "url=#{encodeURIComponent(msg.match[1])}"
        msg.http(ARCHIVE_TODAY_SUBMIT_URL)
            .header("content-type", "application/x-www-form-urlencoded")
            .post(data) (err, res, body) ->
                robot.logger.debug body

                if err or body.match(PATTERNS.NOT_FOUND)
                    return msg.reply "#{msg.match[1]} is not a valid URL."

                links = body.match PATTERNS.FOUND
                msg.reply links[0]
