import { genUUID } from "electric-sql/util";
import { generateRandomName } from "~/utils";
import {
  createContext,
  createEffect,
  createResource,
  createSignal,
  ErrorBoundary,
  For,
  Match,
  onMount,
  Show,
  Switch,
  useContext,
} from "solid-js";
import { LIB_VERSION } from "electric-sql/version";
import { uniqueTabId } from "electric-sql/util";
import { insecureAuthToken } from "electric-sql/auth";
import { electrify } from "electric-sql/pglite";
import { PGlite } from "@electric-sql/pglite";
import { Electric, schema } from "~/generated/client";
import { createDerivedQuery } from "~/lib/createLiveQuery";

export default function Home() {
  return (
    <main class="text-gray-700 mx-auto flex flex-col items-center gap-4 p-4 text-center">
    </main>
  );
}
