import ast, inspect
import numpy as np
import sympy as sp

def f(a):
    return np.array([np.sin(a), np.cos(a)])

def f2(a):
    return np.array([1, np.sin(a)])

def f3(a):
    return f(a) + f2(a)

translate = {'array': 'Array'}

class np_to_sp(ast.NodeTransformer):
    def visit_Name(self, node):
        if node.id=='np':
            node = ast.copy_location(ast.Name(id='sp', ctx=node.ctx), node)
        return node
    def visit_Attribute(self, node):
        self.generic_visit(node)
        if node.value.id=='sp' and node.attr in translate:
            fields = {k: getattr(node, k) for k in node._fields}
            fields['attr'] = translate[node.attr]
            node = ast.copy_location(ast.Attribute(**fields), node)
        return node

from types import FunctionType

for fn in f3.__code__.co_names:
    fo = globals()[fn]
    if not isinstance(fo, FunctionType):
        continue
    z = ast.parse(inspect.getsource(fo))
    np_to_sp().visit(z)
    exec(compile(z, '', 'exec'))

x = sp.Symbol('x')
print(f(x))
print(f2(x))
print(f3(x))