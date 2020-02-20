import pynvim

@pynvim.plugin
class StackManagement(object):

    def __init__(self, nvim):
        self.cols = 120
        self.stackEnabled = False
        self.keys = ["à","&","é","\"","'","(","-","è","_","ç"]
        self.nvim = nvim
        self.bufStack = []

    @pynvim.autocmd('BufLeave', pattern='*',eval='expand("<afile>:p")', sync=True)
    def on_BufLeave(self,filename):
        pass

    @pynvim.autocmd('BufCreate', pattern='*',eval='expand("<afile>:p")', sync=True)
    def on_bufCreate(self,filename):
        if(self.stackEnabled):
            self.bufStack.insert(0,filename)
            self.makeStack()
        return


    @pynvim.autocmd('BufDelete', pattern='*', eval='expand("<afile>:p")', sync=True)
    def on_bufDelete(self,filename):
        if(self.stackEnabled):
            self.bufStack.remove(filename)
            self.makeStack()
        return

    @pynvim.command('SwitchBuf', nargs ='*', range ='')
    def switchBuf(self, args, range):
        n = int(args[0])
        if(n >= len(self.bufStack)):
                return
        name = self.bufStack.pop(n)
        self.bufStack.insert(0,name)
        self.makeStack()

    @pynvim.command('IncStack', nargs ='*', range ='')
    def incStack(self, args, range):
        self.cols += int(args[0])
        self.makeStack()

    @pynvim.command('DecStack', nargs ='*', range ='')
    def decStack(self, args, range):
        self.cols -= int(args[0])
        self.makeStack()

    @pynvim.command('StackRaise', nargs ='*', range ='')
    def raiseStack(self, args, range):
        ##Raise Window in the stack
        cb = self.nvim.current.buffer.name
        i = self.bufStack.index(cb)
        if(i > 0):
            self.bufStack[i - 1], self.bufStack[i] = self.bufStack[i], self.bufStack[i-1]
            self.makeStack()

    @pynvim.command('StackFall', nargs ='*', range ='')
    def fallStack(self, args, range):
        ##Raise Window in the stack
        cb = self.nvim.current.buffer.name
        i = self.bufStack.index(cb)
        if(i < len(self.bufStack) - 1):
            self.bufStack[i + 1], self.bufStack[i] = self.bufStack[i], self.bufStack[i+1]
            self.makeStack()

    def initStack(self):
        cb = self.nvim.current.buffer
        self.bufStack = [cb.name]
        bufList = self.nvim.buffers
        for i in bufList:
            if(not(i.name in self.bufStack)):
                self.bufStack.append(i.name)
        self.makeStack()

    def makeStack(self):
        if(len(self.bufStack) <= 1):
            return
        self.nvim.command("only")
        self.nvim.command("edit " + self.bufStack[0])
        current_win = self.nvim.current.window

        width = current_win.width
        bufList = self.nvim.buffers
        f = True
        if(width > self.cols):
            newWidth = width - self.cols
        else:
            newWidth = int(width * 1 / 3)

        for i in self.bufStack[1:]:
            if(f):
                self.nvim.command("{}vsplit {}".format(newWidth, i))
                f = False
            else:
                self.nvim.command("split " + i)
        self.nvim.current.window = current_win


        self.nvim.current.window = current_win


    @pynvim.command('ToggleStack', nargs='*', range='')
    def toggleStack(self, args, range):
        if(self.stackEnabled):
            self.stackEnabled = False
            self.nvim.command("only")
            for k in self.keys:
                try:
                    self.nvim.command("unmap <leader>" + k)
                except:
                    pass
        else:
            self.stackEnabled = True
            for i,k in enumerate(self.keys):
                self.nvim.command("nnoremap <leader>{} :SwitchBuf {} <CR>".format(k,i) )
            self.initStack()

    @pynvim.command('StartStack', nargs ='*', range ='')
    def startStack(self, args, range):
        self.initStack()
