document.addEventListener('DOMContentLoaded', () => {
    const navToggle = document.querySelector('.nav-toggle-label');
    const navMenu = document.querySelector('nav ul');

    // Debugging: Ensure JS is running and finding the HTML elements
    console.log('JS Loaded. Hamburger icon found:', !!navToggle, '| Menu list found:', !!navMenu);

    if (navToggle && navMenu) {
        navToggle.addEventListener('click', (e) => {
            console.log('Hamburger menu clicked! Toggling active class...');
            navMenu.classList.toggle('active');
            console.log('Is menu active now?', navMenu.classList.contains('active'));
        });
    } else {
        console.error('Menu elements not found in HTML. Check your EJS file!');
    }
});