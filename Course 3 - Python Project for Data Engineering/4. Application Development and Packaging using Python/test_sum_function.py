import unittest

from sum_function import add

class TestAdd(unittest.TestCase):
    def test1(self):
        self.assertEqual(add(2, 4), 6)
        self.assertEqual(add(0, 0), 0)
        self.assertEqual(add(2.3, 3.6), 5.9)
        self.assertEqual(add("hello", "world"), "helloworld")
        self.assertEqual(add(2.3000, 4.3000), 6.6)
        self.assertNotEqual(add(-2, -2), 0)

unittest.main()