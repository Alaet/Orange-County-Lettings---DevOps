import pytest
from django.urls import reverse

pytestmark = pytest.mark.django_db


def test_letting_index(client):
    url = reverse("lettings_index")
    response = client.get(url)
    expected_value = "Joshua Tree Green Haus /w Hot Tub"
    assert response.status_code == 200
    assert expected_value in response.content.decode("utf-8")
