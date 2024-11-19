# Build and Upload to itch.io Reusable Workflow

This repository contains a reusable GitHub Actions workflow for building and uploading Godot web games to itch.io.

## Inputs

| Name       | Type    | Required |  Description                                                        |
|------------|---------|----------|---------------------------------------------------------------------|
| game_name  | string  | true     |  The name of the game to be uploaded                                |
| version    | string  | false    |  The tagged  github release that will be created with the built zip |

## Secrets

| Name       | Type    | Required |  Description                                                                         |
|------------|---------|----------|--------------------------------------------------------------------------------------| 
| USER       | string  | true     |  Your itch.io username                                                               |
| API_KEY    | string  | true     |  Your [itch.io API key](https://itch.io/docs/api/serverside#authentication/api-keys) |


## Usage

> ⚠️ **Important:** The game must already exist as a web game in itch.io. This will not create a brand new game.

```yaml
name: Build and Upload

on:
  push:

jobs:
  build-and-upload:
    uses: EricBartusch/godot-container-builder/.github/workflows/reusable-godot-deploy.yaml@v1
    with:
      game_name: SuperAwesomeGame
      version: v1.0.0
    secrets:
      USER: ${{ secrets.USER }}
      API_KEY: ${{ secrets.API_KEY }}