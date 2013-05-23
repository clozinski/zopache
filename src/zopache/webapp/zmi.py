##############################################################################
#
# Copyright (c) 2013 Christopher Lozinski (lozinski@freerecruiting.com)
# All Rights Reserved.
#
# This software is subject to the provisions of the Zope Public License,
# Version 2.1 (ZPL).  A copy of the ZPL should accompany this distribution.
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY AND ALL EXPRESS OR IMPLIED
# WARRANTIES ARE DISCLAIMED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF TITLE, MERCHANTABILITY, AGAINST INFRINGEMENT, AND FITNESS
# FOR A PARTICULAR PURPOSE.
#
##############################################################################
"""ZMI Support."""
import os
from zope.cachedescriptors.property import Lazy
from zope.publisher.browser import BrowserView

FAVICON_PATH = os.path.join(os.path.dirname(__file__),
    'resources', 'images', 'favicon.ico')

class FavIcon(BrowserView):

    @Lazy
    def icon(self):
        with open(FAVICON_PATH, 'rb') as img:
            return img.read()

    def __call__(self):
        self.request.response.setHeader('Content-Type', 'image/x-icon')
        return self.icon

