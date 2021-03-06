require "spec_helper"

describe Echo::ClientMiddleware::Echo10DatasetMiddleware do
  let(:middleware) { Echo::ClientMiddleware::Echo10DatasetMiddleware.new }

  context 'when given parsed Echo10 dataset data' do
    let(:env) do
      { body: {
          'Collection' => {
            'ShortName' => 'AST_L1AE',
            'VersionId' => '3',
            'LongName' => 'ASTER Expedited L1A Reconstructed Unprocessed Instrument Data',
            'DataSetId' => 'ASTER Expedited L1A Reconstructed Unprocessed Instrument Data',
            'Description' => 'Expedited ASTER level-1A data are reconstructed, unprocessed instrument digital counts with radiometric and geometric coefficients included.',
            'ArchiveCenter' => 'LPDAAC',
            'ProcessingCenter' => 'EDC',
            'Temporal' => {
              'RangeDateTime' => {
                'BeginningDateTime' => '1984-12-25T00:00:00.000Z',
                'EndingDateTime' => '1994-12-25T00:00:00.000Z'
              }
            },
            'Contacts' => {
              'Contact' => {
                "Role" => "DATA CENTER CONTACT",
                "OrganizationAddresses" => {
                  "Address" => {
                    "StreetAddress" => "ORNL DAAC User Services Office, P.O. Box 2008, MS 6407, Oak Ridge National Laboratory",
                    "City" => "Oak Ridge",
                    "StateProvince" => "Tennessee",
                    "PostalCode" => "37831-6407",
                    "Country" => "USA"
                  }
                },
                "OrganizationPhones" => {
                  "Phone" => [
                    {
                      "Number" => "(865) 241-3952",
                      "Type" => "Direct Line"
                    },
                    {
                      "Number" => "(865) 574-4665",
                      "Type" => "Fax"
                    }
                  ]
                },
                "OrganizationEmails" => {
                  "Email" => "ornldaac@ornl.gov"
                },
                "ContactPersons" => {
                  "ContactPerson" => {
                    "FirstName" => "PLEASE CONTACT",
                    "LastName" => "ORNL DAAC User Services"
                  }
                }
              }
            },
            'ScienceKeywords' => {
              'ScienceKeyword' => [
                {
                  'CategoryKeyword' => 'EARTH SCIENCE',
                  'TopicKeyword' =>'HYDROSPHERE',
                  'TermKeyword' => 'SURFACE WATER'
                },
                {
                  'CategoryKeyword' => 'EARTH SCIENCE',
                  'TopicKeyword' =>'HYDROSPHERE',
                  'TermKeyword' => 'SURFACEWATER'
                }
              ]
            },
            'OnlineAccessURLs' => {
              'OnlineAccessURL' => {
                'URL' => 'http://www.example.com',
                'URLDescription' => ''
              }
            },
            'OnlineResources' => {
              'OnlineResource' => {
                'URL' => 'http://www.example.com',
                'Description' => ''
              }
            },
            'AssociatedDIFs' => {
              'DIF' => {
                'EntryId' => 'DIF_ID'
              }
            },
            'BrowseImages' => '',
            'Spatial' => [
              {
                'SpatialCoverageType' => 'Horizontal',
                'HorizontalSpatialDomain' => {
                  'Geometry' => {
                    'CoordinateSystem' => 'CARTESIAN',
                    'Point' => [{
                                          'PointLongitude' => '-96.6',
                                          'PointLatitude' => '39.1'
                                        }]
                  }
                },
                'GranuleSpatialRepresentation' => 'CARTESIAN'
              }
            ]
          }
        }
      }
    end

    let(:expected_body) do
      {
        'collection' => {
          "dataset_id" => "ASTER Expedited L1A Reconstructed Unprocessed Instrument Data",
          "description" => "Expedited ASTER level-1A data are reconstructed, unprocessed instrument digital counts with radiometric and geometric coefficients included.",
          "short_name" => "AST_L1AE",
          "version_id" => "3",
          "archive_center" => "LPDAAC",
          "processing_center" => "EDC",
          "processing_level_id" => nil,
          "orderable" => nil,
          "visible" => nil,
          "temporal" => "1984-12-25T00:00:00.000Z to 1994-12-25T00:00:00.000Z",
          "contacts" => [
            {
              "name" => "PLEASE CONTACT ORNL DAAC User Services",
              "phones" => [
                "(865) 241-3952 (Direct Line)",
                "(865) 574-4665 (Fax)"
                ],
              "email" => "ornldaac@ornl.gov"
            }
          ],
          "science_keywords" => [
              ["Earth Science", "Hydrosphere", "Surface Water"],
            ["Earth Science", "Hydrosphere", "Surfacewater"]
          ],
          "online_access_urls" => [
            {
              "URL" => "http://www.example.com",
              "URLDescription" => "",
              "description" => ""
            }
          ],
          "online_resources" => [
            {
              "URL" => "http://www.example.com",
              "Description" => "http://www.example.com"
            }
          ],
          "associated_difs" => {
            "url" => "http://gcmd.gsfc.nasa.gov/getdif.htm?DIF_ID",
            "id" => "DIF_ID"
          },
          "spatial" => ["Point: (39.1\xC2\xB0, -96.6\xC2\xB0)"],
          "browse_images" => [],
          "id" => nil,
          "native_url" => "https://cmr.earthdata.nasa.gov/search/concepts/",
          "atom_url" => "https://cmr.earthdata.nasa.gov/search/concepts/.atom",
          "echo10_url" => "https://cmr.earthdata.nasa.gov/search/concepts/.echo10",
          "iso19115_url" => "https://cmr.earthdata.nasa.gov/search/concepts/.iso19115",
          "smap_iso_url" => nil,
          "dif_url" => "https://cmr.earthdata.nasa.gov/search/concepts/.dif",
          "xml" => {
            "ShortName"=>"AST_L1AE",
            "VersionId"=>"3",
            "LongName"=>"ASTER Expedited L1A Reconstructed Unprocessed Instrument Data",
            "DataSetId"=>"ASTER Expedited L1A Reconstructed Unprocessed Instrument Data",
            "Description"=>"Expedited ASTER level-1A data are reconstructed, unprocessed instrument digital counts with radiometric and geometric coefficients included.",
            "ArchiveCenter"=>"LPDAAC",
            "ProcessingCenter"=>"EDC",
            "Temporal"=>{
              "RangeDateTime"=>{
                "BeginningDateTime"=>"1984-12-25T00:00:00.000Z",
                "EndingDateTime"=>"1994-12-25T00:00:00.000Z"
              }
            },
            "Contacts"=>{
              "Contact"=>{
                "Role"=>"DATA CENTER CONTACT",
                "OrganizationAddresses"=>{
                  "Address"=>{
                    "StreetAddress"=>"ORNL DAAC User Services Office, P.O. Box 2008, MS 6407, Oak Ridge National Laboratory",
                    "City"=>"Oak Ridge",
                    "StateProvince"=>"Tennessee",
                    "PostalCode"=>"37831-6407",
                    "Country"=>"USA"
                  }
                },
                "OrganizationPhones"=>{
                  "Phone"=>[
                    {"Number"=>"(865) 241-3952", "Type"=>"Direct Line"},
                    {"Number"=>"(865) 574-4665", "Type"=>"Fax"}]
                },
                "OrganizationEmails"=>{
                  "Email"=>"ornldaac@ornl.gov"
                },
                "ContactPersons"=>{
                  "ContactPerson"=>{
                    "FirstName"=>"PLEASE CONTACT",
                    "LastName"=>"ORNL DAAC User Services"
                  }
                }
              }
            },
            "ScienceKeywords"=>{
              "ScienceKeyword"=>[
                {"CategoryKeyword"=>"EARTH SCIENCE",
                  "TopicKeyword"=>"HYDROSPHERE",
                  "TermKeyword"=>"SURFACE WATER"
                },
                {"CategoryKeyword"=>"EARTH SCIENCE",
                  "TopicKeyword"=>"HYDROSPHERE",
                  "TermKeyword"=>"SURFACEWATER"
                }
              ]
            },
            "OnlineAccessURLs"=>{
              "OnlineAccessURL"=>{
                "URL"=>"http://www.example.com",
                "URLDescription"=>"",
                "description"=>""
              }
            },
            "OnlineResources"=>{
              "OnlineResource"=>{
                "URL"=>"http://www.example.com",
                "Description"=>"http://www.example.com"
              }
            },
            "AssociatedDIFs"=>{
              "DIF"=>{
                "EntryId"=>"DIF_ID"
              }
            },
            "BrowseImages"=>"",
            "Spatial"=>[
              {
                "SpatialCoverageType"=>"Horizontal",
                "HorizontalSpatialDomain"=>{
                  "Geometry"=>{
                    "CoordinateSystem"=>"CARTESIAN",
                    "Point"=>[
                      {"PointLongitude"=>"-96.6", "PointLatitude"=>"39.1"}
                    ]
                  }
                },
                "GranuleSpatialRepresentation"=>"CARTESIAN"
              }
            ]
          }
        }
      }
    end

    it 'updates the parsed body to contain a list of datasets' do
      middleware.process_response(env)
      datasets = env[:body].dup
      expect(datasets).to be_instance_of(Array)
      expect(datasets.size).to eq(1)
      parse_dataset = DatasetDetailsPresenter.new(datasets[0])
      expect(datasets[0].as_json).to eq(expected_body['collection'])
    end

  end

  it 'does not operate on response strings' do
    env = { body: '{"Collection":{"title":"ECHO dataset metadata"}}' }
    expect(middleware.parse_response?(env)).to be_false
  end

  it 'does not operate on hashes containing parsed Atom granule data' do
    env = { body: { 'feed' => { 'title' => 'ECHO granule metadata' } } }
    expect(middleware.parse_response?(env)).to be_false
  end
end
