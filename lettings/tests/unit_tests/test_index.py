import pytest
from django.urls import reverse

from lettings.models import Address, Letting


@pytest.mark.django_db()
class TestIndex:

    def test_index(self, client):
        url = reverse("lettings_index")
        response = client.get(url)
        print(response)
        # data = response.data.decode()
        expected_value = "Joshua Tree Green Haus /w Hot Tub"
        assert response.status_code == 200
        assert expected_value in response.content.decode('utf-8')
