# Generated by Django 3.0 on 2022-04-11 12:12
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('lettings', '0001_initial'),
    ]

    operations = [migrations.RunSQL("""
               INSERT INTO lettings_address (
                   number,
                   street,
                   city,
                   state,
                   zip_code,
                   country_iso_code
               )
               SELECT
                   number,
                   street,
                   city,
                   state,
                   zip_code,
                   country_iso_code
               FROM
                   oc_lettings_site_address;
           """, reverse_sql="""
               INSERT INTO oc_lettings_site_address (
                   number,
                   street,
                   city,
                   state,
                   zip_code,
                   country_iso_code
               )
               SELECT
                   number,
                   street,
                   city,
                   state,
                   zip_code,
                   country_iso_code
               FROM
                   lettings_address;
           """),
                  migrations.RunSQL("""
               INSERT INTO lettings_letting (
                   title,
                   address_id
               )
               SELECT
                   title,
                   address_id
               FROM
                   oc_lettings_site_letting;
           """, reverse_sql="""
               INSERT INTO oc_lettings_site_letting (
                   title,
                   address_id
               )
               SELECT
                   title,
                   address_id
               FROM
                   lettings_letting;
           """)
    ]
