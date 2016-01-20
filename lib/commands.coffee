# Utils
# -------------------------
dispatch = (target, command) ->
  atom.commands.dispatch(target, command)

# ex command
# -------------------------
w = ({editor}) ->
  editor.save()

wq = ({editor, editorElement}) ->
  editor.save()
  dispatch(editorElement, 'core:close') # FIXME
  # atom.workspace.closeActivePaneItemOrEmptyPaneOrWindow()

# Configuration switch
# -------------------------

# Util
toggleConfig = (param) ->
  value = atom.config.get(param)
  atom.config.set(param, not value)

showInvisible = ->
  toggleConfig('editor.showInvisibles')

softWrap = ({editorElement}) ->
  dispatch(editorElement, 'editor:toggle-soft-wrap')

indentGuide = ({editorElement}) ->
  dispatch(editorElement, 'editor:toggle-indent-guide')

lineNumbers = ({editorElement}) ->
  dispatch(editorElement, 'editor:toggle-line-numbers')

# When number was typed
# -------------------------
moveToLine = (vimState, count) ->
  vimState.count.set(count)
  vimState.operationStack.run('MoveToFirstLine')

moveToLineByPercent = (vimState, count) ->
  vimState.count.set(count)
  vimState.operationStack.run('MoveToLineByPercent')

module.exports = {
  normalCommands: {
    w, wq,
  }
  toggleCommands: {
    showInvisible
    softWrap
    indentGuide
    lineNumbers
  }
  numberCommands: {
    moveToLine
    moveToLineByPercent
  }
}
