document.addEventListener('DOMContentLoaded', function() {
  // Handle clickable rows
  document.body.addEventListener('mouseup', function(event) {
    const target = event.target.closest('[data-href]');

    if (target) {
      event.preventDefault();
      const href = target.getAttribute('data-href');

      if (event.metaKey || event.ctrlKey || event.button === 1) {
        window.open(href, '_blank', 'noopener, noreferrer');
      } else if (event.button === 0) {
        window.location.href = href;
      }
    }
  });

  // Format dates
  document.querySelectorAll('[data-date]').forEach(function (element) {
    const dateString = element.textContent.trim();
    const date = new Date(dateString);

    if (isNaN(date.getTime())) return;

    const formattedDate = new Intl.DateTimeFormat('en-US', {
      year: undefined,
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: false
    }).format(date);

    element.textContent = formattedDate;
    element.setAttribute('title', dateString); // Add original date as title
  });

  // Handle auto-submit elements
  document.querySelectorAll('[data-auto-submit]').forEach(function (element) {
    element.addEventListener('change', function () {
      const form = element.closest('form');
      if (form) form.submit();
    });
  });


  // Auto-refresh functionality for dashboard page
  const searchParams = new URLSearchParams(window.location.search);
  const refreshInterval = parseInt(searchParams.get('auto_refresh_period'));

  if (refreshInterval) {
    setInterval(refreshHomePage, refreshInterval * 1000);
  }

  function refreshHomePage() {
    // TODO: Implement a smart refresh strategy using Fetch or Turbo
    window.location.reload();
  }
});
