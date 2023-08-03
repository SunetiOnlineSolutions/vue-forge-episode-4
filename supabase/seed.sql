INSERT INTO
  categories (uuid, name, slug)
VALUES
  ('45f42df8-3e1d-4b2d-8f80-7c35806d5739', 'Delft', 'delft'),
  ('ac52d4f3-20bf-4956-8305-6b9870bb8593', 'Leiden', 'leiden'),
  ('ea22c5ed-3cf6-4ff1-9e32-9f2f39f32c94', 'Rotterdam', 'rotterdam'),
  ('0d09f204-921e-4e96-bc78-4e3b9357f6a7', 'Schiedam', 'schiedam'),
  ('e95a8fdd-3e14-48b6-a4f6-6f6625a4576c', 'Den Haag', 'den_haag'),
  ('c5c0d889-0676-4411-92e3-b8c30c43260e', 'Vlaardingen', 'vlaardingen'),
  ('788f13ac-45aa-44b7-98f1-48c669b1a27a', 'Zoetermeer', 'zoetermeer'),
  ('3a8ef95f-3c99-4192-8197-7cb289d23933', 'Zwijndrecht', 'zwijndrecht');

  -- Insert seed data for 'projects' table
INSERT INTO
  projects (
    uuid,
    title,
    excerpt,
    description,
    image,
    "categoryUuid",
    pledged,
    backers,
    funded,
    "softCap",
    "hardCap",
    "startsAt",
    "finishesAt",
    "createdAt",
    "lastUpdatedAt"
  )
VALUES
-- Projects for Delft
('8c0be7f1-981c-40f0-a05c-22917c5bd5de', 'Eco-Friendly Carbon Delft 1', 'Eco-conscious carbon generation project in Delft', 'Developing and deploying a series of eco-friendly carbon reduction measures to promote sustainable living in Delft.', 'https://loremflickr.com/1000/640/inland_shipping', '45f42df8-3e1d-4b2d-8f80-7c35806d5739', 3500.00, 50, '2500.00', '3000.00', '5000.00', '2023-07-23 10:15:00', '2023-09-25 23:59:59', '2023-07-23 10:15:00', '2023-07-23 10:15:00'),
('9da5c65c-c355-4ad9-a3a6-8167fb6145db', 'Carbon Footprint Reduction Delft', 'Initiative for reducing carbon footprints in Delft', 'Working on various projects to reduce carbon footprints and promote sustainable living in Delft.', 'https://loremflickr.com/1000/640/port_carbon', '45f42df8-3e1d-4b2d-8f80-7c35806d5739', 5000.00, 40, '4000.00', '4000.00', '7000.00', '2023-07-24 11:30:00', '2023-10-15 23:59:59', '2023-07-24 11:30:00', '2023-07-24 11:30:00'),
('ab895566-b71d-43a9-9c5a-24034a829d08', 'Sustainable Energy Solutions Delft', 'Implementing sustainable energy solutions in Delft', 'Working on renewable energy projects to reduce carbon emissions and promote energy efficiency in Delft.', 'https://loremflickr.com/1000/640/sustainable_shipping', '45f42df8-3e1d-4b2d-8f80-7c35806d5739', 8000.00, 60, '7000.00', '6000.00', '10000.00', '2023-08-02 09:45:00', '2023-12-05 23:59:59', '2023-08-02 09:45:00', '2023-08-02 09:45:00'),
('a233f8f3-ba2c-4c43-8a3c-1f27f35ce877', 'Carbon-Neutral Transport Delft', 'Promoting carbon-neutral transport options in Delft', 'Implementing projects to reduce carbon emissions from transportation and promote eco-friendly alternatives in Delft.', 'https://loremflickr.com/1000/640/pollution_reduction', '45f42df8-3e1d-4b2d-8f80-7c35806d5739', 5000.00, 50, '4000.00', '4000.00', '7000.00', '2023-08-05 14:30:00', '2023-11-25 23:59:59', '2023-08-05 14:30:00', '2023-08-05 14:30:00'),
('def5147d-754b-42a4-823a-3b92ff9a9c7e', 'Sustainable Urban Planning Delft', 'Promoting sustainable urban planning in Delft', 'Working on projects to create sustainable neighborhoods and reduce carbon emissions in Delft.', 'https://loremflickr.com/1000/640/carbon_neutral', '45f42df8-3e1d-4b2d-8f80-7c35806d5739', 7000.00, 70, '6000.00', '6000.00', '9000.00', '2023-08-08 16:45:00', '2023-12-15 23:59:59', '2023-08-08 16:45:00', '2023-08-08 16:45:00'),

-- Projects for Leiden
('895c5c04-ef04-42d1-b2c9-97e506c784c8', 'Carbon Offsetting Leiden', 'Carbon offsetting', 'Implementing carbon offsetting measures to achieve a carbon-neutral status in Leiden.', 'https://loremflickr.com/1000/640/inland_shipping', 'ac52d4f3-20bf-4956-8305-6b9870bb8593', 10000.00, 100, '00000.00', '8000.00', '12000.00', '2023-07-27 15:30:00', '2023-10-20 23:59:59', '2023-07-27 15:30:00', '2023-07-27 15:30:00'),
('47f7212a-3c1b-4682-bd6b-7bf8673c3923', 'Sustainable Transport Leiden', 'Sustainable transport', 'Developing eco-friendly transport options to reduce carbon emissions in Leiden.', 'https://loremflickr.com/1000/640/sustainability', 'ac52d4f3-20bf-4956-8305-6b9870bb8593', 4000.00, 50, '3000.00', '3000.00', '6000.00', '2023-08-01 16:30:00', '2023-10-25 23:59:59', '2023-08-01 16:30:00', '2023-08-01 16:30:00'),
('f9169c28-c3fb-4e1e-b798-e91fb0a6846f', 'Sustainable Agriculture Leiden', 'Sustainable agriculture', 'Working on projects to encourage sustainable farming practices and reduce carbon footprint in Leiden.', 'https://loremflickr.com/1000/640/carbon_emissions', 'ac52d4f3-20bf-4956-8305-6b9870bb8593', 6000.00, 70, '5000.00', '5000.00', '8000.00', '2023-08-03 18:45:00', '2023-11-15 23:59:59', '2023-08-03 18:45:00', '2023-08-03 18:45:00'),
('20b88f63-c9e0-42ca-8b66-27e9d5e08c6d', 'Carbon-Neutral Housing Leiden', 'Carbon-neutral housing', 'Working on projects to construct energy-efficient and carbon-neutral buildings in Leiden.', 'https://loremflickr.com/1000/640/river', 'ac52d4f3-20bf-4956-8305-6b9870bb8593', 4500.00, 60, '3500.00', '4000.00', '6000.00', '2023-08-06 21:00:00', '2023-11-30 23:59:59', '2023-08-06 21:00:00', '2023-08-06 21:00:00'),
('628d463a-5be3-4d1c-86be-b3e49d39edc5', 'Sustainable Water Management Leiden', 'Sustainable water management', 'Working on projects to conserve water resources and reduce carbon footprint in Leiden.', 'https://loremflickr.com/1000/640/leiden', 'ac52d4f3-20bf-4956-8305-6b9870bb8593', 5500.00, 50, '4000.00', '4500.00', '7000.00', '2023-08-08 23:30:00', '2023-12-20 23:59:59', '2023-08-08 23:30:00', '2023-08-08 23:30:00'),

-- Projects for Rotterdam
('d0b9d951-b08b-4a06-b81a-602ecbc4dd4b', 'Sustainable Architecture Rotterdam', 'Sustainable architecture', 'Developing green buildings with low carbon footprints to promote sustainability in Rotterdam.', 'https://loremflickr.com/1000/640/carbon_footprint', 'ea22c5ed-3cf6-4ff1-9e32-9f2f39f32c94', 10000.00, 100, '00000.00', '8000.00', '12000.00', '2023-07-27 15:30:00', '2023-10-20 23:59:59', '2023-07-27 15:30:00', '2023-07-27 15:30:00'),
('38a7f9b5-3d7a-4e0d-ae4b-9a2689e4602d', 'Sustainable Waste Management Rotterdam', 'Sustainable waste management', 'Working on waste management projects to reduce carbon emissions and promote recycling in Rotterdam.', 'https://loremflickr.com/1000/640/sustainable_shipping', 'ea22c5ed-3cf6-4ff1-9e32-9f2f39f32c94', 8000.00, 80, '6000.00', '7000.00', '10000.00', '2023-08-02 09:45:00', '2023-12-05 23:59:59', '2023-08-02 09:45:00', '2023-08-02 09:45:00'),
('08d3c651-7e08-4f8f-b12b-70be9d29f920', 'Carbon-Neutral Industries Rotterdam', 'Carbon-neutral industries', 'Promoting sustainable practices in industries to reduce carbon footprint in Rotterdam.', 'https://loremflickr.com/1000/640/pollution_free', 'ea22c5ed-3cf6-4ff1-9e32-9f2f39f32c94', 7000.00, 70, '6000.00', '6000.00', '9000.00', '2023-08-05 14:30:00', '2023-11-25 23:59:59', '2023-08-05 14:30:00', '2023-08-05 14:30:00'),
('ed4401af-8be3-4e99-824b-837ef94ed168', 'Eco-Friendly Transportation Rotterdam', 'Eco-friendly transportation', 'Working on projects to reduce carbon emissions from transportation and promote sustainable transport options in Rotterdam.', 'https://loremflickr.com/1000/640/carbon_offsetting', 'ea22c5ed-3cf6-4ff1-9e32-9f2f39f32c94', 5000.00, 60, '4000.00', '4000.00', '7000.00', '2023-08-08 16:45:00', '2023-12-15 23:59:59', '2023-08-08 16:45:00', '2023-08-08 16:45:00'),
('a4b53af1-3490-45e2-8cd2-6f80964065a2', 'Sustainable Food Production Rotterdam', 'Sustainable food production', 'Working on projects to encourage sustainable farming practices and reduce carbon footprint in Rotterdam.', 'https://loremflickr.com/1000/640/green_energy', 'ea22c5ed-3cf6-4ff1-9e32-9f2f39f32c94', 4500.00, 70, '3500.00', '4000.00', '6000.00', '2023-08-09 18:00:00', '2023-11-30 23:59:59', '2023-08-09 18:00:00', '2023-08-09 18:00:00'),

-- Projects for Schiedam
('1021f65c-5bf3-433c-a139-cc739226140e', 'Schiedam Green Parks', 'Green parks', 'Transforming vacant spaces into green parks to absorb carbon and improve air quality in Schiedam.', 'https://loremflickr.com/1000/640/ships', '0d09f204-921e-4e96-bc78-4e3b9357f6a7', 3500.00, 60, '2500.00', '3000.00', '5000.00', '2023-07-24 11:30:00', '2023-10-15 23:59:59', '2023-07-24 11:30:00', '2023-07-24 11:30:00'),
('dd944719-2061-4630-88f5-11b11a88d6be', 'Sustainable Urban Development Schiedam', 'Urban development', 'Working on projects to create sustainable neighborhoods and reduce carbon emissions in Schiedam.', 'https://loremflickr.com/1000/640/carbon_neutral', '0d09f204-921e-4e96-bc78-4e3b9357f6a7', 5000.00, 50, '4000.00', '4000.00', '7000.00', '2023-08-01 16:30:00', '2023-10-25 23:59:59', '2023-08-01 16:30:00', '2023-08-01 16:30:00'),
('baed5e59-404b-4b7b-8a38-cf5a2e5e27e2', 'Sustainable Industries Schiedam', 'Sustainable industries', 'Working on projects to reduce carbon footprint in industrial processes and promote eco-friendly alternatives in Schiedam.', 'https://loremflickr.com/1000/640/eco_friendly', '0d09f204-921e-4e96-bc78-4e3b9357f6a7', 8000.00, 60, '7000.00', '6000.00', '10000.00', '2023-08-05 14:30:00', '2023-11-25 23:59:59', '2023-08-05 14:30:00', '2023-08-05 14:30:00'),
('e4e203e3-80d9-4fc2-9d9a-23e13d81d2a4', 'Eco-Friendly Water Management Schiedam', 'Eco-friendly water management', 'Working on projects to conserve water resources and reduce carbon footprint in Schiedam.', 'https://loremflickr.com/1000/640/sustainability', '0d09f204-921e-4e96-bc78-4e3b9357f6a7', 5000.00, 50, '4000.00', '4000.00', '7000.00', '2023-08-08 17:45:00', '2023-12-10 23:59:59', '2023-08-08 17:45:00', '2023-08-08 17:45:00'),

-- Projects for Den Haag
('a450b8c5-0954-4fc7-8683-860d70d66b9e', 'Carbon-Neutral Buildings Den Haag', 'Carbon-neutral buildings', 'Working on projects to construct energy-efficient and carbon-neutral buildings in Den Haag.', 'https://loremflickr.com/1000/640/pollution_prevention', 'e95a8fdd-3e14-48b6-a4f6-6f6625a4576c', 6000.00, 70, '5000.00', '5000.00', '8000.00', '2023-07-27 15:30:00', '2023-10-20 23:59:59', '2023-07-27 15:30:00', '2023-07-27 15:30:00'),
('5291cf53-1240-42c3-9641-16249d4aeb9e', 'Sustainable Transport Den Haag', 'Sustainable transportation', 'Developing eco-friendly transport options to reduce carbon emissions in Den Haag.', 'https://loremflickr.com/1000/640/low_carbon', 'e95a8fdd-3e14-48b6-a4f6-6f6625a4576c', 4500.00, 50, '3500.00', '4000.00', '6000.00', '2023-08-02 09:45:00', '2023-10-25 23:59:59', '2023-08-02 09:45:00', '2023-08-02 09:45:00'),
('42bb4c5d-5637-4eb4-932d-cbddc5762c26', 'Eco-Friendly Tourism Den Haag', 'Eco-friendly tourism', 'Working on projects to reduce the environmental impact of tourism and promote sustainable practices.', 'https://loremflickr.com/1000/640/river', 'e95a8fdd-3e14-48b6-a4f6-6f6625a4576c', 5000.00, 50, '4000.00', '4000.00', '7000.00', '2023-08-05 14:30:00', '2023-11-25 23:59:59', '2023-08-05 14:30:00', '2023-08-05 14:30:00'),
('da42c243-937e-48ef-826d-3132b6c55a09', 'Carbon-Neutral Events Den Haag', 'Carbon-neutral events', 'Implementing sustainable practices for organizing events and reducing carbon footprint in Den Haag.', 'https://loremflickr.com/1000/640/inland', 'e95a8fdd-3e14-48b6-a4f6-6f6625a4576c', 4000.00, 60, '3000.00', '3500.00', '5000.00', '2023-08-08 16:45:00', '2023-12-15 23:59:59', '2023-08-08 16:45:00', '2023-08-08 16:45:00'),
('75cd5b19-8be1-40f1-a1d1-7dd48ff8aa6c', 'Sustainable Urban Planning Den Haag', 'Sustainable urban planning', 'Working on projects to create sustainable neighborhoods and reduce carbon emissions in Den Haag.', 'https://loremflickr.com/1000/640/carbon_footprint', 'e95a8fdd-3e14-48b6-a4f6-6f6625a4576c', 7000.00, 70, '6000.00', '6000.00', '9000.00', '2023-08-09 18:00:00', '2023-11-30 23:59:59', '2023-08-09 18:00:00', '2023-08-09 18:00:00'),

-- Projects for Vlaardingen
('9a07d2d5-b9e1-4e93-94a7-cf440287bb06', 'Vlaardingen Green Spaces', 'Green spaces', 'Transforming urban areas into green spaces to absorb carbon and improve air quality in Vlaardingen.', 'https://loremflickr.com/1000/640/vlaardingen', 'c5c0d889-0676-4411-92e3-b8c30c43260e', 4500.00, 60, '3500.00', '4000.00', '6000.00', '2023-07-23 10:15:00', '2023-09-25 23:59:59', '2023-07-23 10:15:00', '2023-07-23 10:15:00'),
('93a41132-d39e-41b1-9a3d-cdc496ef3d7a', 'Sustainable Waste Management Vlaardingen', 'Waste management', 'Working on waste management projects to reduce carbon emissions and promote recycling in Vlaardingen.', 'https://loremflickr.com/1000/640/port_construction', 'c5c0d889-0676-4411-92e3-b8c30c43260e', 6000.00, 70, '5000.00', '5000.00', '8000.00', '2023-07-24 11:30:00', '2023-10-15 23:59:59', '2023-07-24 11:30:00', '2023-07-24 11:30:00'),
('a9268ff9-df82-4729-93b8-c5a1c6a1832b', 'Sustainable Urban Development Vlaardingen', 'Sustainable urban development', 'Working on projects to create sustainable neighborhoods and reduce carbon emissions in Vlaardingen.', 'https://loremflickr.com/1000/640/carbon_neutral', 'c5c0d889-0676-4411-92e3-b8c30c43260e', 5000.00, 50, '4000.00', '4000.00', '7000.00', '2023-08-01 16:30:00', '2023-10-25 23:59:59', '2023-08-01 16:30:00', '2023-08-01 16:30:00'),

-- Projects for Zoetermeer
('ca8e94d0-43ad-4c74-b66f-c9a73468e2e1', 'Zoetermeer Carbon Footprint Reduction', 'Carbon footprint reduction', 'Working on various projects to reduce carbon footprints and promote sustainable living in Zoetermeer.', 'https://loremflickr.com/1000/640/carbon_emission', '788f13ac-45aa-44b7-98f1-48c669b1a27a', 5000.00, 50, '4000.00', '4000.00', '7000.00', '2023-07-23 10:15:00', '2023-09-25 23:59:59', '2023-07-23 10:15:00', '2023-07-23 10:15:00'),
('5e4ac9af-6375-4a4e-af74-4a7cda4e7c3a', 'Sustainable Energy Solutions Zoetermeer', 'Sustainable energy solutions', 'Working on renewable energy projects to reduce carbon emissions and promote energy efficiency in Zoetermeer.', 'https://loremflickr.com/1000/640/zoetermeer', '788f13ac-45aa-44b7-98f1-48c669b1a27a', 7000.00, 70, '6000.00', '6000.00', '9000.00', '2023-07-24 11:30:00', '2023-10-15 23:59:59', '2023-07-24 11:30:00', '2023-07-24 11:30:00'),

-- Projects for Zwijndrecht
('f6d74580-e46b-4152-8f11-660aa64ed8ac', 'Zwijndrecht Carbon Offsetting', 'Carbon offsetting', 'Implementing carbon offsetting measures to achieve a carbon-neutral status in Zwijndrecht.', 'https://loremflickr.com/1000/640/inland', '3a8ef95f-3c99-4192-8197-7cb289d23933', 6000.00, 70, '5000.00', '5000.00', '8000.00', '2023-07-23 10:15:00', '2023-09-25 23:59:59', '2023-07-23 10:15:00', '2023-07-23 10:15:00'),
('7f55471d-2bae-45e5-a4eb-8c8cd6e7d3f1', 'Sustainable Transport Zwijndrecht', 'Sustainable transportation', 'Developing eco-friendly transport options to reduce carbon emissions in Zwijndrecht.', 'https://loremflickr.com/1000/640/eco', '3a8ef95f-3c99-4192-8197-7cb289d23933', 5000.00, 50, '4000.00', '4000.00', '7000.00', '2023-07-24 11:30:00', '2023-09-25 23:59:59', '2023-07-24 11:30:00', '2023-07-24 11:30:00'),
('7777a5de-dca2-4bf4-af30-2b4c4ac0fb2d', 'Eco-Friendly Agriculture Zwijndrecht', 'Eco-friendly agriculture', 'Working on projects to encourage sustainable farming practices and reduce carbon footprint in Zwijndrecht.', 'https://loremflickr.com/1000/640/carbon_offset', '3a8ef95f-3c99-4192-8197-7cb289d23933', 4500.00, 60, '3500.00', '4000.00', '6000.00', '2023-07-25 12:00:00', '2023-09-25 23:59:59', '2023-07-25 12:00:00', '2023-07-25 12:00:00'),
('a6c442f9-9274-4c85-99a2-64f24db8af0f', 'Carbon-Neutral Housing Zwijndrecht', 'Carbon-neutral housing', 'Working on projects to construct energy-efficient and carbon-neutral buildings in Zwijndrecht.', 'https://loremflickr.com/1000/640/dock', '3a8ef95f-3c99-4192-8197-7cb289d23933', 4000.00, 50, '3000.00', '3500.00', '6000.00', '2023-07-27 15:30:00', '2023-09-25 23:59:59', '2023-07-27 15:30:00', '2023-07-27 15:30:00'),
('b52a1b42-380b-465e-b8fb-4f0f1b7517e0', 'Sustainable Water Management Zwijndrecht', 'Sustainable water management', 'Working on projects to conserve water resources and reduce carbon footprint in Zwijndrecht.', 'https://loremflickr.com/1000/640/pollution_reduction', '3a8ef95f-3c99-4192-8197-7cb289d23933', 5500.00, 50, '4000.00', '4500.00', '7000.00', '2023-07-28 17:00:00', '2023-09-25 23:59:59', '2023-07-28 17:00:00', '2023-07-28 17:00:00');

INSERT INTO "storage"."buckets" (id, name, public, avif_autodetection)
VALUES ('projects', 'projects', true, false);
