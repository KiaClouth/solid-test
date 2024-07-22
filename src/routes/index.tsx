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

const ElectricContext = createContext<Electric>();

const useElectric = () => useContext(ElectricContext);

const PeopleView = () => {
  const { db, notifier } = useElectric()!;

  // people() is a signal for all the people in the table, ordered by order() and filtered by search()
  const [order, setOrder] = createSignal<"asc" | "desc">("asc");
  const [search, setSearch] = createSignal("");
  let people = createDerivedQuery(notifier, () =>
    db.User.liveMany({
      orderBy: { name: order() },
      where: { name: { contains: search() } },
    }),
  );

  // createEffect(() => console.log(people()))

  const [person, setPerson] = createSignal<string>("");

  const newRow = () => {
    db.User.create({
      data: {
        id: genUUID(),
        name: generateRandomName(),
        userRole: "ADMIN",
      },
    });
  };

  const clear = () => {
    db.User.deleteMany();
  };

  const change = () =>
    db.User.findFirst().then((p) => p && db.User.update({ where: { id: p.id }, data: { userRole: "ADMIN" } }));

  let inputRef: HTMLInputElement;
  let dialogRef: HTMLDialogElement;

  createEffect(() => (person() ? dialogRef?.showModal() : dialogRef?.close()));

  return (
    <div class="m-auto flex max-w-screen-sm flex-col gap-2 p-1">
      <div class="flex justify-between text-sm">
        <div class="flex w-48 gap-2">
          <button onClick={newRow}>add</button>
          <button onClick={clear}>clear</button>
          <button onClick={change}>chnage</button>
        </div>
        <div class="flex gap-2 ">
          <button classList={{ underline: order() === "asc" }} onClick={() => setOrder(() => "asc")}>
            Ascending
          </button>
          <button classList={{ underline: order() === "desc" }} onClick={() => setOrder(() => "desc")}>
            Descending
          </button>
        </div>
        <input
          class="rounded p-1"
          ref={inputRef!}
          type="text"
          placeholder="Search"
          onInput={() => setSearch(inputRef.value)}
        ></input>
      </div>
      <ErrorBoundary fallback={() => <div>error!</div>}>
        <Show when={people.value}>
          <For each={people.value}>
            {(item) => (
              <div class="flex justify-between rounded border p-1" onClick={() => setPerson(item.id)}>
                <div class="">{item.name}</div>
              </div>
            )}
          </For>
          <Show when={person() !== ""}>
            <dialog ref={dialogRef!} onClick={() => setPerson("")} class="rounded border p-4">
              <div onClick={(e) => e.stopPropagation()}>{/* <PersonView id={person()} /> */}</div>
            </dialog>
          </Show>
        </Show>
      </ErrorBoundary>
    </div>
  );
};

const ElectricApp = () => {
  const [state, setState] = createSignal(0);
  const views = ["People", "Clubs"];

  return (
    <>
      <div class="flex justify-center gap-2 p-2">
        <For each={views}>
          {(item, index) => (
            <button class="text-lg" classList={{ underline: state() === index() }} onClick={() => setState(index())}>
              {item}
            </button>
          )}
        </For>
      </div>
      <Switch>
        <Match when={state() === 0}>
          <PeopleView />
        </Match>
      </Switch>
    </>
  );
};

export default function Home() {
  const [electric, setElectric] = createSignal<Electric>();

  onMount(async () => {
    console.log("electric init");
    const { tabId } = uniqueTabId();
    const scopedDbName = `idb://basic-${LIB_VERSION}-${tabId}.db`;
    const config = {
      debug: import.meta.env.DEV,
      url: import.meta.env.ELECTRIC_URL,
    };
    const conn = new PGlite(scopedDbName, {
      relaxedDurability: true,
    });
    const electric = await electrify(conn, schema, config);
    await electric.connect(authToken());
    electric.db.User.sync();
    setElectric(electric);
  });

  return (
    <main class="text-gray-700 mx-auto flex flex-col items-center gap-4 p-4 text-center">
      <Show when={electric()}>
        .................................................................
        <ElectricContext.Provider value={electric()}>
          <ElectricApp />
        </ElectricContext.Provider>
      </Show>
    </main>
  );
}
