import pytest
from django.urls import reverse

pytestmark = pytest.mark.django_db


def test_profile(client):
    url = reverse("profile", args=["HeadlinesGazer"])
    response = client.get(url)
    expected_value = "<h1>HeadlinesGazer</h1>"
    assert response.status_code == 200
    assert expected_value in response.content.decode("utf-8")
