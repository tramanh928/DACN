import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  plugins: [
    laravel({
      // you can keep a single entry or add more if needed:
      input: 'resources/js/app.js',
      refresh: true,
    }),
    vue({
      template: {
        transformAssetUrls: {
          base: null,
          includeAbsolute: false,
        },
      },
    }),
  ],
  /*server: {
  host: true, // binds to 0.0.0.0
  port: 5173,
  strictPort: true,
  cors: true,
  https: true,
  hmr: {
     host: 'buimaitramanh.id.vn', // must resolve to your dev machine (hosts/DNS)
     protocol: 'ws'
  }
  },*/
  build: {
    // output into DirectAdmin document root build folder
    outDir: 'public/build',
    // don't wipe other files that may be in public_html
    emptyOutDir: false,
  },
  // base path used in manifest and generated URLs (serving from /build/)
  base: '/build/',
});
