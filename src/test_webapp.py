import unittest
from webapp import webapp


class TestApp(unittest.TestCase):

    def setUp(self):
        webapp.testing = True
        self.app = webapp.test_client()

    def test_home(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        #self.assertEqual(response.data.decode('utf-8'), 'Welcome to the Python web app!')


if __name__ == '__main__':
    unittest.main()
