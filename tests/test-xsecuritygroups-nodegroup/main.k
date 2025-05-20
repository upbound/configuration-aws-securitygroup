import models.io.upbound.dev.meta.v1alpha1 as metav1alpha1
import models.io.upbound.aws.ec2.v1beta1 as ec2v1beta1

_items = [
    metav1alpha1.CompositionTest{
        metadata.name: "test-xsecuritygroups-nodegroup"
        spec= {
            assertResources: [
                ec2v1beta1.SecurityGroup{
                    metadata: {
                        name: "nodegroup"
                        annotations: {
                            "crossplane.io/composition-resource-name": "securitygroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            name: "nodegroup"
                            region: "us-west-2"
                            vpcIdSelector: {
                                matchLabels: {
                                    "networks.aws.platform.upbound.io/network-id": "configuration-aws-securitygroup"
                                }
                            }
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-0-"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow All Traffic eks-nodegroup SG"
                            ipProtocol: "-1"
                            referencedSecurityGroupIdSelector: {
                                matchControllerRef: True
                            }
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-1-"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow Traffic from eks-controlplane SG"
                            fromPort: 10250,
                            ipProtocol: "tcp"
                            referencedSecurityGroupIdRef: {
                                name: "eks-controlplane"
                            }
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                            toPort: 10250
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-2-"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow Traffic from eks-controlplane SG"
                            fromPort: 5443,
                            ipProtocol: "tcp"
                            referencedSecurityGroupIdRef: {
                                name: "eks-controlplane"
                            }
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                            toPort: 5443
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-3-"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow Traffic from eks-controlplane SG"
                            fromPort: 11520,
                            ipProtocol: "tcp"
                            referencedSecurityGroupIdRef: {
                                name: "eks-controlplane"
                            }
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                            toPort: 11520
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-4-"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow Traffic for Webhooks from eks-controlplane SG"
                            fromPort: 9443,
                            ipProtocol: "tcp"
                            referencedSecurityGroupIdRef: {
                                name: "eks-controlplane"
                            }
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                            toPort: 9443
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-5-"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow Traffic for Webhooks from eks-controlplane SG"
                            fromPort: 8443,
                            ipProtocol: "tcp"
                            referencedSecurityGroupIdRef: {
                                name: "eks-controlplane"
                            }
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                            toPort: 8443
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-6-"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow Traffic for Webhooks from eks-controlplane SG"
                            fromPort: 443,
                            ipProtocol: "tcp"
                            referencedSecurityGroupIdRef: {
                                name: "eks-controlplane"
                            }
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                            toPort: 443
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }

                ec2v1beta1.SecurityGroupEgressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-7-0-0-0-0-0"
                        }
                        labels: {
                            "crossplane.io/composite": "nodegroup"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            cidrIpv4: "0.0.0.0/0"
                            description: "Allow All Traffic Outbound"
                            ipProtocol: "-1"
                            region: "us-west-2"
                            securityGroupIdSelector: {
                                matchControllerRef: True
                            }
                        }
                        providerConfigRef: {
                            name: "default"
                        }
                    }
                }
            ]
            compositionPath: "apis/xsecuritygroups/composition.yaml"
            xrPath: "examples/xsecuritygroups/nodegroup.yaml"
            xrdPath: "apis/xsecuritygroups/definition.yaml"
            timeoutSeconds: 60
            validate: False
        }
    }
]
items= _items
