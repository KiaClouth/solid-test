import { useLocation } from "@solidjs/router";

export default function Nav() {
  const location = useLocation();
  const active = (path: string) =>
    path == location.pathname ? " bg-brand-color-1st" : "border-transparent hover:border-sky-600";
  return (
    <nav class=" bg-brand-color-1st">
      <ul class="container flex items-center p-3 text-gray-200">
        <li class={`border-b-2 ${active("/")} mx-1.5 sm:mx-6`}>
          <a href="/">Home</a>
        </li>
        <li class={`border-b-2 ${active("/about")} mx-1.5 sm:mx-6`}>
          <a href="/about">About</a>
        </li>
        <li class={`border-b-2 ${active("/electric")} mx-1.5 sm:mx-6`}>
          <a href="/electric">Electric</a>
        </li>
      </ul>
    </nav>
  );
}
