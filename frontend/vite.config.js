export default defineConfig({
  server: {
    proxy: {
      '/schedules': 'http://localhost:4567'
    }
  }
});