"use client";
import { Router } from "@solidjs/router";
import { FileRoutes } from "@solidjs/start/router";
import { Component, Show, Suspense, createContext, createEffect, createResource, createSignal, onMount, useContext } from "solid-js";
import Nav from "~/components/Nav";
import "./app.css";

import { LIB_VERSION } from "electric-sql/version";
import { uniqueTabId } from "electric-sql/util";
import { insecureAuthToken } from "electric-sql/auth";
import { genUUID } from "electric-sql/util";
import { electrify } from "electric-sql/pglite";
import { PGlite } from "@electric-sql/pglite";
import { Electric, schema } from "./generated/client";
import { createDerivedQuery, createLiveQuery } from "./lib/createLiveQuery";

export default function App() {
  const [electric, setElectric] = createSignal<Electric | undefined>();
  onMount(async () => {
    const authToken = () => {
      const subKey = "__electric_sub";
      let sub = window.sessionStorage.getItem(subKey);
      if (!sub) {
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
    };
    const conn = new PGlite(scopedDbName, {
      relaxedDurability: true,
    });
    const electric = await electrify(conn, schema, config);
    await electric.connect(authToken());
    setElectric(electric);
    // console.log(await electric.db.User.create({ data: { id: "test", name: "test", userRole: "ADMIN" } }));
  });

  createEffect(async () => {
    console.log(await electric()?.db.User.findMany({
      where: { name: "test" },
    }));
  });

  return (
    <Router
      root={(props) => (
        <>
          <Nav />
          <Suspense>...</Suspense>
        </>
      )}
    >
      <FileRoutes />
    </Router>
  );
}
