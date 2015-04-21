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
    robot.respond /archive (.+)/i, (msg) ->
        data = "url=#{msg.match[1]}"
        msg.http(ARCHIVE_TODAY_SUBMIT_URL)
            .header("content-type", "application/x-www-form-urlencoded")
            .post(data) (err, res, body) ->
                robot.logger.debug body

                if err or body.match(/Invalid URL:/i)
                    return msg.reply "#{msg.match[1]} is not a valid URL."

                links = body.match /https:\/\/archive.today\/.{5}/i
                msg.reply links[0]
