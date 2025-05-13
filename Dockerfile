FROM dart:3.7.3 AS build
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get
COPY . .
RUN dart pub get
RUN mkdir -p bin
RUN dart compile exe lib/functions.dart -o bin/server

FROM gcr.io/distroless/cc
COPY --from=build /app/bin/server /server
EXPOSE 8080
CMD ["/server"]
