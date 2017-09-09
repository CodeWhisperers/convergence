#legacySQL
SELECT
visitId,
visitStartTime + hits.time * 1000 as t,
// hits.minute,
fullVisitorId,

//hits.product.productSKU,
hits.product.productPrice,
hits.eCommerceAction.action_type,
MAX(IF(hits.customDimensions.index = 4, hits.customDimensions.value, NULL)) WITHIN RECORD AS category


FROM TABLE_DATE_RANGE([46435769. ga_sessions_], TIMESTAMP('2017-08-16'), TIMESTAMP('2017-08-19'))
WHERE hits.eCommerceAction.action_type IN ("2", "5", "6")
AND hits.page.hostname = 'www.emag.ro'

ORDER BY
fullVisitorId,
visitId,
T
