$(document).ready(function() {
    // Tech stack data
    const techStack = {
        enterpriseJava: ['Jakarta EE', 'MicroProfile', 'Jakarta Rest', 'JPA', 'CDI', 'Bean Validation', 'OpenTelemetry', 'Micrometer'],
        frameworks: ['Quarkus', 'WildFly', 'Spring Boot'],
        mobile: ['Android', 'Compose Multiplatform', 'Kotlin', 'Koin'],
        tools: ['Maven', 'Git', 'IntelliJ IDEA', 'Arquillian', 'REST APIs', 'CI/CD']
    };

    // Render capabilities
    /*capabilities.forEach((cap, index) => {
        const card = $(`
                    <div class="capability-card bg-white rounded-xl p-6 shadow-md" style="opacity: 0; animation: fadeInUp 0.6s ease-out ${index * 0.1}s forwards;">
                        <div class="text-5xl mb-4">${cap.icon}</div>
                        <h3 class="text-xl font-bold text-gray-900 mb-3">${cap.title}</h3>
                        <p class="text-gray-600 leading-relaxed">${cap.description}</p>
                    </div>
                `);
        $('#capabilities-grid').append(card);
    });*/

    /*
    // Render tech stack badges
    function renderBadges(containerId, badges, color) {
        badges.forEach((badge, index) => {
            setTimeout(() => {
                const elem = $(`
                            <span class="tech-badge bg-${color}-100 text-${color}-700 px-4 py-2 rounded-lg font-medium border border-${color}-200" style="opacity: 0;">
                                ${badge}
                            </span>
                        `);
                $(`#${containerId}`).append(elem);
                setTimeout(() => elem.css({opacity: 1, transition: 'opacity 0.3s ease'}), 50);
            }, index * 50);
        });
    }

    renderBadges('enterprise-java', techStack.enterpriseJava, 'blue');
    renderBadges('frameworks', techStack.frameworks, 'purple');
    renderBadges('mobile', techStack.mobile, 'green');
    renderBadges('tools', techStack.tools, 'orange');
    */

    // Smooth scrolling for navigation
    $('a[href^="#"]').on('click', function(e) {
        e.preventDefault();
        const target = $(this.getAttribute('href'));
        if (target.length) {
            $('html, body').animate({
                scrollTop: target.offset().top - 70
            }, 600);
        }
    });

    // Active nav state on scroll
    $(window).on('scroll', function() {
        let scrollPos = $(window).scrollTop() + 100;

        $('nav a[href^="#"]').each(function() {
            const currLink = $(this);
            const refElement = $(currLink.attr('href'));
            if (refElement.length && refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
                $('nav a').removeClass('text-blue-600').addClass('text-gray-600');
                currLink.removeClass('text-gray-600').addClass('text-blue-600');
            }
        });
    });
});
