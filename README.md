1. After an entry in Contentful is published, it can send a webhook with the entry data to txcf service. Example of such hook is posted below.
2. txcf service should parse en keys from all fields and build a json document cf_{entry_id}_en.json
3. cf_{entry_id}_en.json should be pushed as a resource to lumos-static-site-generator project in Transifex.
4. After cf_{entry_id}_en.json is translated, Transifex can send a webhook with resource data to txcf service. Example of such hook is posted below.
5. txcf service should update the entry with the corresponding id and locale in Contentful via API call.
6. txcf service should publish the entry (this will bring us to step 1 which is ok, since step 4 is triggered only after there are new translations).
