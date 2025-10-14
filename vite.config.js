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
  build: {
    // output into DirectAdmin document root build folder
    outDir: 'public/build',
    // don't wipe other files that may be in public_html
    emptyOutDir: false,
  },
  // base path used in manifest and generated URLs (serving from /build/)
  base: '/build/',
});
