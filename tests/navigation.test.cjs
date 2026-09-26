const { test } = require('node:test');
const assert = require('node:assert/strict');
const vm = require('node:vm');
const fs = require('node:fs');
const code = fs.readFileSync('assets/js/plugins/jquery.greedy-navigation.js', 'utf8');

function setup({ viewport = 1280, width = 1200, language = true, orientation = true } = {}) {
  const element = (id, size = 0, classes = '') => ({
    id, size, classes: new Set(classes.split(' ')), attrs: {}, children: [], handlers: {},
    focus() { this.focused = true; },
    contains(target) { return target === this || this.children.some(child => child.contains(target)); }
  });
  const nav = element('nav', width);
  const button = element('button', 44, 'hidden');
  const visible = element('visible');
  const hidden = element('hidden', 0, 'hidden');
  const brand = element('brand', 240, 'persist');
  const links = Array.from({ length: 8 }, (_, i) => element(`page-${i}`, 85));
  const languageLink = element('language', 80, 'persist tail');
  const theme = element('theme', 49, language ? 'persist' : 'persist tail');
  visible.children = [brand, ...links, ...(language ? [languageLink] : []), theme];
  nav.children = [button, visible, hidden];
  for (const parent of [nav, visible]) parent.children.forEach(child => { child.parent = parent; });
  const document = element('document');
  let fontReady;
  document.fonts = { ready: { then(fn) { fontReady = fn; } } };
  const window = element('window');
  window.matchMedia = () => ({ matches: viewport <= 767 });
  window.screen = orientation ? { orientation: { addEventListener() {} } } : {};
  const selectors = {
    '#site-nav': nav, '#site-nav .nav-toggle': button,
    '#site-nav .visible-links': visible, '#site-nav .hidden-links': hidden,
    '.masthead': element('masthead', 76), body: element('body'), '.sidebar': element('sidebar')
  };

  function wrap(nodes) {
    const move = (target, index) => {
      nodes.forEach(node => {
        node.parent.children.splice(node.parent.children.indexOf(node), 1);
        target.children.splice(index++, 0, node);
        node.parent = target;
      });
      return api;
    };
    const api = {
      length: nodes.length,
      children(selector) {
        let children = nodes.flatMap(node => node.children);
        if (selector === '*.persist.tail') children = children.filter(node => node.classes.has('tail'));
        if (selector === ':not(.persist)') children = children.filter(node => !node.classes.has('persist'));
        return wrap(children);
      },
      each(fn) { nodes.forEach(node => fn.call(node)); return api; },
      width() { return nodes[0].size; }, outerWidth() { return nodes[0].size; },
      height() { return nodes[0].size; },
      last() { return wrap(nodes.slice(-1)); },
      prependTo(target) { return move(target[0], 0); },
      appendTo(target) { return move(target[0], target[0].children.length); },
      insertBefore(target) { return move(target[0].parent, target[0].parent.children.indexOf(target[0])); },
      toggleClass(name, enabled) {
        nodes.forEach(node => enabled ? node.classes.add(name) : node.classes.delete(name));
        return api;
      },
      attr(name, value) {
        if (value === undefined) return nodes[0].attrs[name];
        nodes.forEach(node => { node.attrs[name] = value; });
        return api;
      },
      on(event, selector, handler) {
        nodes.forEach(node => { node.handlers[event] = handler || selector; });
        return api;
      },
      css() { return api; }, is() { return false; }
    };
    nodes.forEach((node, index) => { api[index] = node; });
    return api;
  }
  const $ = input => wrap(typeof input === 'string' ? (selectors[input] ? [selectors[input]] : []) : [input]);
  vm.runInNewContext(code, { $, document, window });
  return {
    nav, button, visible, hidden, document, theme, links,
    resize(nextViewport, nextWidth) { viewport = nextViewport; nav.size = nextWidth; window.handlers.resize(); },
    fontsLoaded() { fontReady(); },
    order() { return [...visible.children, ...hidden.children].filter(node => links.includes(node)).map(node => node.id); }
  };
}

test('desktop, tablet and compact navigation retain all links in order', () => {
  const state = setup();
  const order = state.links.map(link => link.id);
  assert.equal(state.hidden.children.length, 0);
  assert.ok(state.button.classes.has('hidden'));
  state.resize(900, 820);
  assert.ok(state.hidden.children.length > 0 && state.hidden.children.length < 8);
  assert.deepEqual(state.order(), order);
  state.resize(390, 342);
  assert.equal(state.hidden.children.length, 8);
  assert.deepEqual(state.visible.children.map(link => link.id), ['brand', 'language', 'theme']);
  state.resize(1280, 1200);
  assert.deepEqual(state.order(), order);
  assert.equal(state.hidden.children.length, 0);
  state.resize(320, 272);
  assert.deepEqual(state.hidden.children.map(link => link.id), order);
});

test('menu state, Escape focus, outside click and link activation agree', () => {
  const state = setup({ viewport: 390, width: 342 });
  state.button.handlers.click();
  assert.equal(state.button.attrs['aria-expanded'], 'true');
  assert.equal(state.hidden.classes.has('hidden'), false);
  state.document.handlers.keydown({ key: 'Escape' });
  assert.equal(state.button.attrs['aria-expanded'], 'false');
  assert.equal(state.button.focused, true);
  state.button.handlers.click();
  state.document.handlers.click({ target: state.theme });
  assert.equal(state.button.attrs['aria-expanded'], 'true');
  state.document.handlers.click({ target: {} });
  assert.equal(state.button.attrs['aria-expanded'], 'false');
  state.button.handlers.click();
  state.hidden.handlers.click();
  assert.equal(state.button.attrs['aria-expanded'], 'false');
});

test('font loading recalculates fit without duplicating navigation items', () => {
  const state = setup();
  state.links.forEach(link => { link.size = 130; });
  state.fontsLoaded();
  assert.ok(state.hidden.children.length > 0);
  assert.equal(state.order().length, 8);
  assert.equal(new Set(state.order()).size, 8);
});

test('pages without a language pair and browsers without orientation API work', () => {
  const state = setup({ language: false, orientation: false });
  state.resize(390, 342);
  state.resize(1280, 1200);
  assert.equal(state.visible.children.at(-1).id, 'theme');
  assert.deepEqual(state.order(), state.links.map(link => link.id));
});
