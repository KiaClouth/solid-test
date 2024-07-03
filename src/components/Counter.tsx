import { setStore, store } from "~/store";

interface CounterProps {
  count: () => number;
  setCount: (count: number) => void;
}

export default function Counter() {
  return (
    <button
      class="bg-gray-100 border-gray-300 focus:border-gray-400 active:border-gray-400 w-[200px] rounded-full border-2 px-[2rem] py-[1rem]"
      onClick={() =>
        setStore("index", {
          testCount: store.index.testCount + 1,
        })
      }
    >
      Clicks: {store.index.testCount}
    </button>
  );
}
