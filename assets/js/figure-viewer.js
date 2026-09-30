(() => {
  const trigger = document.querySelector('[data-figure-open]');
  const viewer = document.querySelector('[data-figure-viewer]');
  if (!trigger || !viewer || typeof viewer.showModal !== 'function') return;

  const image = viewer.querySelector('[data-figure-full]');
  const stage = viewer.querySelector('[data-figure-stage]');
  const status = viewer.querySelector('[data-figure-status]');
  const zoomIn = viewer.querySelector('[data-figure-in]');
  const zoomOut = viewer.querySelector('[data-figure-out]');
  let scale = 1;

  const resize = () => {
    if (!image.naturalWidth || !viewer.open) return;
    const fitWidth = Math.min(
      image.naturalWidth,
      stage.clientWidth - 24,
      (stage.clientHeight - 24) * image.naturalWidth / image.naturalHeight
    );
    image.style.width = `${Math.round(fitWidth * scale)}px`;
    zoomOut.disabled = scale <= 1;
    zoomIn.disabled = scale >= 4;
  };

  trigger.addEventListener('click', (event) => {
    if (event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;
    event.preventDefault();
    if (viewer.open) return;
    scale = 1;
    image.hidden = false;
    status.textContent = status.dataset.loading;
    status.hidden = false;
    image.alt = trigger.querySelector('img').alt;
    image.src = trigger.href;
    viewer.showModal();
    document.documentElement.classList.add('figure-viewer-open');
    stage.scrollTo(0, 0);
    if (image.complete && image.naturalWidth) status.hidden = true;
    resize();
  });

  image.addEventListener('load', () => {
    status.hidden = true;
    resize();
  });
  image.addEventListener('error', () => {
    image.hidden = true;
    status.textContent = status.dataset.error;
    status.hidden = false;
  });

  zoomIn.addEventListener('click', () => {
    scale = Math.min(4, scale + 0.5);
    resize();
  });
  zoomOut.addEventListener('click', () => {
    scale = Math.max(1, scale - 0.5);
    resize();
  });
  viewer.querySelector('[data-figure-fit]').addEventListener('click', () => {
    scale = 1;
    resize();
    stage.scrollTo(0, 0);
  });
  viewer.addEventListener('click', (event) => {
    if (event.target !== viewer) return;
    const bounds = viewer.getBoundingClientRect();
    if (event.clientX < bounds.left || event.clientX > bounds.right || event.clientY < bounds.top || event.clientY > bounds.bottom) viewer.close();
  });
  viewer.addEventListener('close', () => {
    document.documentElement.classList.remove('figure-viewer-open');
    trigger.focus({ preventScroll: true });
  });
  window.addEventListener('resize', resize);
})();
