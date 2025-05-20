# AWS SecurityGroup Configuration

This repository contains an Upbound project, tailored for users establishing their initial control plane with [Upbound](https://cloud.upbound.io). This configuration deploys fully managed AWS SecurtiyGroup with Rules resources.

## Overview

The core components of a custom API in [Upbound Project](https://docs.upbound.io/learn/control-plane-project/) include:

- **CompositeResourceDefinition (XRD):** Defines the API's structure.
- **Composition(s):** Implements the API by orchestrating a set of Crossplane managed resources.
- **Embedded Function(s):** Encapsulates the Composition logic and implementation within a self-contained, reusable unit

In this specific configuration, the AWS SecurityGroup API contains:

- **an [AWS SecurityGroup](/apis/xsecuritygroups/definition.yaml) custom resource type.**
- **Composition of the networking resources:** Configured in [/apis/xsecuritygroups/composition.yaml](/apis/xsecuritygroups/composition.yaml), it provisions securitygroup with rules resources.
- **Embedded Function:**  The Composition logic is encapuslated within [embedded function](/functions/xsecuritygroups/main.k)

## Deployment

- Execute `up project run`
- Alternatively, install the Configuration from the [Upbound Marketplace](https://marketplace.upbound.io/configurations/upbound/configuration-aws-securitygroup)
- Check [examples](/examples/) for example XR(Composite Resource)

## Testing

The configuration can be tested using:

- `up composition render --xrd=apis/xsecuritygroups/definition.yaml apis/xsecuritygroups/composition.yaml examples/xsecuritygroups/controlplane.yaml` to render the composition
- `up test run tests/*` to run composition tests in `tests/test-xsecuritygroups-nodegroup/`
- `up test run tests/* --e2e` to run end-to-end tests in `tests/e2etest-xsecuritygroups-nodegroup/`

## Next steps

This repository serves as a foundational step. To enhance your configuration, consider:

1. create new API definitions in this same repo
2. editing the existing API definition to your needs

To learn more about how to build APIs for your managed control planes in Upbound, read the guide on [Upbound's docs](https://docs.upbound.io/).
