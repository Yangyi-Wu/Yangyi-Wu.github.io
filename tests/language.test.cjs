const { test } = require('node:test');
const assert = require('node:assert/strict');
const vm = require('node:vm');
const fs = require('node:fs');
const code = fs.readFileSync('assets/js/language.js', 'utf8');

function run(options = {}) {
  const config = { path: '/', alternate: '/zh/', lang: 'en', languages: ['en-US'], ...options };
  const result = { redirects: [], saved: [], listeners: {}, cleaned: [] };
  const localStorage = {
    getItem() { if (config.noStorage) throw Error('blocked'); return config.saved; },
    setItem(key, value) { if (config.noStorage) throw Error('blocked'); result.saved.push(value); }
  };
  vm.runInNewContext(code, {
    URL, URLSearchParams, localStorage,
    history: { replaceState(a, b, url) { result.cleaned.push(url); } },
    window: { location: { pathname: config.path, search: config.search || '', hash: '#section', origin: 'https://example.com', replace(url) { result.redirects.push(url); } } },
    navigator: { languages: config.languages, language: config.languages[0] },
    document: {
      documentElement: { lang: config.lang, dataset: { alternateUrl: config.alternate, siteHome: config.home === false ? 'false' : 'true' } },
      addEventListener(event, handler) { result.listeners[event] = handler; }
    }
  });
  return result;
}

test('respects browser language order', () => {
  assert.deepEqual(run({ languages: ['en-US', 'zh-CN'] }).redirects, []);
  assert.deepEqual(run({ languages: ['zh-CN', 'en-US'] }).redirects, ['https://example.com/zh/#section']);
  assert.equal(run({ languages: ['fr', 'zh-TW', 'en'] }).redirects.length, 1);
});
test('manual preference overrides the browser only on default home', () => {
  assert.equal(run({ saved: 'en', languages: ['zh'] }).redirects.length, 0);
  assert.equal(run({ saved: 'zh' }).redirects.length, 1);
  assert.equal(run({ saved: 'zh', home: false, path: '/publications/' }).redirects.length, 0);
  assert.equal(run({ lang: 'zh', saved: 'en', path: '/zh/', alternate: '/' }).redirects.length, 0);
});
test('storage failure does not prevent language detection or manual navigation', () => {
  const state = run({ noStorage: true, languages: ['zh'] });
  assert.equal(state.redirects.length, 1);
  assert.doesNotThrow(() => state.listeners.click({ target: { closest: () => ({ dataset: { languageOption: 'en' } }) } }));
});
test('legacy query resolves to the translated page and preserves other params and hash', () => {
  const state = run({ path: '/publication/example', alternate: '/zh/publication/example', home: false, search: '?lang=zh&utm_source=test' });
  assert.deepEqual(state.redirects, ['https://example.com/zh/publication/example?utm_source=test#section']);
  assert.deepEqual(state.saved, ['zh']);
});
test('same-language legacy URL is cleaned without reload', () => {
  const state = run({ search: '?lang=en&ref=1' });
  assert.deepEqual(state.cleaned, ['/?ref=1#section']);
  assert.equal(state.redirects.length, 0);
});
test('language links save choices; base paths are retained', () => {
  const state = run({ alternate: '/project/zh/', languages: ['zh'] });
  assert.deepEqual(state.redirects, ['https://example.com/project/zh/#section']);
  state.listeners.click({ target: { closest: () => ({ dataset: { languageOption: 'en' } }) } });
  assert.deepEqual(state.saved, ['en']);
});
