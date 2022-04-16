import pytest
from django.urls import reverse

pytestmark = pytest.mark.django_db


def test_index(client):
    url = reverse("index")
    response = client.get(url)
    expected_value = "Welcome to Holiday Homes"
    assert response.status_code == 200
    assert expected_value in response.content.decode("utf-8")
