class A:
    def a(self):
        pass
    t=5

b=A()

A.k=lambda x:x.t
print b.k()