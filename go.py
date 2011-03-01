#!/usr/bin/env python
# verion 0.1
# * put file in path (~/bin)
# * rename to just go.py
# * figure out how to get it to cd
#     * http://stackoverflow.com/questions/3786678/change-working-directory-in-shell-with-a-python-script
#
# todo
# * add better help messages
# * add pycco comments
# * add README
# * add bash-completion
#     * port install bash-autocompletion
#     * figure out how to get it all working
#     To use bash_completion, add the following lines at the end of your .bash_profile
#     if [ -f /opt/local/etc/bash_completion ]; then
#         . /opt/local/etc/bash_completion
#     fi
# * add error detection and responses
# * can we store a description somewhere?

import os
import sys
import json

class GoClass:
    
    major = 0
    build = 6
    commands = {
                    'add': '\tAdd current path using the directory name as alias',
                    'del': '\tRemove current path',
                    'help': '\tPrint this help screen',
                    'version': 'Print build version'
                }
    
    @staticmethod
    def version():
        return 'go version ' + str(GoClass.major) + '.' + str(GoClass.build)
    
    def __init__(self):
        self.default = {'info' : {'name' : 'go settings file', 'website' : 'http://www.github.com/rookie/go', 'version' : 1}, 'paths' : {'home' : '~'}}
        self.filename = os.path.expanduser('~/.go/go-config.json')
        self.d = self.default
        self.load()
    
    def reset(self):
        self.d = self.default
        self.save()
    
    def save(self):
        f = open(self.filename, 'w')
        json.dump(self.d, f, sort_keys=True, indent=4)
        f.close()
    
    def load(self):
        try:
            if os.path.exists(self.filename):
                f = open(self.filename, 'r')
                self.d = json.load(f)
            else:
                self.reset()
        except IOError:
            self.reset()
    
    def listPaths(self):
        maxlen = 0
        for key in self.d['paths']:
            if len(key) > maxlen:
                maxlen = len(key)
        print 'Paths:'
        keys = self.d['paths'].keys()
        keys.sort()
        for key in keys:
            keyFormatted = key
            while len(keyFormatted) < maxlen:
                #keyFormatted += ' '
                keyFormatted = ' ' + keyFormatted
            print '  ' + keyFormatted + '  ' + self.d['paths'][key]
    
    def completeOptions(self):
        for key in self.d['paths']:
            print key + ' ',
        print ''
    
    def addPath(self, path):
        alias = os.path.split(path)[1]
        self.addPathAdv(path, alias)
    
    def addPathAdv(self, path, alias):
        if os.path.isdir(path):
            self.d['paths'][alias] = path
            print 'add ' + alias + ': ' + path
            self.save()
    
    def delAlias(self, alias):
        if alias in self.d['paths']:
            print 'delete ' + alias + ': ' + self.d['paths'][alias]
            del self.d['paths'][alias]
            self.save()
    
    def delPath(self, path):
        for key in self.d['paths']:
            if self.d['paths'][key] == path:
                self.delAlias(key)
                break
    
    def runCommand1(self, cmd):
        path = os.getcwd()
        if(cmd == 'version'):
            print self.version()
        elif(cmd == 'add'):
            self.addPath(path)
        elif(cmd == 'del'):
            self.delPath(path)
        elif(cmd == 'help'):
            print 'usage: go [COMMAND] [ALIAS]\n'
            print 'Commands include'
            for each in self.commands:
                print '   '+each + '\t' + self.commands[each]
    
    def runCommand2(self, cmd, alias):
        path = os.getcwd()
        if(cmd == 'add'):
            self.addPathAdv(path, alias)
        elif(cmd == 'del'):
            self.delAlias(alias)
        elif(cmd == 'help'):
            if alias in self.commands:
                print alias + ': ' + self.commands[alias]
    
    def cdAlias(self, alias):
        if alias in self.d['paths']:
            print 'GOCD ' + os.path.expanduser(self.d['paths'][alias])
    

def main():
    go = GoClass()
    #if no args, list directories
    if len(sys.argv) == 1:
        go.listPaths()
    #go add, go del, go help, go home, go dropbox
    if len(sys.argv) == 2:
        #check first arg for a command, commands take precedence
        if sys.argv[1] == 'complete':
            go.completeOptions()
        elif sys.argv[1] in GoClass.commands:
            #print 'found command: ' + sys.argv[1]
            go.runCommand1(sys.argv[1])
        #check first arg for an alias
        elif sys.argv[1] in go.d['paths']:
            go.cdAlias(sys.argv[1])
        else:
            print 'go: ' + sys.argv[1] + ': No such alias'
    #go add alias, go delete alias
    if len(sys.argv) == 3:
        #check first arg for a command, commands take precedence
        if sys.argv[1] in GoClass.commands:
            go.runCommand2(sys.argv[1], sys.argv[2])
    
# Run the script.
if __name__ == "__main__":
    main()