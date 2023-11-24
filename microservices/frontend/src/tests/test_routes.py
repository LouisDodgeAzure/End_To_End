def test_root_route(client):
    """Test the root route."""
    response = client.get('/')
    assert response.status_code == 200
    assert b'Hello, World!' in response.data
    
def test_non_existent_route(client):
    """Test accessing a non-existent route."""
    response = client.get('/non_existent_route')
    assert response.status_code == 404

