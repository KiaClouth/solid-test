import { A } from "@solidjs/router";
import { genUUID } from "electric-sql/util";
import { generateRandomName } from "~/utils";
import { createEffect, createSignal, onMount } from "solid-js";
import { LIB_VERSION } from "electric-sql/version";
import { uniqueTabId } from "electric-sql/util";
import { insecureAuthToken } from "electric-sql/auth";
import { electrify } from "electric-sql/pglite";
import { PGlite } from "@electric-sql/pglite";
import { Electric, schema } from "~/generated/client";

export default function Home() {
  const [electric, setElectric] = createSignal<Electric>();
  const [users, setUsers] = createSignal<Array<object>>();

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
    electric.db.User.sync();
    setElectric(electric);
  });

  createEffect(async () => {
    const result = await electric()?.db.User.findMany();
    setUsers(result);
  });

  return (
    <main class="text-gray-700 mx-auto p-4 text-center flex flex-col items-center gap-4">
      <button
        class="bg-gray-100 border-gray-300 focus:border-gray-400 active:border-gray-400 w-[200px] rounded-full border-2 px-[2rem] py-[1rem]"
        onClick={async () => {
          await electric()?.db.User.create({
            data: { id: genUUID(), name: generateRandomName(), userRole: "ADMIN" },
          });
          electric()?.db.User.sync();
        }}
      >
        Clicks
      </button>
      <div class="flex max-w-2xl flex-wrap gap-4 bg-brand-color-1st p-4">{users()?.map((user: any) => <p>{user?.name}</p>)}</div>

      <p class="mt-8">
        Visit{" "}
        <a href="https://solidjs.com" target="_blank" class="text-sky-600 hover:underline">
          solidjs.com
        </a>{" "}
        to learn how to build Solid apps.
      </p>
      <p class="my-4">
        <span>Home</span>
        {" - "}
        <A href="/about" class="text-sky-600 hover:underline">
          About Page
        </A>{" "}
      </p>
    </main>
  );
}
