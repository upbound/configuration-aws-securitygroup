import models.io.upbound.aws.v1beta1 as awsv1beta1
import models.io.upbound.dev.meta.v1alpha1 as metav1alpha1
import models.io.upbound.platform.aws.v1alpha1 as platformawsv1alpha1


_items = [
    metav1alpha1.E2ETest{
        metadata.name: "e2etest-xsecuritygroups-controlplane"
        spec= {
            crossplane.autoUpgrade.channel: "Rapid"
            defaultConditions: ["Ready"]
            manifests: [
                platformawsv1alpha1.XSecurityGroup{
                    metadata: {
                        name: "eks-nodegroup"
                    }
                    spec: {
                        parameters: {
                        region: "us-west-2",
                        id: "configuration-aws-securitygroup",
                        rules: [
                            {
                                type: "ingress",
                                isSelf: True,
                                protocol: "-1",
                                description: "Allow All Traffic eks-nodegroup SG"
                            }
                            {
                                type: "ingress",
                                fromPort: 10250,
                                toPort: 10250,
                                description: "Allow Traffic from eks-controlplane SG",
                                sourceSecurityGroupName: "eks-controlplane",
                                protocol: "tcp"
                            }
                            {
                                type: "ingress",
                                fromPort: 5443,
                                toPort: 5443,
                                description: "Allow Traffic from eks-controlplane SG",
                                sourceSecurityGroupName: "eks-controlplane",
                                protocol: "tcp"
                            }
                            {
                                type: "ingress",
                                fromPort: 11520,
                                toPort: 11520,
                                description: "Allow Traffic from eks-controlplane SG",
                                sourceSecurityGroupName: "eks-controlplane",
                                protocol: "tcp"
                            }
                            {
                                type: "ingress",
                                fromPort: 9443,
                                toPort: 9443,
                                description: "Allow Traffic for Webhooks from eks-controlplane SG",
                                sourceSecurityGroupName: "eks-controlplane",
                                protocol: "tcp"
                            }
                            {
                                type: "ingress",
                                fromPort: 8443,
                                toPort: 8443,
                                description: "Allow Traffic for Webhooks from eks-controlplane SG",
                                sourceSecurityGroupName: "eks-controlplane",
                                protocol: "tcp"
                            }
                            {
                                type: "ingress",
                                fromPort: 443,
                                toPort: 443,
                                description: "Allow Traffic for Webhooks from eks-controlplane SG",
                                sourceSecurityGroupName: "eks-controlplane",
                                protocol: "tcp"
                            }
                            {
                                type: "egress",
                                cidrBlocks: [
                                    "0.0.0.0/0"
                                ],
                                description: "Allow All Traffic Outbound",
                                protocol: "-1"
                            }
                        ]
                        }
                    }
                }
                platformawsv1alpha1.XSecurityGroup{
                    metadata: {
                        name: "eks-controlplane"
                    }
                    spec: {
                        parameters: {
                            region: "us-west-2",
                            id: "configuration-aws-securitygroup",
                            rules: [
                                {
                                    type: "ingress",
                                    fromPort: 443,
                                    toPort: 443,
                                    description: "Allow HTTPS Traffic from eks-controlplane SG",
                                    sourceSecurityGroupName: "eks-nodegroup",
                                    protocol: "tcp"
                                }
                                {
                                    type: "ingress",
                                    fromPort: 443,
                                    toPort: 443,
                                    cidrBlocks: [
                                        "10.0.0.0/8",
                                        "168.74.0.0/16",
                                        "172.16.0.0/12",
                                        "192.168.0.0/16"
                                    ],
                                    protocol: "tcp",
                                    description: "Allow traffic to ControlPlane"
                                }
                                {
                                    type: "ingress",
                                    isSelf: True,
                                    protocol: "-1",
                                    description: "Allow All Traffic from eks-controlplane SG"
                                }
                                {
                                    type: "egress",
                                    isSelf: True,
                                    description: "Allow All Traffic Outbound",
                                    protocol: "-1"
                                }
                                {
                                    type: "egress",
                                    fromPort: 10250,
                                    toPort: 10250,
                                    description: "Allow Traffic to eks-nodegroup SG",
                                    sourceSecurityGroupName: "eks-nodegroup",
                                    protocol: "tcp"
                                }
                                {
                                    type: "egress",
                                    fromPort: 5443,
                                    toPort: 5443,
                                    description: "Allow Traffic to eks-nodegroup SG",
                                    sourceSecurityGroupName: "eks-nodegroup",
                                    protocol: "tcp"
                                }
                                {
                                    type: "egress",
                                    fromPort: 9443,
                                    toPort: 9443,
                                    description: "Allow Traffic for Webhooks to eks-nodegroup SG",
                                    sourceSecurityGroupName: "eks-nodegroup",
                                    protocol: "tcp"
                                }
                                {
                                    type: "egress",
                                    fromPort: 8443,
                                    toPort: 8443,
                                    description: "Allow Traffic for Webhooks to eks-nodegroup SG",
                                    sourceSecurityGroupName: "eks-nodegroup",
                                    protocol: "tcp"
                                }
                                {
                                    type: "egress",
                                    fromPort: 443,
                                    toPort: 443,
                                    description: "Allow Traffic for Webhooks to eks-nodegroup SG",
                                    sourceSecurityGroupName: "eks-nodegroup",
                                    protocol: "tcp"
                                }
                            ]
                        }
                    }
                }
            ]
            extraResources = [
                platformawsv1alpha1.XNetwork{
                    metadata: {
                        name: "configuration-aws-securitygroup"
                    }
                    spec: {
                        parameters: {
                            region: "us-west-2",
                            id: "configuration-aws-securitygroup",
                        }
                    }
                }

                awsv1beta1.ProviderConfig{
                    metadata.name = "default"
                    spec = {
                        credentials = {
                            source = "Upbound"
                            upbound = {
                                webIdentity = {
                                    roleARN = "arn:aws:iam::609897127049:role/solutions-e2e-provider-aws"
                                }
                            }
                        }
                    }
                }
            ]
            skipDelete: False
            timeoutSeconds: 4500
        }
    }
]
items= _items
