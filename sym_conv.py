import ast, inspect
import numpy as np
import sympy as sp

def f(a):
    return np.array([np.sin(a), np.cos(a)])

z = ast.parse(inspect.getsource(f))

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

np_to_sp().visit(z)

exec(compile(z, '', 'exec'))

x = sp.Symbol('x')
print(f(x))