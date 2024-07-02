import { defineConfig } from "@solidjs/start/config";

export default defineConfig({
    vite: {
        envPrefix: 'ELECTRIC_',
        optimizeDeps: {
            exclude: ["@electric-sql/pglite"]
        },
    }
});
