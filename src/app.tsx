"use client";
import { Router } from "@solidjs/router";
import { FileRoutes } from "@solidjs/start/router";
import { Suspense } from "solid-js";
import Nav from "~/components/Nav";
import "./app.css";

import { LIB_VERSION } from "electric-sql/version";
import { uniqueTabId } from "electric-sql/util";
import { insecureAuthToken } from "electric-sql/auth";
import { genUUID } from "electric-sql/util";
import { electrify } from "electric-sql/pglite";
import { PGlite } from "@electric-sql/pglite";
import { schema } from "./generated/client";

// Generate an insecure authentication JWT.
// See https://electric-sql.com/docs/usage/auth for more details.
export const authToken = () => {
  const subKey = "__electric_sub";
  let sub = window.sessionStorage.getItem(subKey);
  if (!sub) {
    // This is just a demo. In a real app, the user ID would
    // usually come from somewhere else :)
    sub = genUUID();
    window.sessionStorage.setItem(subKey, sub);
  }
  const claims = { sub };
  return insecureAuthToken(claims);
};

let db: PGlite;

const { tabId } = uniqueTabId();
const scopedDbName = `idb://basic-${LIB_VERSION}-${tabId}.db`;
const config = {
  url: process.env.ELECTRIC_SERVICE,
};
db ??= new PGlite(scopedDbName, {
  relaxedDurability: true,
});
// const client = await electrify(db, schema, config)
// await client.connect(authToken())

export default function App() {
  return (
    <Router
      root={(props) => (
        <>
          <Nav />
          <Suspense>{props.children}</Suspense>
        </>
      )}
    >
      <FileRoutes />
    </Router>
  );
}
