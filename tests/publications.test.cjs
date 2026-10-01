const { test } = require('node:test');
const assert = require('node:assert/strict');
const vm = require('node:vm');
const fs = require('node:fs');
const code = fs.readFileSync('assets/js/publications.js', 'utf8');

function setup(lang = 'en') {
  const control = () => ({ value: '', handlers: {}, addEventListener(event, fn) { this.handlers[event] = fn; } });
  const input = control();
  const select = control();
  const entries = [
    ['Park equity', 'inequality'], ['Housing Shanghai', 'restructuring inequality'], ['Industry Wuhan', 'transformation']
  ].map(([textContent, topics]) => ({ textContent, hidden: false, getAttribute: () => topics }));
  const groups = [entries.slice(0, 2), entries.slice(2)].map(items => ({ hidden: false, querySelectorAll: () => items }));
  const years = ['journal-2025', 'journal-2020', 'book-2025'].map((id, index) => ({ id, hidden: false, querySelectorAll: () => [entries[index]] }));
  const yearLinks = years.slice(0, 2).map(year => ({ hidden: false, getAttribute: () => '#' + year.id }));
  const yearNav = { hidden: false, querySelectorAll: () => yearLinks };
  const empty = { hidden: true };
  const count = { textContent: '' };
  const search = { hidden: true, querySelector: selector => selector === 'input' ? input : select };
  vm.runInNewContext(code, { document: {
    documentElement: { lang },
    querySelector: selector => ({ '[data-publication-search]': search, '[data-publication-empty]': empty, '[data-publication-count]': count, '[data-publication-years]': yearNav })[selector],
    querySelectorAll: selector => selector === '.publication-group' ? groups : years,
    getElementById: id => years.find(year => year.id === id)
  } });
  return { input, select, entries, groups, years, yearLinks, yearNav, empty, count, search };
}

test('shows all publications initially and exposes controls', () => {
  const state = setup();
  assert.equal(state.search.hidden, false);
  assert.equal(state.count.textContent, '3 publications');
  assert.ok(state.entries.every(entry => !entry.hidden));
});
test('combines theme and case-insensitive text, including multi-theme papers', () => {
  const state = setup('zh');
  state.select.value = 'inequality';
  state.select.handlers.change();
  assert.equal(state.count.textContent, '2 项成果');
  assert.equal(state.groups[1].hidden, true);
  state.input.value = ' SHANGHAI ';
  state.input.handlers.input();
  assert.equal(state.count.textContent, '1 项成果');
  assert.equal(state.entries[1].hidden, false);
});
test('empty state and reset restore all categories', () => {
  const state = setup();
  state.input.value = 'unmatched';
  state.input.handlers.input();
  assert.equal(state.empty.hidden, false);
  assert.ok(state.groups.every(group => group.hidden));
  state.input.value = '';
  state.input.handlers.input();
  assert.equal(state.empty.hidden, true);
  assert.ok(state.groups.every(group => !group.hidden));
});
test('unrelated pages require no publication controls', () => {
  assert.doesNotThrow(() => vm.runInNewContext(code, { document: { querySelector: () => null } }));
});
test('year navigation targets only visible journal years and restores after clearing search', () => {
  const state = setup();
  state.input.value = 'housing';
  state.input.handlers.input();
  assert.deepEqual(state.years.map(year => year.hidden), [true, false, true]);
  assert.deepEqual(state.yearLinks.map(link => link.hidden), [true, false]);
  assert.equal(state.yearNav.hidden, false);
  state.input.value = '';
  state.input.handlers.input();
  assert.ok(state.years.every(year => !year.hidden));
  assert.ok(state.yearLinks.every(link => !link.hidden));
});
test('a non-journal match does not expose an empty journal year with the same date', () => {
  const state = setup();
  state.select.value = 'transformation';
  state.select.handlers.change();
  assert.equal(state.count.textContent, '1 publications');
  assert.equal(state.years[2].hidden, false);
  assert.equal(state.yearNav.hidden, true);
  assert.ok(state.yearLinks.every(link => link.hidden));
  state.select.value = '';
  state.select.handlers.change();
  assert.equal(state.yearNav.hidden, false);
});
