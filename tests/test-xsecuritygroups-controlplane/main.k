import models.io.upbound.dev.meta.v1alpha1 as metav1alpha1
import models.io.upbound.aws.ec2.v1beta1 as ec2v1beta1

_items = [
    metav1alpha1.CompositionTest{
        metadata.name: "test-xsecuritygroups-controlplane"
        spec= {
            assertResources: [
                ec2v1beta1.SecurityGroup{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "securitygroup"
                        }
                        labels: {
                            "crossplane.io/composite": "controlplane"
                        }
                        name: "controlplane"
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            name: "controlplane"
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
                            "crossplane.io/composite": "controlplane"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow HTTPS Traffic from eks-controlplane SG"
                            fromPort: 443,
                            ipProtocol: "tcp"
                            referencedSecurityGroupIdRef: {
                                name: "eks-nodegroup"
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

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-1-10-0-0-0-8"
                        }
                        labels: {
                            "crossplane.io/composite": "controlplane"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            cidrIpv4: "10.0.0.0/8"
                            description: "Allow traffic to ControlPlane"
                            fromPort: 443,
                            ipProtocol: "tcp"
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

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-1-168-74-0-0-16"
                        }
                        labels: {
                            "crossplane.io/composite": "controlplane"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            cidrIpv4: "168.74.0.0/16"
                            description: "Allow traffic to ControlPlane"
                            fromPort: 443,
                            ipProtocol: "tcp"
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

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-1-172-16-0-0-12"
                        }
                        labels: {
                            "crossplane.io/composite": "controlplane"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            cidrIpv4: "172.16.0.0/12"
                            description: "Allow traffic to ControlPlane"
                            fromPort: 443,
                            ipProtocol: "tcp"
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

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-1-192-168-0-0-16"
                        }
                        labels: {
                            "crossplane.io/composite": "controlplane"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            cidrIpv4: "192.168.0.0/16"
                            description: "Allow traffic to ControlPlane"
                            fromPort: 443,
                            ipProtocol: "tcp"
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

                ec2v1beta1.SecurityGroupIngressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-2-"
                        }
                        labels: {
                            "crossplane.io/composite": "controlplane"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow All Traffic from eks-controlplane SG"
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

                ec2v1beta1.SecurityGroupEgressRule{
                    metadata: {
                        annotations: {
                            "crossplane.io/composition-resource-name": "sgrule-3-"
                        }
                        labels: {
                            "crossplane.io/composite": "controlplane"
                        }
                    }
                    spec: {
                        deletionPolicy: "Delete"
                        forProvider: {
                            description: "Allow All Traffic Outbound"
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
            ]
            compositionPath: "apis/xsecuritygroups/composition.yaml"
            xrPath: "examples/xsecuritygroups/controlplane.yaml"
            xrdPath: "apis/xsecuritygroups/definition.yaml"
            timeoutSeconds: 60
            validate: False
        }
    }
]
items= _items
