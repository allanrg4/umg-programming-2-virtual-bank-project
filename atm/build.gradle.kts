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

    implementation("io.github.cdimascio:dotenv-java:3.0.0")
    implementation("mysql:mysql-connector-java:8.0.28")
}

tasks.test {
    useJUnitPlatform()
}