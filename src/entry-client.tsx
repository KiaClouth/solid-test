// @refresh reload
import { mount, StartClient } from "@solidjs/start/client";

if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/sw.js');
}

mount(() => <StartClient />, document.getElementById("app")!);
