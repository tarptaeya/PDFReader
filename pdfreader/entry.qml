import org.kde.falkon 1.0 as Falkon

Falkon.PluginInterface {
    init: function() {}
    testPlugin: function() { return true }
    unload: function() {}
    
    acceptNavigationRequest: function(tab, url, type, isMainFrame) {
        var path = 'file://' + Falkon.FileUtils.resolve('pdfjs/web/viewer.html')
        if (!url.startsWith(path) && url.endsWith('.pdf')) {
            path = path + '?file=' + url
            tab.load(path)
            return false
        }
        return true
    }
}
