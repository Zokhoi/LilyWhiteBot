/*
* Restart 
*
* command: '!restart', '!stop'
* operators: [
*     'qq/123456',
*     'irc/operator'
* ]
*/

'use strict';

const format = require('string-format');

module.exports = (pluginManager, options) => {
    const bridge = pluginManager.plugins.transport;

    let command = options.command || '!restart';

    bridge.addCommand(command, (context) => {
      if (options.operators.includes(context.from_uid)) {
        context.reply("開始重新啟動");
        process.exit();
      } else {
        context.reply("您沒有操作員權限");
      }
    }, options);
};
