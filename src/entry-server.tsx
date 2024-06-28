// @refresh reload
import { createHandler, StartServer } from "@solidjs/start/server";

export default createHandler(() => (
  <StartServer
    document={({ assets, children, scripts }) => (
      <html lang="zh-CN">
        <head>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1" />
          <link rel="icon" href="/icons/256.ico" />
          {assets}
        </head>
        <body class="light">
          <div id="app">{children}</div>
          {scripts}
        </body>
      </html>
    )}
  />
));
