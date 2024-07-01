"use client";
import { Router } from "@solidjs/router";
import { FileRoutes } from "@solidjs/start/router";
import { Suspense, onMount } from "solid-js";
import Nav from "~/components/Nav";
import "./app.css";

import { LIB_VERSION } from "electric-sql/version";
import { uniqueTabId } from "electric-sql/util";
import { insecureAuthToken } from "electric-sql/auth";
import { genUUID } from "electric-sql/util";
import { ElectricDatabase, electrify } from 'electric-sql/wa-sqlite'
// import { electrify } from "electric-sql/pglite";
// import { PGlite } from "@electric-sql/pglite";
import { schema } from "./generated/client";


export default function App() {
  onMount(async () => {
    const authToken = () => {
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

    const { tabId } = uniqueTabId();
    const scopedDbName = `idb://basic-${LIB_VERSION}-${tabId}.db`;
    const config = {
      debug: import.meta.env.DEV,
      url: import.meta.env.ELECTRIC_SERVICE,
    }
    // const conn = new PGlite(scopedDbName, {
    //   relaxedDurability: true,
    // });
    const conn = await ElectricDatabase.init(scopedDbName)
    const db = await electrify(conn, schema, config);
    await db.connect(authToken());

    console.log("Connected to database", conn, db);
  });

  return (
    <Router
      root={(props) => (
        <>
          <Nav />
          {<Suspense>{props.children}</Suspense>}
        </>
      )}
    >
      <FileRoutes />
    </Router>
  );
}
