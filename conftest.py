import os

import pytest
from django.conf import settings
from oc_lettings_site.settings import BASE_DIR


@pytest.fixture(scope="session")
def django_db_setup():

    settings.DATABASES["default"] = {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": os.path.join(BASE_DIR, "oc-lettings-site.sqlite3"),
    }
