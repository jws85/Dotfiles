# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

import dracula.draw
import os.path

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# Default bindings: https://qutebrowser.org/doc/help/settings.html#bindings.commands

config.unbind('[[', mode='normal')
config.unbind('{{', mode='normal')
config.unbind(']]', mode='normal')
config.unbind('}}', mode='normal')
config.unbind('J', mode='normal')
config.unbind('K', mode='normal')
config.unbind('ss', mode='normal')

config.bind('J', 'scroll-page 0 1')
config.bind('K', 'scroll-page 0 -1')
config.bind('[', 'tab-prev')
config.bind(']', 'tab-next')
config.bind('{', 'tab-move -')
config.bind('}', 'tab-move +')
config.bind('s', 'set-cmd-text -s :buffer ')

# make aliases to run javascript bookmarklets and userscripts
c.aliases.update({
    'dark-mode': "open javascript:document.querySelectorAll('*').forEach(e=>e.setAttribute('style','background-color:#222;background-image:none;color:#'+(/^A|BU/.test(e.tagName)?'36c;text-decoration:underline;':'eee;')+e.getAttribute('style')))",

    # Talk to KeepassXC via its browser interface
    'keepassxc': "spawn --userscript qute-keepassxc -k 'jwsmith2spam@gmail.com'",

    # I don't like bookmarks; I find they get holed up in a walled garden that nothing
    # can leave.  I use quickmarks, but other than that, I like to make org-roam captures
    # of a page I'm interested in coming back to, which the below does.  The :roam command
    # is defined in the aliases.
    'roam-save': "open javascript:location.href='org-protocol://roam-ref?template=r&ref='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title)",
    'roam-load': "spawn --userscript ~/.local/bin/rofi-roam-bookmarks",

    # Load current URL in the Wayback Machine
    'wayback-load': "open javascript:location.href='https://web.archive.org/web/*/'+location.href.replace(/\\/$/,'')",
})

# and then make shortcuts for same, using comma as the leader key
config.bind(',d', "dark-mode")
config.bind(',bm', 'roam-save')
config.bind(',bb', 'roam-load')
config.bind(',k', 'keepassxc')
config.bind(',w', "wayback-load")

c.auto_save.session = True
c.completion.use_best_match = True
c.confirm_quit = ['downloads']
c.downloads.position = 'bottom'
c.fonts.default_size = '11pt'
c.url.default_page = 'about:config'
c.url.start_pages = ['about:config']

# site-specific configuration
if os.path.exists(os.path.expanduser('~/.config/qutebrowser/site.py')):
    config.source('site.py')
