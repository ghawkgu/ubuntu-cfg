JAVA_HOME=/opt/jdk
DERBY_HOME=/opt/jdk/db
ANT_HOME=/opt/ant
M2_HOME=/opt/maven
GROOVY_HOME=/opt/groovy
GRAILS_HOME=/opt/grails
JRUBY_HOME=/opt/jruby
JYTHON_HOME=/opt/jython
JAVAFX_HOME=/opt/javafx
SCALA_HOME=/opt/scala
PAX_CONSTRUCT_HOME='/opt/pax-construct-1.4'

PATH=$PATH:$JAVA_HOME/bin:$DERBY_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$JRUBY_HOME/bin:$JYTHON_HOME/bin:$JAVAFX_HOME/bin:$SCALA_HOME/bin:$PAX_CONSTRUCT_HOME/bin

MANPATH=$JAVA_HOME/man:$MANPATH
#MANPATH=${MANPATH%%:}

export JAVA_HOME DERBY_HOME ANT_HOME M2_HOME GROOVY_HOME GRAILS_HOME JRUBY_HOME JAVAFX_HOME JYTHON_HOME SCALA_HOME PAX_CONSTRUCT_HOME
export PATH
export MANPATH
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
