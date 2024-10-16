plugins {
    id("java")
}

group = "org.umg"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")

    implementation(
        fileTree("../core/build/libs") {
            include("*.jar")
        }
    )
}

tasks.test {
    useJUnitPlatform()
}
