prologues:=2;
% _metauml_defaults_mp := 1 ; % avoid loading metauml_defaults.mp
% string metauml_defaultFont;
% metauml_defaultFont:="EuroMono-Regular";
% string metauml_defaultFontOblique;
% metauml_defaultFontOblique  := "EuroMono-Regular";
% string metauml_defaultFontBold;
% metauml_defaultFontBold  := "EuroMono-Regular";
% string metauml_defaultFontBoldOblique;
% metauml_defaultFontBoldOblique  := "EuroMono-Regular";

input metauml;
iClass.foreColor := (.8., 1, 0);
iClass.borderColor := (.5., .5, 1);
% Static Factory
beginfig(1);
    Class.Product("Product")()(static "+createProduct(kind : enum): Product", "#Product()");
    Class.Productf("Product1")()();
    Class.Products("Product2")()();
    Class.Client("Client")()("+operation(): void");
    Note.cp("case kind is",
            "   when 1 =>",
            "       return Product1;",
            "   when 2 =>",
            "       return Product2;",
            "   others =>",
            "       return Product;",
            "end case;");
    Note.op("p : Product := Product.createProduct(2);");
    leftToRight(60)(Client, Product);
    topToBottom(20)(Product, cp);
    topToBottom(70)(Client, op);
    topToBottom(50)(Productf, Products);
    leftToRight(50)(Product, Productf);
    drawObjects(Client, Product, Productf, Products, cp, op);
    link(inheritance)(Productf.w -- Product.e);
    link(inheritance)(Products.w -- Product.e);
    link(dependency)(Client.e -- Product.w);
    clink(dashedLink)(Product.methodStack.pict[0],cp);
    clink(dashedLink)(Client.methodStack.pict[0],op);
endfig;
%% Simple Factory
beginfig(2);
    Class.Simplefactory("SimpleFactory")()(static "+createProduct(kind : enum): Product");
    Class.Productx("Product")()();
    Class.Productfx("Product1")()();
    Class.Productsx("Product2")()();
    Class.Clientx("Client")()("+operation(): void");
    Note.cpx("p : Product := SimpleFactory.createProduct(1);");
    Note.opx("case kind is",
            "   when 1 =>",
            "       return Product1;",
            "   when 2 =>",
            "       return Product2;",
            "   others =>",
            "       return Product;",
            "end case;");
    %%leftToRight(70)(Clientx, Simplefactory);
    leftToRight(150)(Clientx, Productx);
    leftToRight(100)(Productx, Productfx);
     topToBottom(50)(Productfx, Productsx);   
    topToBottom(50)(Clientx, cpx);
    topToBottom(50)(Productx, Simplefactory);
    topToBottom(50)(Simplefactory, opx);
    drawObjects(Clientx, Simplefactory, Productx, Productfx, Productsx, cpx, opx);
    link(inheritance)(Productfx.w -- Productx.e);
    link(inheritance)(Productsx.w -- Productx.se);
    link(dependency)(Clientx.e -- Productx.w);
    link(dependency)(Clientx.se -- Simplefactory.nw);
    link(dependency)(Simplefactory.n -- Productx.s);
    item(iStereo)("<<create>>")(obj.w = .5[Simplefactory.n, Productx.s]);
    clink(dashedLink)(Simplefactory.methodStack.pict[0],opx);
    clink(dashedLink)(Clientx.methodStack.pict[0],cpx);
endfig;

%% FactoryMethod
beginfig(3);
    Class.FactoryMethod("FactoryMethod")()(abstract "+createProduct(kind: enum): Product");
    Class.ConcreteFactoryMethoda("ConcreteFactoryMethod1")()("+createProduct(kind: enum): Product");
    Class.ConcreteFactoryMethodb("ConcreteFactoryMethod2")()("+createProduct(kind: enum): Product");
    Class.ProductFM("Product")()();
    Class.ConcreteFactoryMethoda_producta("ConcreteFactoryMethod1_product1")()();
    Class.ConcreteFactoryMethoda_productb("ConcreteFactoryMethod1_product2")()();
    Class.ConcreteFactoryMethodb_producta("ConcreteFactoryMethod2_product1")()();
    Class.ConcreteFactoryMethodb_productb("ConcreteFactoryMethod2_product2")()();
    
    Class.ClientFM("Client")()("+operation(): void");
    Note.cpFM("fm : FactoryMethod := ConcreteFactoryMethod1;",
            "p1 : Product := fm.createProduct(1); - - ConcreteFactoryMethod1_product1", 
            "p2 : Product := fm.createProduct(2); - - ConcreteFactoryMethod1_product2");
    leftToRight(150)(Client, FactoryMethod);
    leftToRight(50)(FactoryMethod, ConcreteFactoryMethoda);
    topToBottom(50)(Client, cpFM);
    topToBottom(20)(ConcreteFactoryMethodb, ConcreteFactoryMethoda);

    topToBottom(50)(FactoryMethod, ProductFM);
    leftToRight(70)(ProductFM, ConcreteFactoryMethoda_productb);
    topToBottom(20)(ConcreteFactoryMethoda_producta, ConcreteFactoryMethoda_productb);
    topToBottom(20)(ConcreteFactoryMethoda_productb, ConcreteFactoryMethodb_producta);
    topToBottom(20)(ConcreteFactoryMethodb_producta, ConcreteFactoryMethodb_productb);

    drawObjects(ClientFM, ProductFM, FactoryMethod, ConcreteFactoryMethoda, ConcreteFactoryMethodb, ConcreteFactoryMethoda_producta, ConcreteFactoryMethoda_productb, ConcreteFactoryMethodb_producta, ConcreteFactoryMethodb_productb, cpFM);
    link(inheritance)(ConcreteFactoryMethoda.w -- FactoryMethod.e);
    link(inheritance)(ConcreteFactoryMethodb.sw -- FactoryMethod.ne);
    link(inheritance)(ConcreteFactoryMethoda_producta.sw -- ProductFM.ne);
    link(inheritance)(ConcreteFactoryMethoda_productb.w -- ProductFM.e);
    link(inheritance)(ConcreteFactoryMethodb_producta.nw -- ProductFM.se);
    link(inheritance)(ConcreteFactoryMethodb_productb.nw -- ProductFM.s);
    link(dependency)(FactoryMethod.s -- ProductFM.n);
    link(dependency)(ClientFM.e -- FactoryMethod.w);
    link(dependency)(ClientFM.e -- ProductFM.w);
    clink(dashedLink)(ClientFM.methodStack.pict[0],cpFM);
endfig;

%% AbstractFactory
beginfig(6);
    Class.AbstractFactory("AbstractFactory")()(abstract "+createProductA(): ProductA", abstract "+createProductB(): ProductB");
        Class_stereotypes.AbstractFactory("<<interface>>");
    Class.ConcreteFactoryX("ConcreteFactoryX")()("+createProductA(): ProductA", "+createProductB(): ProductB");
    Class.ConcreteFactoryY("ConcreteFactoryY")()("+createProductA(): ProductA", "+createProductB(): ProductB");
    Class.ProductA("ProductA")()();
    Class.ProductB("ProductB")()();
    Class.ConcreteFactoryProductAX("ConcreteProductAX")()();
    Class.ConcreteFactoryProductAY("ConcreteProductAY")()();
    Class.ConcreteFactoryProductBX("ConcreteProductBX")()();
    Class.ConcreteFactoryProductBY("ConcreteProductBY")()();
    Class.ClientAF("Client")()("+operation(): void");

    Note.cpAF("f : AbstractFactory := ConcreteFactoryY();",
            "p1 : ProductA := f.createProductA(); - - ConcreteProductAY",
            "p2 : ProductB := f.createProductB(); - - ConcreteProductBY");

%     leftToRight(100)(AbstractFactory, ConcreteFactoryX), ProductA, ConcreteFactoryProductAX);
%     leftToRight(100)(ConcreteFactoryY, ProductB, ConcreteFactoryProductBY);
%     topToBottom(50)(ConcreteFactoryProductBX, ConcreteFactoryProductBY, ConcreteFactoryProductAX, ConcreteFactoryProductAY);
%     topToBottom(50)(ConcreteFactoryX, ClientAF, cpAF);
    topToBottom(100)(AbstractFactory, ClientAF);
    topToBottom(50)(ClientAF, cpAF);
%     topToBottom(50)(ConcreteFactoryX, ConcreteFactoryY);
    leftToRight(50)(ConcreteFactoryX, AbstractFactory, ConcreteFactoryY);
    topToBottom(20)(ConcreteFactoryX, ConcreteFactoryProductAY);
    topToBottom(20)(ConcreteFactoryY, ConcreteFactoryProductBY);
    leftToRight(40)(ConcreteFactoryProductAX, ProductA, ClientAF, ProductB, ConcreteFactoryProductBX);
%     topToBottom(25)( ConcreteFactoryProductAX, ConcreteFactoryProductAY,ConcreteFactoryProductBX, ConcreteFactoryProductBY);
    drawObjects(ClientAF, ProductA, ProductB, AbstractFactory, ConcreteFactoryX, ConcreteFactoryY,  ConcreteFactoryProductAX, ConcreteFactoryProductAY, ConcreteFactoryProductBX, ConcreteFactoryProductBY, cpAF);
    link(inheritance)( ConcreteFactoryX.e -- AbstractFactory.w );
    link(inheritance)( ConcreteFactoryY.w -- AbstractFactory.e );
    link(inheritance)( ConcreteFactoryProductAX.e -- ProductA.w );
    link(inheritance)( ConcreteFactoryProductAY.s -- ProductA.n );
    link(inheritance)( ConcreteFactoryProductBX.w -- ProductB.e );
    link(inheritance)( ConcreteFactoryProductBY.s -- ProductB.n );
    link(dependency)( ClientAF.n -- AbstractFactory.s );
    link(dependency)( ClientAF.w -- ProductA.e );
    link(dependency)( ClientAF.e -- ProductB.w );
    link(dependency)( ClientAF.nw -- ConcreteFactoryX.se);
    link(dependency)( ClientAF.ne -- ConcreteFactoryY.sw );
    clink(dashedLink)( ClientAF.methodStack.pict[0], cpAF );
endfig;

%% Composite
beginfig(4);
    Class.Componentd("Component")()(abstract "+traverse() : void");
    Class.Composited("Composite")("-components: array of Component")("+traverse() : void");
    Class.Leafd("Leaf")()("+traverse() : void");
    Note.traverse("for c in components loop",
                "    c.traverse();",
                "end loop;");
    leftToRight(50)(Componentd, Composited);
    topToBottom(50)(Composited, traverse);
    topToBottom(50)(Componentd, Leafd);
    %topToBottom(50)(Componentd, Leafd);
    drawObjects(Componentd, Leafd, Composited, traverse);
    link(inheritance)(Composited.w -- Componentd.e);
    link(inheritance)(Leafd.n -- Componentd.s);
    clink(dashedLink)(Composited.methodStack.pict[0],traverse);
endfig;
%% Observer
beginfig(5);
    Class.subject("Subject")("-observers : array of Observer")
                 ("+attach(o : Observer)", "+detach(o : Observer)", "+notify()");

    Class.observer("Observer")()("+update()");
    Class_stereotypes.observer("<<interface>>");

    Class.concreteSubject("ConcreteSubject")("-subjectState")("+getState()", "+setState()");
    Class.concreteObserver("ConcreteObserver")("-observerState")("+update()");

    Note.noteNotify("for o in observers loop", "    o->update();", "end loop;");
    Note.noteGetState("return subjectState");
    Note.noteUpdate("observerState := ", "subject->getState()");

    observer.w = subject.e + (90, 0);
    concreteSubject.n = subject.s - (0, 80);

    concreteObserver.top = concreteSubject.top;
    concreteObserver.midx = observer.midx;

    noteNotify.n = subject.se - (-20, 10);
    noteGetState.nw = concreteSubject.se - (0, 20);
    noteUpdate.nw = concreteObserver.e + (20, 1);

    drawObjects(subject, observer, concreteSubject, concreteObserver, noteNotify, noteGetState, noteUpdate);

    clink(associationUni)(subject, observer);
    link(associationUni)(pathHorizontal(concreteObserver.w, concreteSubject.right));

    clink(inheritance)(concreteSubject, subject);
    clink(inheritance)(concreteObserver, observer);

    link(dashedLink)(subject.methodStack.pict[2].e -- noteNotify.nw + (10, 0));
    link(dashedLink)(concreteSubject.methodStack.pict[0].e -- noteGetState.n - (10, 0));
    link(dashedLink)(pathHorizontal(concreteObserver.methodStack.pict[0].e, noteUpdate.left));

    item(iAssoc)("subject#1")(obj.w = concreteSubject.e + (15, 11));
endfig;
%% Adapter
beginfig(7);
    Class.clientA("Client")()();
    Class.target("Target")()("+request()");
    Class.adaptee("Adaptee")()("+specificRequest()");
    Class.adapter("Adapter")()("+request()");

    Note.noteRequest("specificRequest()");

    leftToRight(50)(clientA, target, adaptee);
    topToBottom(50)(target, adapter);
    leftToRight(50)(adapter.methodStack.pict[0], noteRequest);

    drawObjects(clientA, target, adaptee, adapter, noteRequest);

    clink(dependency)(clientA, target);
    link(inheritance)(adapter.n -- target.s);
    link(inheritance)(adapter.n -- adaptee.w);

    link(dashedLink)(adapter.methodStack.pict[0].e -- noteRequest.w);
endfig;
%% Adapter
beginfig(8);
    Class.ClientA("Client")()();
    Class.Target("Target")()("+request()");
    Class.Adaptee("Adaptee")()("+specificRequest()");
    Class.Adapter("Adapter")("-adaptee: Adaptee")("+request()");
    Note.noteRequestA("adaptee.specificRequest()");
    leftToRight(50)(ClientA, Target, Adaptee);
    topToBottom(50)(Target, Adapter);
    leftToRight(50)(Adapter.methodStack.pict[0], noteRequestA);
    drawObjects(ClientA, Target, Adaptee, Adapter, noteRequestA);
    link(dependency)(ClientA.e -- Target.w);
    link(inheritance)(Adapter.n -- Target.s);
    link(dependency)(Adapter.n -- Adaptee.w);
    link(dashedLink)(Adapter.methodStack.pict[0].e -- noteRequestA.w);
endfig;

%% Proxy

beginfig(9);
Class.Proxy("Proxy")()("+operation(): void");
Class.ClientProxy("Client")()();
Class.SubjectProxy("Subject")()("+operation(): void");
Class_stereotypes.SubjectProxy("<<interface>>");
Class.ActualSubject("ActualSubject")()("+operation(): void");

leftToRight(50)(ClientProxy,  SubjectProxy, ActualSubject);
topToBottom(50)(SubjectProxy, Proxy);
% leftToRight(50)(Proxy,  ActualSubject);
drawObjects(Proxy, ClientProxy, SubjectProxy, ActualSubject);

link(inheritance)(Proxy.n -- SubjectProxy.s);
link(inheritance)(ActualSubject.w -- SubjectProxy.e);
link(dependency)(ClientProxy.e -- SubjectProxy.w);
link(associationUni)(Proxy.e -- ActualSubject.s);
item(iStereo)("<<delegate>>")(obj.n = .5[Proxy.e, ActualSubject.w]);
endfig;

%% StairWay to Heaven
beginfig(10);
Class.Optional("Optional")()();
Class.OptionalOne("OptionalOne")()();
Class.OptionalTwo("OptionalTwo")()();
Class.OptionalThree("OptionalThree")()("+h()");
Class.PrimaryOne("PrimaryOne")()();
Class.PrimaryTwo("PrimaryTwo")()();
Class.PrimaryThree("PrimaryThree")()();
Note.caseSTH("p : PrimaryOne := ... ;", "opt : OptionalThree := OptionalThree'Class(p);",
        "if opt then",
        "    opt.h();",
        "end if;"
        );
leftToRight(70)(PrimaryThree, PrimaryTwo, PrimaryOne);
topToBottom(50)(PrimaryThree, OptionalThree);
leftToRight(70)(OptionalThree, OptionalTwo, OptionalOne);
topToBottom(50)(OptionalOne, Optional);
topToBottom(20)(OptionalTwo, caseSTH);
% topToBottom(50)(PrimaryTwo, OptionalTwo);
% topToBottom(50)(PrimaryOne, OptionalOne);

drawObjects(Optional, OptionalOne, OptionalTwo, OptionalThree, PrimaryOne, PrimaryTwo, PrimaryThree, caseSTH);

link(inheritance)(PrimaryThree.e -- PrimaryTwo.w);
link(inheritance)(PrimaryTwo.e -- PrimaryOne.w);
link(inheritance)(OptionalOne.s -- Optional.n);
link(inheritance)(OptionalThree.e -- OptionalTwo.w);
link(inheritance)(OptionalTwo.e -- OptionalOne.w);
link(inheritance)(OptionalThree.n -- PrimaryThree.s);
link(inheritance)(OptionalTwo.n -- PrimaryTwo.s);
link(inheritance)(OptionalOne.n -- PrimaryOne.s);
item(iStereo)("<<virtual>>")(obj.n = .5[PrimaryThree.e, PrimaryTwo.w]);
item(iStereo)("<<virtual>>")(obj.n = .5[PrimaryTwo.e, PrimaryOne.w]);
item(iStereo)("<<virtual>>")(obj.w = .5[PrimaryThree.e, OptionalThree.w]);
item(iStereo)("<<virtual>>")(obj.w = .5[PrimaryTwo.e, OptionalTwo.w]);
item(iStereo)("<<virtual>>")(obj.w = .5[PrimaryOne.e, OptionalOne.w]);

endfig;

%% Visitor
beginfig(11);
Class.ClientVisitor("Client")()("+operation()");
Class.Element("Element")()("+accept(visitor: Visitor)");
Class.ElementA("ElementA")()("+accept(visitor: Visitor)");
Class.ElementB("ElementB")()("+accept(visitor: Visitor)");
Note.noteElementA("visitor.visit(this)");
Note.noteClient("visitorA: VisitorA := ...;", "visitorB : VisitorB := ...;",
    "for e in elements loop", "    e.accept(visitorA);",
    "    e.accept(visitorA);", "end loop;");
Class.Visitor("Visitor")()("+visit(element: ElementA)", "+visit(element: ElementB)");
Class.VisitorA("VisitorA")()("+visit(element: ElementA)", "+visit(element: ElementB)");
Class.VisitorB("VisitorB")()("+visit(element: ElementA)", "+visit(element: ElementB)");
Class_stereotypes.Visitor("<<interface>>");
leftToRight(50)(ElementA, Element, ElementB);
leftToRight(50)(VisitorA, Visitor, VisitorB);
leftToRight(50)(ClientVisitor, noteClient);
topToBottom(30)(Element, ClientVisitor, Visitor);
topToBottom(30)(ElementA, noteElementA);

drawObjects(ClientVisitor, Element, ElementA, ElementB, Visitor, VisitorA, VisitorB, noteElementA, noteClient);
clink(inheritance)(ElementA, Element);
clink(inheritance)(ElementB, Element);
clink(inheritance)(VisitorA, Visitor);
clink(inheritance)(VisitorB, Visitor);
link(dashedLink)(ElementA.methodStack.pict[0].s -- noteElementA.n);
link(dashedLink)(ClientVisitor.methodStack.pict[0].e -- noteClient.w);
endfig;

%% TODO Acyclic Visitor 16
beginfig(16);
Class.AVisitor("Visitor")()();
Class.AElement("Element")()("+accept(visitor: Visitor)");
Class.AElementA("ElementA")()("+accept(visitor: Visitor)");
Class.AElementB("ElementB")()("+accept(visitor: Visitor)");
Class.AElementC("ElementC")()("+accept(visitor: Visitor)");
Class.AElementVA("ElementAVisitor")()("+visit(e: ElementA)");
Class.AElementVB("ElementBVisitor")()("+visit(e: ElementB)");
Class.AElementVC("ElementCVisitor")()("+visit(e: ElementC)");
Class.ActualVisitor("ActualVisitor")()();
Note.noteAElementA("v : ElementAVisitor := ElementAVisitor'Class(visitor);", "if v then", "    v.visit(this);", "end if;");
leftToRight(50)(AElementA, AElementB, AElementC);
leftToRight(50)(AElementVA, AElementVB, AElementVC);
topToBottom(30)(AElement, AElementB, AElementVB, ActualVisitor);
leftToRight(50)(noteAElementA, ActualVisitor, AVisitor);
drawObjects(ActualVisitor, AVisitor, noteAElementA,
        AElement, AElementA, AElementB, AElementC,
        AElementVC, AElementVA, AElementVB);
clink(inheritance)(AElementA, AElement);
clink(inheritance)(AElementB, AElement);
clink(inheritance)(AElementC, AElement);
clink(inheritance)(ActualVisitor, AElementVA);
clink(inheritance)(ActualVisitor, AElementVB);
clink(inheritance)(ActualVisitor, AElementVC);
clink(inheritance)(ActualVisitor, AVisitor);
link(dashedLink)(AElementA.methodStack.pict[0].sw -- noteAElementA.n);
endfig;

%% Decorator
beginfig(12);
Class.SubjectDecorator("Subject")()("+operation()");
Class.SubjectInterface("Interface")()("+operation()");
Class_stereotypes.SubjectInterface("<<interface>>");
Class.Decorator("Decorator")("-wrappee: Subject")("+operation()");
Class.OptionalA("OptionalA")()("+operation()");
Class.OptionalB("OptionalB")()("+operation()");
Note.noteDecorator("wrappee.operation()");
Note.noteOptionalA("Supper.operation();", "-- Do more things");
Note.noteCase("subject : Subject := new Subject(new OptionalA(new OptionalB()));");
leftToRight(50)(SubjectDecorator, SubjectInterface, Decorator);
topToBottom(50)(OptionalA, Decorator, OptionalB);
topToBottom(50)(noteOptionalA, SubjectInterface, noteDecorator);
topToBottom(100)(noteCase, SubjectInterface);
drawObjects(SubjectDecorator, SubjectInterface, Decorator, OptionalA, OptionalB, noteCase, noteDecorator, noteOptionalA);
clink(inheritance)(SubjectDecorator, SubjectInterface);
clink(inheritance)(Decorator, SubjectInterface);
clink(inheritance)(OptionalA, Decorator);
clink(inheritance)(OptionalB, Decorator);
link(dashedLink)(OptionalA.methodStack.pict[0].sw -- noteOptionalA.se);
link(dashedLink)(Decorator.methodStack.pict[0].w -- noteDecorator.e);
endfig;

%% Extension Object
beginfig(13);
Class.SubjectExtension("Subject")()("+getExtension(kind : enum) : Extension", "+addExtension(kind : enum; extension : Extension)");
Class_stereotypes.SubjectExtension("<<interface>>");
Class.Extension("Extension")()();
Class.AbstractExtensionA("AbstractExtensionA")()("+operation()");
Class.AbstractExtensionB("AbstractExtensionB")()("+operation()");
Class_stereotypes.AbstractExtensionA("<<interface>>");
Class_stereotypes.AbstractExtensionB("<<interface>>");
Class.ConcreteExtensionA("ConcreteExtensionA")()("+operation()");
Class.ConcreteExtensionB("ConcreteExtensionB")()("+operation()");
Class.ConcreteSubject("ConcreteSubject")()("+getExtension(kind : enum) : Extension", "+addExtension(kind : enum; extension : Extension)");
Note.caseExtension("subject : Subject := ...; - - some ConcreteSubject",
    "extension : ConcreteExtensionA := subject.getExtension(Kind_A);",
    "if extension then", "    extension.operation();", "end if;");
leftToRight(70)(ConcreteExtensionA, AbstractExtensionA, SubjectExtension);
leftToRight(100)(ConcreteSubject, Extension);
leftToRight(70)(ConcreteExtensionB, AbstractExtensionB);
topToBottom(60)(ConcreteExtensionA, ConcreteSubject, ConcreteExtensionB);
% topToBottom(90)(AbstractExtensionA, Extension);
topToBottom(110)(SubjectExtension, caseExtension);
drawObjects(SubjectExtension, ConcreteSubject, Extension, AbstractExtensionA,
            AbstractExtensionB, ConcreteExtensionA, ConcreteExtensionB, caseExtension);
link(inheritance)(pathStepY(ConcreteSubject.n, SubjectExtension.s, 25));
link(inheritance)(pathStepY(AbstractExtensionA.s, Extension.n, -15));
link(inheritance)(pathStepY(AbstractExtensionB.n, Extension.s, 15));

clink(aggregationUni)(Extension, ConcreteSubject);
% clink(aggregationUni)(ConcreteExtensionA, ConcreteSubject);
% clink(aggregationUni)(ConcreteExtensionB, ConcreteSubject);
% clink(dependency)(Extension, ConcreteSubject);
clink(inheritance)(ConcreteExtensionA, AbstractExtensionA);
clink(inheritance)(ConcreteExtensionB, AbstractExtensionB);
item(iStereo)("<<realize>>")(obj.n = .5[ConcreteExtensionA.e, AbstractExtensionA.w]);
item(iStereo)("<<realize>>")(obj.n = .5[ConcreteExtensionB.e, AbstractExtensionB.w]);
item(iStereo)("<<realize>>")(obj.n = ConcreteSubject.ne + (20, 20));
endfig;

%% Bridge
beginfig(14);
    Class.ClientBridge("Client")()();
    Class.Encapsulation("EncapsulationInterface")("-platform : PlatformInterface ")("+domainFunction()");
    Class.Platform("PlatformInterface")()("+domainFunctionA()", "+domainFunctionB()");
    Class.PlatformX("PlatformImplementationX")()("+domainFunctionA()");
    Class.PlatformY("PlatformImplementationY")()("+domainFunctionB()");
    Class.Specialization("Specialization")()();
    Note.noteEncaps("platform.domainFunctionA();", "platform.domainFunctionB();");

    leftToRight(50)(ClientBridge, Encapsulation, Platform);
    topToBottom(50)(Specialization, Encapsulation, noteEncaps);
    topToBottom(50)(PlatformX, Platform, PlatformY);

    drawObjects(ClientBridge, Encapsulation, Platform, PlatformX, PlatformY, Specialization, noteEncaps);
    link(dependency)(ClientBridge.e -- Encapsulation.w);
    link(inheritance)(Specialization.s -- Encapsulation.n);
    link(dependency)(Encapsulation.e -- Platform.w);
    link(inheritance)(PlatformX.s -- Platform.n);
    link(inheritance)(PlatformY.n -- Platform.s);
    link(dashedLink)(Encapsulation.methodStack.pict[0].s -- noteEncaps.n);
endfig;

%% State
beginfig(15);
Class.StateX("State")("-state : State")("+handle()");
Class.Context("Context")()("+request()");
Class.StateA("StateA")()("+handle()");
Class.StateB("StateB")()("+handle()");
Note.noteContext("state.handle()");
leftToRight(100)(Context, StateX);
leftToRight(50)(noteContext, StateA, StateB);
topToBottom(60)(Context, noteContext);
drawObjects(Context, StateX, StateA, StateB, noteContext);
link(inheritance)(StateA.n -- StateX.s);
link(inheritance)(StateB.n -- StateX.s);
link(association)(StateX.w -- Context.e);
link(dashedLink)(Context.methodStack.pict[0].s -- noteContext.n);

endfig;


end

