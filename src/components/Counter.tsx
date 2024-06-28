interface CounterProps {
  count: () => number;
  setCount: (count: number) => void;
}

export default function Counter(props: CounterProps) {
  return (
    <button
      class="w-[200px] rounded-full bg-gray-100 border-2 border-gray-300 focus:border-gray-400 active:border-gray-400 px-[2rem] py-[1rem]" 
      onClick={() => props.setCount(props.count() + 1)}
    >
      Clicks: {props.count()}
    </button>
  );
}