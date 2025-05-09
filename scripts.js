// Menu items loading from database (simulation for now)
document.addEventListener('DOMContentLoaded', () => {
    // Smooth scroll handling for navigation
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Intersection Observer for fade-in animations
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in');
            }
        });
    }, { threshold: 0.1 });

    // Observe all sections and menu tables
    document.querySelectorAll('section, .menu-table').forEach((el) => observer.observe(el));

    // Mobile menu toggle with improved animation
    const createMobileMenu = () => {
        const nav = document.querySelector('nav');
        const burger = document.createElement('div');
        burger.className = 'burger';
        burger.innerHTML = '<div></div><div></div><div></div>';
        nav.prepend(burger);

        const navLinks = document.querySelectorAll('.nav-links li');
        
        burger.addEventListener('click', () => {
            // Toggle Nav
            document.querySelector('.nav-links').classList.toggle('nav-active');
            
            // Animate Links with stagger effect
            navLinks.forEach((link, index) => {
                if (link.style.animation) {
                    link.style.animation = '';
                } else {
                    link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.2}s`;
                }
            });
            
            // Burger Animation
            burger.classList.toggle('toggle');
        });
    };
    createMobileMenu();

    // Dynamic special offers rotation
    const offersList = document.querySelector('.offer-list');
    if (offersList) {
        const offers = [
            'Lunch Time Special - Cod & Chips £8.95!',
            'More deals coming soon!',
        ];
        let currentOffer = 0;

        setInterval(() => {
            offersList.children[0].style.opacity = '0';
            setTimeout(() => {
                offersList.children[0].innerHTML = offers[currentOffer];
                offersList.children[0].style.opacity = '1';
                currentOffer = (currentOffer + 1) % offers.length;
            }, 500);
        }, 5000);
    }

    // Opening hours countdown
    const updateOpeningStatus = () => {
        const now = new Date();
        const day = now.getDay();
        const time = now.getHours() * 100 + now.getMinutes();
        const isOpen = 
            day !== 0 && // Not Sunday
            ((time >= 1130 && time <= 1400) || // Lunch hours
             (time >= 1600 && time <= 2100));  // Dinner hours
        
        const statusEl = document.createElement('div');
        statusEl.className = `status-indicator ${isOpen ? 'open' : 'closed'}`;
        statusEl.textContent = isOpen ? 'Open Now' : 'Closed';
        
        const hoursSection = document.querySelector('.opening-hours');
        if (hoursSection) {
            if (!hoursSection.querySelector('.status-indicator')) {
                hoursSection.prepend(statusEl);
            }
        }
    };

    updateOpeningStatus();
    setInterval(updateOpeningStatus, 60000); // Update every minute

    // Menu filtering
    const filterButtons = document.querySelectorAll('.filter-btn');
    const menuTables = document.querySelectorAll('.menu-table');

    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            const filter = button.getAttribute('data-filter');
            
            // Update active button state
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            // Filter menu tables
            menuTables.forEach(table => {
                if (filter === 'all' || table.getAttribute('data-category') === filter) {
                    table.style.display = '';
                    table.style.opacity = '0';
                    setTimeout(() => {
                        table.style.opacity = '1';
                    }, 50);
                } else {
                    table.style.display = 'none';
                }
            });
        });
    });

    // Scroll to top functionality
    const scrollTopButton = document.querySelector('.scroll-to-top');
    
    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            scrollTopButton.classList.add('visible');
        } else {
            scrollTopButton.classList.remove('visible');
        }
    });

    scrollTopButton.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
    
    // Cookie consent functionality
    function setCookie(name, value, days) {
        const expires = new Date();
        expires.setTime(expires.getTime() + (days * 24 * 60 * 60 * 1000));
        document.cookie = name + '=' + value + ';expires=' + expires.toUTCString() + ';path=/;SameSite=Lax';
    }

    function getCookie(name) {
        const nameEQ = name + '=';
        const ca = document.cookie.split(';');
        for(let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }

    function handleCookieConsent() {
        const cookieConsent = document.getElementById('cookie-consent');
        const acceptBtn = document.getElementById('accept-cookies');
        const customizeBtn = document.getElementById('customize-cookies');
        const savePreferencesBtn = document.getElementById('save-preferences');
        const cookieSettings = document.getElementById('cookie-settings');
        const viewPolicyBtn = document.getElementById('view-policy');
        const analyticsCheckbox = document.getElementById('analytics-cookies');
        
        // Check if user has already set cookie preferences
        const cookiePreferences = getCookie('cookiePreferences');
        if (cookiePreferences) {
            const preferences = JSON.parse(cookiePreferences);
            cookieConsent.classList.add('hidden');
            analyticsCheckbox.checked = preferences.analytics;
        }

        // Handle "Accept all" button
        acceptBtn.addEventListener('click', () => {
            const preferences = {
                essential: true,
                analytics: true
            };
            setCookie('cookiePreferences', JSON.stringify(preferences), 365);
            cookieConsent.classList.add('hidden');
        });

        // Handle "Customize" button
        customizeBtn.addEventListener('click', () => {
            cookieSettings.classList.toggle('hidden');
        });

        // Handle "Save preferences" button
        savePreferencesBtn.addEventListener('click', () => {
            const preferences = {
                essential: true,
                analytics: analyticsCheckbox.checked
            };
            setCookie('cookiePreferences', JSON.stringify(preferences), 365);
            cookieSettings.classList.add('hidden');
            cookieConsent.classList.add('hidden');
        });

        // Handle "View cookie policy" link
        viewPolicyBtn.addEventListener('click', (e) => {
            e.preventDefault();
            const policyText = `Cookie Policy

This website uses cookies to enhance your browsing experience. We use two types of cookies:

1. Essential Cookies (Required)
These cookies are necessary for the website to function properly. They enable basic functions like page navigation and access to secure areas of the website.

2. Analytics Cookies (Optional)
These cookies help us understand how visitors interact with our website by collecting and reporting information anonymously. This helps us improve our website and your experience.

Your choices regarding cookies on this website:
- You can accept all cookies
- You can customize which optional cookies to accept
- You can change your preferences at any time

We respect your privacy and ensure that all data collected through cookies is handled in accordance with applicable data protection laws.

For more information about how we use cookies and protect your data, please contact us.`;
            
            alert(policyText);
        });
    }

    handleCookieConsent();
});