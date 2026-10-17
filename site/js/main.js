// Theme: follow the system until the visitor picks one, then remember it.
(function () {
  var root = document.documentElement;
  root.classList.remove('no-js');

  var toggle = document.querySelector('.theme-toggle');
  if (toggle) {
    var current = function () {
      var set = root.getAttribute('data-theme');
      if (set) return set;
      return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    };
    var label = function () {
      var next = current() === 'dark' ? 'light' : 'dark';
      toggle.textContent = next === 'dark' ? 'Dark' : 'Light';
      toggle.setAttribute('aria-label', 'Switch to ' + next + ' mode');
    };
    label();
    toggle.addEventListener('click', function () {
      var next = current() === 'dark' ? 'light' : 'dark';
      root.setAttribute('data-theme', next);
      try { localStorage.setItem('theme', next); } catch (e) {}
      label();
    });
  }

  // Fade sections in and draw diagram lines once, on first view.
  var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var targets = document.querySelectorAll('.reveal, .draw');
  if (reduce || !('IntersectionObserver' in window)) {
    targets.forEach(function (el) { el.classList.add('in'); });
    return;
  }

  // Normalise diagram strokes so a dash of 1 covers each whole shape.
  document.querySelectorAll('.draw .line, .draw .box, .draw .box-accent').forEach(function (el) {
    el.setAttribute('pathLength', '1');
  });

  var io = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (!entry.isIntersecting) return;
      var el = entry.target;
      el.classList.add('in');
      io.unobserve(el);
    });
  }, { threshold: 0.15 });

  targets.forEach(function (el) { io.observe(el); });
})();
