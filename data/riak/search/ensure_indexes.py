import riak
from subprocess import call

# this script is desing to execute inside the riak node.
client = riak.RiakClient(host='127.0.0.1', pb_port=8087)

# check and create the following list of indexes and bucket-type's
indexes = [{'name':'sparta_index', 'type':'sparta'}]

current_indexes = [x.get('name') for x in client.list_search_indexes()]

for i in indexes:

    if i.get('name') not in current_indexes:
        # get the schemas bitch!
        xml_file = open('./schemas/{0}_schema.xml'.format(i.get('name')), 'r')
        schema_data = xml_file.read()
        client.create_search_schema('{0}_schema'.format(i.get('name')), schema_data)
        xml_file.close()

        # we got the schema, create the fucking index now.
        client.create_search_index(i.get('name'), '{0}_schema'.format(i.get('name')))

        # here we call a external shell command to create the bucket-type
        call('riak-admin ' + ''.join(
            ('bucket-type create ',
                i.get('type'),
                ''' '{"props":{"datatype":"map","search_index":''',
                '"', i.get('name'), '"', "}}'")
        ), shell=True)

        # activate new bucket-type
        call('riak-admin bucket-type activate {0}'.format(i.get('type')), shell=True)