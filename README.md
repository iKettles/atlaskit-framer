# atlaskit-framer

This project illustrates a CI workflow which publishes new versions of Framer X projects if one of their dependant packages has changed. It is intended to be used to target yarn packages that are prefixed with a specified namespace. This ensures every Framer project that depends on a production component is updated and published any time the corresponding package has changed.

## Structure

This project contains Framer X projects that are a wrapper around their production counterpart. Each project contains the minimum amount of abstraction needed to include a production React component within a Framer project as well as some property controls for more intuitive usage from the canvas.

## Usage

### CircleCI Configuration

Within the `.circleci` directory is a sample configuration which can be included within an existing CircleCI configuration. It contains a single job `build-and-publish` which can be triggered on interval using a workflow (example hourly workflow included with this repo).

#### Environment Variables

You should set the following environment variables within your CircleCI project:

| Name                | Value       | Description                                                                |
| ------------------- | ----------- | -------------------------------------------------------------------------- |
| `PACKAGE_NAMESPACE` | `@atlaskit` | Namespace of packages to target                                            |
| `FRAMER_TOKEN`      | `<token>`   | Authentication token for publishing/updating the package in the Team Store |

To get a `FRAMER_TOKEN`, run `npx framer-cli authenticate <email@address>` and verify with your email. Read [the docs](https://www.npmjs.com/package/framer-cli) for using the `framer-cli` for more information.

### Implementation

You should include `./bin/publish-updated-projects.sh` and `./bin/yarn-lock-diff.js` within your repository. If you get the error `./bin/publish-updated-projects.sh: No such file or directory` ensure the shell script has execution permissions.

Every time the `build-and-publish` job is run the dependencies of each `.framerfx` project within the repository will be checked. If any package that matches the configured namespace has been updated the Framer project will be published. This also works for packages that use `latest` as the version in `package.json`.
