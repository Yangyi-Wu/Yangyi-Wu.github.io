const { test } = require('node:test');
const assert = require('node:assert/strict');
const vm = require('node:vm');
const fs = require('node:fs');
const code = fs.readFileSync('assets/js/language.js', 'utf8');

function run(options = {}) {
  const config = { path: '/en/', alternate: '/zh/', lang: 'en', languages: ['en-US'], ...options };
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
      documentElement: { lang: config.lang, dataset: { alternateUrl: config.alternate, languageEntry: config.entry ? 'true' : 'false', englishHome: config.englishHome || '/en/', chineseHome: config.chineseHome || '/zh/' } },
      addEventListener(event, handler) { result.listeners[event] = handler; }
    }
  });
  return result;
}

test('first visit shows chooser regardless of browser language', () => {
  for (const languages of [['en-US'], ['zh-CN'], ['fr', 'zh-TW']]) {
    assert.deepEqual(run({ entry: true, path: '/', languages }).redirects, []);
  }
});
test('saved preferences redirect only the shared entry', () => {
  assert.deepEqual(run({ entry: true, saved: 'en' }).redirects, ['https://example.com/en/#section']);
  assert.deepEqual(run({ entry: true, saved: 'zh' }).redirects, ['https://example.com/zh/#section']);
  assert.equal(run({ saved: 'zh' }).redirects.length, 0);
  assert.equal(run({ saved: 'zh', home: false, path: '/publications/' }).redirects.length, 0);
  assert.equal(run({ lang: 'zh', saved: 'en', path: '/zh/', alternate: '/' }).redirects.length, 0);
});
test('storage failure preserves the chooser and manual navigation', () => {
  const state = run({ entry: true, noStorage: true, languages: ['zh'] });
  assert.equal(state.redirects.length, 0);
  assert.doesNotThrow(() => state.listeners.click({ target: { closest: () => ({ dataset: { languageOption: 'en' } }) } }));
});
test('legacy query resolves to the translated page and preserves other params and hash', () => {
  const state = run({ path: '/publication/example', alternate: '/zh/publication/example', home: false, search: '?lang=zh&utm_source=test' });
  assert.deepEqual(state.redirects, ['https://example.com/zh/publication/example?utm_source=test#section']);
  assert.deepEqual(state.saved, ['zh']);
});
test('same-language legacy URL is cleaned without reload', () => {
  const state = run({ search: '?lang=en&ref=1' });
  assert.deepEqual(state.cleaned, ['/en/?ref=1#section']);
  assert.equal(state.redirects.length, 0);
});
test('language links save choices; base paths are retained', () => {
  const state = run({ entry: true, saved: 'zh', chineseHome: '/project/zh/' });
  assert.deepEqual(state.redirects, ['https://example.com/project/zh/#section']);
  state.listeners.click({ target: { closest: () => ({ dataset: { languageOption: 'en' } }) } });
  assert.deepEqual(state.saved, ['en']);
});
test('entry language query overrides saved preference and preserves tracking params', () => {
  const state = run({ entry: true, saved: 'zh', search: '?lang=en&ref=1' });
  assert.deepEqual(state.redirects, ['https://example.com/en/?ref=1#section']);
  assert.deepEqual(state.saved, ['en']);
  assert.deepEqual(run({ entry: true, saved: 'invalid' }).redirects, []);
});
