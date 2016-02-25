#include <QApplication>
#include <QQmlApplicationEngine>
#include <QFont>
int main(int argc, char *argv[])
{
    QFont font("微软雅黑");
    QApplication::setDesktopSettingsAware(false);
    QApplication::setFont(font);
    QApplication app(argc, argv);
    app.setAttribute(Qt::AA_ForceRasterWidgets);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
