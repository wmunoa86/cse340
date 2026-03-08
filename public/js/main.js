document.addEventListener('DOMContentLoaded', () => {
    const navToggle = document.querySelector('.nav-toggle-label');
    const navMenu = document.querySelector('nav ul');

    if (navToggle && navMenu) {
        navToggle.addEventListener('click', (e) => {
            e.preventDefault();
            navMenu.classList.toggle('active');
        });
    }
});