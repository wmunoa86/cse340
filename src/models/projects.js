import db from './db.js'

const getAllProjects = async () => {
    const query = `
        SELECT 
            sp.project_id,
            sp.title,
            sp.description,
            sp.location,
            sp.date,
            o.name AS organization_name
        FROM public.service_project sp
        JOIN public.organizations o ON sp.organization_id = o.organization_id
        ORDER BY o.name, sp.date;
    `;

    const result = await db.query(query);

    return result.rows;
}

const getProjectsByOrganizationId = async (organizationId) => {
    const query = `
        SELECT
          project_id,
          organization_id,
          title,
          description,
          location,
          date
        FROM public.service_project
        WHERE organization_id = $1
        ORDER BY date;
    `;

    const query_params = [organizationId];
    const result = await db.query(query, query_params);

    return result.rows;
};

// Export the model functions
export { getAllProjects, getProjectsByOrganizationId };