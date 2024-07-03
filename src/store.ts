import { createStore } from "solid-js/store";

const [store, setStore] = createStore({
  index: {
    testCount: 0,
  },
});
export { store, setStore };
