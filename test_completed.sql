SELECT CONTACT.display_name, EMPLOYER.organization_name, COUNT(civiCASE.id) AS CasesCount
FROM civicrm_contact AS CONTACT
INNER JOIN civicrm_contact AS EMPLOYER ON CONTACT.employer_id=EMPLOYER.id
INNER JOIN civicrm_case_contact AS CC ON CC.contact_id=CONTACT.id
INNER JOIN civicrm_case AS civiCASE ON civiCASE.id=CC.case_id
INNER JOIN civicrm_option_value AS civiVALUE ON civiVALUE.value=civiCASE.status_id
INNER JOIN civicrm_option_group AS civiGROUP ON civiVALUE.option_group_id=civiGROUP.id
WHERE civiGROUP.name='case_status'
AND civiVALUE.label='ongoing'
GROUP BY CONTACT.display_name, EMPLOYER.organization_name
ORDER BY CONTACT.display_name,EMPLOYER.organization_name
