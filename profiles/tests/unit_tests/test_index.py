import pytest
from django.urls import reverse

pytestmark = pytest.mark.django_db


def test_letting_index(client):
    url = reverse("profiles_index")
    response = client.get(url)
    expected_value = "<title>Profiles</title>"
    assert response.status_code == 200
    assert expected_value in response.content.decode("utf-8")
