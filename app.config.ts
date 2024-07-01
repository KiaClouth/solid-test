import { defineConfig } from "@solidjs/start/config";

export default defineConfig({
    vite: {
        optimizeDeps: {
            exclude: ["@electric-sql/pglite"]
        }
    }
});
