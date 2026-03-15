CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL UNIQUE,
    logo_filename VARCHAR(255) NOT NULL
);
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES (
        'BrightFuture Builders',
        'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
        'info@brightfuturebuilders.org',
        'brightfuture-logo.png'
    ),
    (
        'GreenHarvest Growers',
        'An urban farming collective promoting food sustainability and education in local neighborhoods.',
        'contact@greenharvest.org',
        'greenharvest-logo.png'
    ),
    (
        'UnityServe Volunteers',
        'A volunteer coordination group supporting local charities and service initiatives.',
        'hello@unityserve.org',
        'unityserve-logo.png'
    );

CREATE TABLE service_project (
    project_id      SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title           VARCHAR(200) NOT NULL,
    description     TEXT NOT NULL,
    location        VARCHAR(255) NOT NULL,
    date            DATE NOT NULL,

    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON DELETE CASCADE
);

-- BrightFuture Builders (organization_id = 1)
INSERT INTO service_project (organization_id, title, description, location, date) VALUES
(1, 'Community Park Renovation', 'Rebuilding playground equipment and green areas in the central park.', 'Downtown Community Park', '2025-03-15'),
(1, 'Affordable Housing Repairs', 'Fixing roofs and plumbing in low-income housing units.', 'Eastside Neighborhood', '2025-04-10'),
(1, 'School Building Upgrade', 'Installing solar panels and improving classrooms at Lincoln Elementary.', 'Lincoln Elementary School', '2025-05-20'),
(1, 'Flood-Resistant Roads Project', 'Paving and reinforcing roads in flood-prone areas.', 'Riverside District', '2025-06-05'),
(1, 'Community Center Construction', 'Building a new multipurpose community center with sustainable materials.', 'Westfield Avenue', '2025-07-18'),

-- GreenHarvest Growers (organization_id = 2)
(2, 'Rooftop Garden Initiative', 'Creating rooftop vegetable gardens in apartment buildings.', 'Northside Apartments', '2025-03-22'),
(2, 'School Garden Program', 'Teaching students to grow their own food in school gardens.', 'Jefferson Middle School', '2025-04-14'),
(2, 'Farmers Market Launch', 'Organizing a weekly local farmers market to support urban growers.', 'Central Plaza', '2025-05-03'),
(2, 'Composting Workshops', 'Teaching composting techniques to reduce food waste in households.', 'Community Library', '2025-06-11'),
(2, 'Hydroponic Lab Setup', 'Installing a hydroponic growing lab for year-round food production.', 'GreenHarvest Headquarters', '2025-07-25'),

-- UnityServe Volunteers (organization_id = 3)
(3, 'Food Drive Campaign', 'Collecting and distributing food to families in need across the city.', 'Multiple Locations', '2025-03-29'),
(3, 'Elder Care Visit Program', 'Organizing weekly visits to elderly residents in care homes.', 'Sunrise Care Home', '2025-04-20'),
(3, 'Youth Mentorship Day', 'Pairing volunteers with at-risk youth for career guidance workshops.', 'Unity Community Hall', '2025-05-17'),
(3, 'Beach Cleanup Drive', 'Removing trash and debris from the local shoreline.', 'Lakewood Beach', '2025-06-08'),
(3, 'Charity Run Organization', 'Coordinating a 5K run to raise funds for local shelters.', 'City Sports Park', '2025-07-12');