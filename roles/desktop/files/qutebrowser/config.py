import dracula.draw

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
# I don't use bookmarks
config.unbind('M', mode='normal')

config.bind('J', 'scroll-page 0 1')
config.bind('K', 'scroll-page 0 -1')
config.bind('[', 'tab-prev')
config.bind(']', 'tab-next')
config.bind('{', 'tab-move -')
config.bind('}', 'tab-move +')
config.bind('s', 'buffer ')

# I don't like bookmarks; I find they get holed up in a walled garden that nothing
# can leave.  I use quickmarks, but other than that, I like to make org-roam captures
# of a page I'm interested in coming back to, which the below does.  The :roam command
# is defined in the aliases.
config.bind('M', 'roam')

# aliases to run javascript bookmarklets
c.aliases.update({
    'roam': "open javascript:location.href='org-protocol://roam-ref?template=r&ref='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title)",
    'dark': "open javascript:document.querySelectorAll('*').forEach(e=>e.setAttribute('style','background-color:#222;background-image:none;color:#'+(/^A|BU/.test(e.tagName)?'36c;text-decoration:underline;':'eee;')+e.getAttribute('style')))"
})

c.auto_save.session = True
c.completion.use_best_match = True
c.confirm_quit = ['downloads']
c.downloads.position = 'bottom'
c.fonts.default_size = '11pt'
c.url.default_page = 'about:config'
c.url.start_pages = ['about:config']
