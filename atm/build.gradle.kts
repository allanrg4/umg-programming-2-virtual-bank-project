plugins {
    id("java")
}

group = "org.atm"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")

    implementation("io.github.cdimascio:dotenv-java:3.0.0")
    implementation("mysql:mysql-connector-java:8.0.28")

    implementation(
        fileTree("../core/build/libs") {
            include("*.jar")
        }
    )
}

tasks.test {
    useJUnitPlatform()
}