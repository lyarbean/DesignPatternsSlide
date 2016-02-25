
import QtQuick 2.5
import QtQuick.Controls 1.4

//import QtQml.Models 2.1
// import "CreateState.js" as CreateState
ApplicationWindow {
    id: app
    visible: true
    visibility: "Maximized"
    title: qsTr("Design Pattern")
    color: "white"
    property real fontScale: app.width ? Math.min(app.width / 1920, app.height / 1080) : 1
    property var allFrameObjects: ([null, a0, idPackage, a1, a2, a3, a41, a42, a43, a51, a52, a61, a62, a63, a64, a65, a7])
    BackGround {
        id: root
        AnchorItem {
            id: a0
            xScale: 1 / 2.0
            yScale: 1 / 2.0
            zScale: 1 / 2.0
            Text {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                text: "敏捷软件开发: 原则、模式与实践  (续)"
                font.pointSize: 48 * fontScale
                horizontalAlignment: Text.AlignRight
                Text {
                    anchors.top: parent.bottom
                    anchors.topMargin: 20
                    anchors.right: parent.right
                    text: "颜烈彬（Bean Yan）"
                    font.pointSize: 24 * fontScale
                    horizontalAlignment: Text.AlignRight
                }
            }
        }
        AnchorItem {
            id: idPackage
            x: parent.width / 2
            y: parent.height / 4
            xScale: 1 / 8
            yScale: 1 / 8
            zScale: 1 / 8
            subframeCount: 3
            Text {
                font.pointSize: 72 * fontScale
                text: "20 包(Package)"
            }
            SectionItemOne {
                subhead: "即模块，可以蕴含子模块，用于组织一类物件"
                gallery: "box-158523_960_720.png" // TODO
                subframeIndex: 1
            }
            // TODO split me
            SectionItem {
                subframeIndex: 2
                Column {
                    anchors.fill: parent
                    spacing: 15
                    Text {
                        font.pointSize: 32 * fontScale
                        text: "粒度：包的内聚性原则"
                    }
                    Text {
                        x: 64
                        font.pointSize: 24 * fontScale
                        text: "重用发布等价原则：可重用的是可发布的，可发布的是可重用的"
                    }
                    Text {
                        x: 64
                        font.pointSize: 24 * fontScale
                        text: "共同重用原则: 有人打你的右脸，连左脸也转过来由他打"
                    }
                    Text {
                        x: 64
                        font.pointSize: 24 * fontScale
                        text: "共同封闭原则：自家事自家人解决"
                    }

                    Text {
                        font.pointSize: 32 * fontScale
                        text: "稳定性：包的耦合性原则"
                    }
                    Text {
                        x: 64
                        font.pointSize: 24 * fontScale
                        text: "无环依赖原则：叉烧包和豆沙包" // TODO
                    }

                    Text {
                        font.pointSize: 32 * fontScale
                        text: "稳定性依赖原则：哪边的树大就靠哪边"
                    }
                    Text {
                        x: 64
                        font.pointSize: 24 * fontScale
                        text: "稳定性度量：对己依赖的外部类的数目与包内外相关类的数目(总数)之比" // TODO
                    }
                    Text {
                        font.pointSize: 32 * fontScale
                        text: "稳定抽象原则：毕加索的画有多少?"
                    }
                    Text {
                        x: 64
                        font.pointSize: 24 * fontScale
                        text: "抽象性度量：该包中抽象类与该包中总的类数目之比" // TODO
                    }
                    Text {
                        font.pointSize: 32 * fontScale
                        text: "主序列与距离：抽象性与稳定性的二维图"
                    }
                }
            }
        }
        AnchorItem {
            id: a1
            x: parent.width / 2
            y: 0
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4
            focus: true
            Text {
                text: "21 工厂模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 8
            SectionItemOne {
                subframeIndex: 1
                subhead: "当需要实施依赖倒置原则，即依赖于抽象类，而非具体类时"
                gallery: "factory.png"
            }
            SectionItem {
                subframeIndex: 2
                Column {
                    spacing: 32
                    Text {
                        font.pointSize: 32 * fontScale
                        text: "工厂方法：以接口来创建对象，但由接口的子类来决定对象类型"
                    }
                    Text {
                        font.pointSize: 32 * fontScale
                        text: "静态工厂"
                    }
                    Text {
                        font.pointSize: 32 * fontScale
                        text: "简单工厂"
                    }
                    Text {
                        font.pointSize: 32 * fontScale
                        text: "抽象工厂：以接口来创建家族式对象，而无须指定该族所属的具体类型"
                    }
                }
            }
            SectionItemOne {
                subframeIndex: 3
                subhead: "静态工厂（Static Factory）"
                gallery: "dp/StaticFactory.png"
            }
            SectionItemOne {
                subframeIndex: 4
                subhead: "简单工厂（Simple Factory）"
                gallery: "dp/SimpleFactory.png"
            }
            SectionItemOne {
                subframeIndex: 5
                subhead: "工厂方法（Factory Method）"
                gallery: "dp/FactoryMethod.png"
            }
            SectionItemOne {
                subframeIndex: 6
                subhead: "抽象工厂（Abstract Factory）"
                gallery: "dp/AbstractFactory.png"
            }
            SectionItemOne {
                subframeIndex: 7
                subhead: "问题"
                Column {
                    y: parent.height / 3
                    spacing: 32
                    Text {
                        font.pointSize: 48 * fontScale
                        text: "使用工厂方法重构现有代码的开销不可轻视"
                    }
                    Text {
                        font.pointSize: 48 * fontScale
                        text: "抽象工厂增加了代码的复杂度，如何有效抽象代码是关键的一步"
                    }
                }
            }
        }
        AnchorItem {
            id: a2
            x: parent.width * 3 / 4
            y: 0
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4
            Text {
                text: "23 组合模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 3
            SectionItemOne {
                subframeIndex: 1
                subhead: "毕达哥拉斯分形树"
                gallery: "Pythagoras_tree_1_1_13.svg.png"
            }
            SectionItemOne {
                subframeIndex: 2
                subhead: "将多个具有相似功能的对象以树状的方式组织在一起"
                gallery: "dp/Composite.png"
            }
        }
        AnchorItem {
            id: a3
            x: parent.width * 3 / 4
            y: parent.height / 4
            //            angle: 120
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4
            Text {
                text: "24 观察者模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 3
            SectionItemOne {
                subframeIndex: 1
                subhead: "定义一对多的关联关系，实现状态同步"
                gallery: "classroom-cartoon.jpg"
            }
            SectionItemOne {
                subframeIndex: 2
                gallery: "dp/Observer.png"
            }
            //            SectionItemOne {
            //                subframeIndex: 2
            //                subhead: "思考利弊"
            //                Text {
            //                    font.pointSize: 48 * fontScale
            //                    text: "观察者模式是一个开销较大的模式"
            //                }
            //            }
        }
        AnchorItem {
            id: a41
            x: parent.width * 3 / 4
            y: parent.height / 2
            //            angle: 120
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4
            Text {
                text: "25.1 抽象服务器模式"
                font.pointSize: 72 * fontScale
            }

            subframeCount: 3
            SectionItemOne {
                subframeIndex: 1
                subhead: "按基因继承，而非财产"
            }
            SectionItemOne {
                subframeIndex: 2
                subhead: "当多个类型不存在继承关系，却有类似的行为被使用时，意味着它们是使用共有接口的，抽象之！"
            }
        }
        AnchorItem {
            id: a42
            x: parent.width * 3 / 4
            y: parent.height * 3 / 4
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4
            Text {
                text: "25.2 适配器模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 6
            SectionItemOne {
                subframeIndex: 1
                subhead: "适配器将两个不兼容的接口串在一起"
                gallery: "adapter_ele.jpg"
            }
            SectionItemOne {
                subframeIndex: 2
                subhead: "继承结构"
                gallery: "dp/AdapterA.png"
            }
            SectionItemOne {
                subframeIndex: 3
                subhead: "组合结构"
                gallery: "dp/AdapterB.png"
            }
            SectionItemOne {
                subframeIndex: 4
                subhead: "问题"
                Text {
                    y: parent.height / 3
                    font.pointSize: 48 * fontScale
                    width: parent.width
                    wrapMode: Text.Wrap
                    text: "<p>1. 适配器显然是一种折衷的方案，用以联动不兼容的接口，被适配的类型其部分接口无法被适配</p><p>2. 如果适配目标变化了，那么可能产生相应的维护成本</p>"
                }
            }
            SectionItemOne {
                subframeIndex: 5
                subhead: "应用"
                Column {
                    y: parent.height / 3
                    spacing: 20
                    Text {
                        font.pointSize: 48 * fontScale
                        text: "Qt Model View Framework"
                    }
                    Text {
                        font.pointSize: 48 * fontScale
                        text: "Canvas"
                    }
                    Text {
                        font.pointSize: 48 * fontScale
                        text: "ChartDirector"
                    }
                }
            }
        }
        AnchorItem {
            id: a43
            x: parent.width / 2
            y: parent.height * 3 / 4
            //            angle: 120
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4
            Text {
                text: "25.3 桥接模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 5
            SectionItemOne {
                subframeIndex: 1
                subhead: "将抽象与其实现部分分离，使它们都可以独立的变化"
                gallery: "3586-jk-bridge-download.svg"
            }
            SectionItemOne {
                subframeIndex: 2
                subhead: "组合结构"
                gallery: "dp/Bridge.png"
            }
            SectionItemOne {
                subframeIndex: 3
                subhead: "观点与角度"
                // TODO
                Column {
                    y: parent.height / 8
                    x: parent.width / 10
                    spacing: 20
                    width: parent.width * 0.9
                    Text {
                        font.pointSize: 48 * fontScale
                        width: parent.width
                        text: "不就是适配器吗？"
                    }
                    Text {
                        font.pointSize: 48 * fontScale
                        width: parent.width
                        wrapMode: Text.Wrap
                        text: "从使用者的角度看，无论抽象怎么变，看起来确实是那样！"
                    }
                }
            }
            SectionItemOne {
                subframeIndex: 4
                subhead: "观点与角度"
                Text {
                    width: parent.width * 0.9
                    y: parent.height / 8
                    x: parent.width / 10
                    wrapMode: Text.Wrap
                    font.pointSize: 48 * fontScale
                    text: "GOF:<p>1. Adapter makes things work after they're designed; Bridge makes them work before they are. </p>" + "<p>2. Bridge is designed up-front to let the abstraction and the implementation vary independently.</p>"
                    + "<p>3. Adapter is retrofitted to make unrelated classes work together</p>"
                }
            }
        }
        AnchorItem {
            id: a51
            x: parent.width / 4
            y: parent.height * 3 / 4
            //            angle: 120
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4

            Text {
                text: "26.1 代理模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 4
            SectionItemOne {
                subframeIndex: 1
                subhead: "用于对象的获取是昂贵的而直到使用时才需要正真获得的情形"
                gallery: "twophones.svg"
            }
            SectionItemOne {
                subframeIndex: 2
                subhead: "像不像适配器？"
                gallery: "dp/Proxy.png"
            }
            SectionItemOne {
                subframeIndex: 3
                subhead: "观点与角度"
                Text {
                    width: parent.width * 0.9
                    y: parent.height / 8
                    x: parent.width / 10
                    wrapMode: Text.Wrap
                    font.pointSize: 48 * fontScale
                    text: "GOF:<p>Adapter provides a different interface to its subject.</p><p>Proxy provides the same interface.</p><p>Decorator provides an enhanced interface.</p>"
                }
            }
        }
        AnchorItem {
            id: a52
            x: 0
            y: parent.height * 3 / 4
            //            angle: 120
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4

            Text {
                text: "26.2 通往天堂的阶梯模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 3
            SectionItemOne {
                subframeIndex: 1
                subhead: "重用类继承关系并利用双重继承，实现功能复合"
                gallery: "dp/STH.png"
            }
            SectionItemOne {
                subframeIndex: 2
                subhead: "基于继承结构的适配器的变种"
                gallery: "dp/STH.png"
            }
        }

        AnchorItem {
            id: a61
            x: 0
            y: parent.height / 2
            //            angle: 120
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4
            Text {
                text: "28 Visitor设计模式系列"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 2
            SectionItemOne {
                subframeIndex: 1
                subhead: "不更改现有层次结构的情况下增加新的方法"
                // TODO
                Column {
                    y: parent.height / 8
                    x: parent.width / 10
                    spacing: 20
                    width: parent.width * 0.9
                    Text {
                        font.pointSize: 48 * fontScale
                        width: parent.width
                        text: "Visitor"
                    }
                    Text {
                        font.pointSize: 48 * fontScale
                        width: parent.width
                        wrapMode: Text.Wrap
                        text: "Acyclic Visitor"
                    }
                    Text {
                        font.pointSize: 48 * fontScale
                        width: parent.width
                        wrapMode: Text.Wrap
                        text: "Decorator"
                    }
                    Text {
                        font.pointSize: 48 * fontScale
                        width: parent.width
                        wrapMode: Text.Wrap
                        text: "Extension Object"
                    }
                }
            }
        }
        AnchorItem {
            id: a62
            x: parent.width / 4
            y: parent.height / 2
            //            angle: 120
            xScale: 1 / 4
            yScale: 1 / 4
            zScale: 1 / 4

            Text {
                text: "28.1 访问者模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 2
            SectionItemOne {
                subframeIndex: 1
                subhead: "反客为主，双路分发"
                gallery: "dp/Visitor.png"
            }
        }
        AnchorItem {
            id: a63
            x: parent.width / 2
            y: parent.height / 2
            //            angle: 120
            xScale: 1 / 8
            yScale: 1 / 8
            zScale: 1 / 8

            subframeCount: 2
            Text {
                text: "28.2 无环访问者模式"
                font.pointSize: 72 * fontScale
            }
            SectionItemOne {
                subframeIndex: 1
                subhead: "能力越大，责任越大"
                gallery: "dp/AVisitor.png" // TODO
            }
        }
        AnchorItem {
            id: a64
            x: parent.width * 5 / 8
            y: parent.height / 2
            //            angle: 120
            xScale: 1 / 8
            yScale: 1 / 8
            zScale: 1 / 8

            Text {
                text: "28.3 Decorator模式"
                font.pointSize: 72 * fontScale
            }
            subframeCount: 2
            SectionItemOne {
                subframeIndex: 1
                subhead: "增益其所能"
                gallery: "dp/Decorator.png"
            }
        }
        AnchorItem {
            id: a65
            x: parent.width * 5 / 8
            y: parent.height * 5 / 8
            //            angle: 120
            xScale: 1 / 8
            yScale: 1 / 8
            zScale: 1 / 8
            subframeCount: 2
            Text {
                text: "28.4 Extension Object模式"
                font.pointSize: 72 * fontScale
            }
            SectionItemOne {
                subframeIndex: 1
                subhead: "增益其所不能"
                gallery: "dp/ExtensionObject.png"
            }
        }
        AnchorItem {
            id: a7
            x: parent.width / 2
            y: parent.height * 5 / 8
            //            angle: 120
            xScale: 1 / 8
            yScale: 1 / 8
            zScale: 1 / 8
            subframeCount: 2
            Text {
                text: "29 State模式"
                font.pointSize: 72 * fontScale
            }
            SectionItemOne {
                subframeIndex: 1
                subhead: "随机应变"
                gallery: "dp/State.png"
            }
        }
    }
}
