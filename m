Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E1BC96F4
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 16:09:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23C07C555B2;
	Thu,  9 Oct 2025 14:09:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0996C555B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 14:09:02 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Dnx48027332;
 Thu, 9 Oct 2025 16:09:01 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6gcau7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 16:09:00 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK67Bjx7V7uS8/9H9uhSlJDz0/9ndHnnTX/BcFQwi4+4E8utjmP4CnU91yNrsx2hw9DZcWYRK859fbntvsQtif/aGXLR/Bbh2U7kbWV5IAtZbbULBzaNdazl6890l7FTwzDyve6zqBT+0VJt9EUDwwBrZvJ1mB1hWZ8KcEQ7Wf9e3n6GMnXqROTlzn8RMALBBOSXb5OYzSGKhACLUJM91l18qW1TWX16xVhGcAo9ODR0cFnaScLcursBUWXhjGRICZHZNFlnw00lyn/V/IRIBqKLAPjle3Vku6J7eCqc4djEBNT/WbuIPO6S3PsUgADiJGC5XiSe2y6261ua9/oHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1WVaKkuHe3hVbj4trI1TSAolskizMa9gmspGZB3KfM=;
 b=yJmcRzokzkJQY/Yj5N0ByueHZN118YwkDzXeo4z6VMF6Y2tybuN4IkAE94yWyf0ZyVMkaVXj/WUK9DLrzVlmArnXxUgRAwJjQX2kkG7XS2SqxARL38z6mEiwOBUkH95Ad0/Y7mTmI1g7rBLLpwdhg1Wz7nW3CzSSOBBmP1VRH9JP64z3Xm3BJwHR2VdfKWOr2ravHddBhhCFWRKeswQECFrM+SaaYcmALykjesfxWuKBGfxbZ2unG+4Z8nWq0TLy5DQcilQvU1qCT3vi/ZhZcPBdSpv8uT8Il9yASaPZwVAQe/IrL9chzMy/niOGLRk//Ad4cFiacRTn+7zwtl7YCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1WVaKkuHe3hVbj4trI1TSAolskizMa9gmspGZB3KfM=;
 b=UAWlRpCSkmzFuzTiCW8N7weWoSXF2taJsPsHZ/DLdIiNUyknRnWGd1/E8Xssa5IHRhfomS4mApDV5g5l6uc4q2XMZWbD1pgI8L5aJj4Efa6R8IZf+aPSDIsdGU1cJjjA8ZLsUkgOz0TDFSLoo47epDDwMbnS2vXaRfz9zc5MZ94lIKE+2LmdsU4aHFT5td9Rv3aUtBIHR7eqD4ByT096O5qE5RM/WL4nrvdIuAwNGuqEnWHSDMfMcmjCn8c3nL7Ok/RI0rgD6t4kxm/eiJJIA5y4bBj/MPrC6iZzklRRvlpIn85fs8wyy+of8nqKq1aD/R9KVvqf60DaV8voh5vQ/A==
Received: from DU7PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::24) by DB8PR10MB3910.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:14a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Thu, 9 Oct
 2025 14:08:57 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::7e) by DU7PR01CA0002.outlook.office365.com
 (2603:10a6:10:50f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 14:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 14:08:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:52:05 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:25 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:54:00 +0200
Message-ID: <20251009135417.282290-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|DB8PR10MB3910:EE_
X-MS-Office365-Filtering-Correlation-Id: e8149ba1-6b4e-4ef9-77c9-08de073d62b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kUYbRYIeO7TGeKwKsMcME0LIFY5Ylrl4XIo9A7cpL83VGk3MIyoq2mpK/Z0O?=
 =?us-ascii?Q?q4zWPOPLEMqbTvQH3LTlxInCbo/zA40KwkmtNvPz9l+763kaHTSAEB1yIlz5?=
 =?us-ascii?Q?WCJLctzJGx3xpRGKoG4qvpjZ7SESDFLJjMcuZ/zr7lp8kxOarhqXM+6kI+8U?=
 =?us-ascii?Q?u23ffg5OIt04QmRBXDMDNs0Gzo6UvrR3lB2H90uWrDLpa5O+LsRP+w53kouV?=
 =?us-ascii?Q?35t9yhc9tgt23NfS1qrrueRjWGlENMigJsm8/Pb9bc3J84epgZKBMQ4czuBw?=
 =?us-ascii?Q?meggqNBiYOngWnbo307agzQse/W7O/dC4h9OfTWo7eIxAQAVXpjzHH7F7NFf?=
 =?us-ascii?Q?eCq5qFzE2ajT0tSGq3NXW1cD66SNkqtdIi563K5ULq5+h6A+vk1e327zZ4Tb?=
 =?us-ascii?Q?JdD06NBLnMLzwNBAqWclu+jje1qqDYKuh8+hjpNNhPb2DiaXBWld0CJAsSrp?=
 =?us-ascii?Q?KL2SsQexl526AaUIv++ra5Fz89DiPfkseyJBpDtHwY/77FiDg3C4yiK+IpMY?=
 =?us-ascii?Q?k72aY44t56wspgE2YU3GoSVUsHXNBgi2YP4KTJYGKjZqbRO71d/0zIGikDqv?=
 =?us-ascii?Q?BFATEP2dd85F/Nvb+IwV5jkROIKuuBGvbnSK5kUqMI7ADdqAaAX5518V1Zfa?=
 =?us-ascii?Q?up5DablQozr/mFseNnrM5krE8QVZm5NvP/dWXSJAo7LahcxFCXx1TW1zfnyP?=
 =?us-ascii?Q?1yh+IS+CTYRvn/BsUIN4+LdRzeIcyTPel0ZnU8ylw+u8yMBT0mPM408RCk7P?=
 =?us-ascii?Q?/9KtcLHnWcmM6zJ0h5KvCAf62w0me3ttuuG2D2lwJOt9NRIuwoojYdnpKtCY?=
 =?us-ascii?Q?GlIyqo9KY2am92emHLsDjmFj0hCMXsXwQCDdEXcEE5vuZOQJBiiRGvWo4hQa?=
 =?us-ascii?Q?9aAvxXrXv8+gK4LkQoAEPaTfOKGTCjq8O1FOJOAAR0cVESZTUitPCw6/gIor?=
 =?us-ascii?Q?+e1oTYmkonGrNRhZ6iZn0maJ7f2Ln4NsuPtp0U9zYPYXGmpt3mff13KU3ofX?=
 =?us-ascii?Q?is6JUlObdsW8+iSSoEs0ce+SDINTvbXddA2aI3aoL4L6Nyq/wkjcEAEQRPlJ?=
 =?us-ascii?Q?RQRWB6ywTyrh08xocQV11P0nbPCa43En+Pdx8zHiD+uAngPDAvJ5kzdpYLIQ?=
 =?us-ascii?Q?RXL5cMhZ2MM8Ei+HF9mS00bvuWlKJjlLcO/QSfaqFCLT/hik5vdFSJ08QCS+?=
 =?us-ascii?Q?+fxZ+hszvB5jcQhg57ZkH0U5uApeS3vDOVWE+nyI4w6wFBV9a6sCKwubZp0t?=
 =?us-ascii?Q?a4/1XhNWa1N23eRyaGjABsf4wCaMpRwCLTJE8PK7VeenkFCnFTaeiX143IDS?=
 =?us-ascii?Q?4yVzfjH0MechSW7PlEIrfsH19rmsNCiRJnMArirjKE3ftDPIZKYnYAHJU96D?=
 =?us-ascii?Q?4q8gaOBhaqdQMZkrfJU/kh72DopuVj0zpovCfcvooGVnngbO77yqYWDmYFOh?=
 =?us-ascii?Q?fFVMzKSFKDLtNXcp/kmEmikIxM7Xo57Hf7/wr1RcwvSdkYJQ4ou+vNhmp04X?=
 =?us-ascii?Q?XEDHxdG3nEgGlzM8eUPVYQ3WiUhPwnB7Mbc61hst5+4ghvXU+FDQE/vscNO5?=
 =?us-ascii?Q?CVd5uxHxSCu6PBMdRMc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:08:56.2240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8149ba1-6b4e-4ef9-77c9-08de073d62b1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3910
X-Proofpoint-GUID: dc0-yO2l2Y-PsppsAnGC8DF6PtXr5S8w
X-Proofpoint-ORIG-GUID: dc0-yO2l2Y-PsppsAnGC8DF6PtXr5S8w
X-Authority-Analysis: v=2.4 cv=csWWUl4i c=1 sm=1 tr=0 ts=68e7c1fc cx=c_pps
 a=Qn1+58ohXYs92BDjaiWoGA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=FVqNRJnYtyi87H6tbyYA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8dlPoZd45bcQ
 hjNh/CCSLCiYaXK9VNDaPxNDoOSOVbfS4GGY8DNkdlM3TBxEkSKXihyxXY3Ts+Zor5719Gn8boY
 aXXfy5L50hUEUU2w9H7f8g8M+rAvV8ZgoKCisB2vFleskQsqhZj+Vyqr//HJrKIa49kGonMDewq
 1cMCPtqjtHobOXw9qOlAq6ixSSlJ0sLf7SK/WvUPhIIWAcQqbkmZzhYRVKQkI2w75OdJrLkSvzq
 d7XjPnJ2H1h3AnJWmJBy1O/8g7IxUIPJmSGW1mQKIy/HygUsEfAx1byREWLixGVl0ScbBYe+FFO
 kO30ZPicD0Ucc3XX2bc7w80WIfSrJBaA8RcLlVRTlzLU7wYDGQ8hrpkxEEzXX7iw28/eoXu32R0
 AiqK5jsvqshHb5ne73PBrFeachTajA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 06/11] ARM: dts: Update config node for
	stm32mp157c-ed1-u-boot
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Remove u-boot,error-led property as it's the legacy LED stuff.
Use /options/u-boot to configure LED device as described here [1].

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index d93359f967c..e44ea84b88f 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -14,8 +14,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "fip";
 	};
 
@@ -61,7 +59,7 @@
 	led {
 		compatible = "gpio-leds";
 
-		led-blue {
+		led_blue: led-blue {
 			gpios = <&gpiod 9 GPIO_ACTIVE_HIGH>;
 		};
 
@@ -69,6 +67,12 @@
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	options {
+		u-boot {
+			boot-led = <&led_blue>;
+		};
+	};
 };
 
 &clk_hse {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
