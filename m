Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381EBC9621
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:54:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0522FC555B2;
	Thu,  9 Oct 2025 13:54:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36AA9C555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:54:32 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DXcTn023178;
 Thu, 9 Oct 2025 15:54:29 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6fmcdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:54:29 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isYQQLAvA2og3pmw6a+zT+PJchVONcVO6RXceR5Ama0Wd8e0SVkkKAEvIqoCGNvIb2QeZ8azuREVjuddgrLS+B/mMV4zNA73THQ9VJ9J+KkpieTYKAfOJfzZmA0R5jAXvn5n6GVfgomNsiG70Fd8/nYPeS+Vdpn9tlhFfKZn3C+lzR1IqGHhQOvkelNeWPv779XUmLFc6PAiRlKLaqg+7ThCBKWgeyxyz/sq5atbhMj/RDHYtLp6+0bptBHcM84vNpmz4+jLw2r8+YalUL2xJpQnZaUl575v0Ljn5npO9nFwk+vTNcY6OMSHx2jI1u/u6SYc+mcnMp6eg8g9BGwNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRgQFZa0csirE1knw1mew5CmfnePT58/P3GJvtksGQo=;
 b=wji59tZe2iy6/JW4zaqO5A/fB7Zmn/7VtsEUNVTRvIktXioHp3HepN04DqcPUUSeMhG4in/NdfxHXoLMSlslfxD6Mf6ROBRYp2bC6ehU7VOUme313XVlZfagP0c/s0BCeP2u8hw2sXnquF1Ghc6A0lFRjMOIqS5GTCFX0i3/wyLEWUdXJcZq9PjK7vWvMW9WazJlq8ofVNPltIUE3UHjWl762kghj9vm001GNGWnphphY6zXuvwbWvt88H1a9p3FM7Ky6WVpwM6unDDgwL5tyb4tzScFn42/VrOf9eFkp7Ma7v2nkAHIBdlcevVTq8SY+LrDzcrISH42M42+smLzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRgQFZa0csirE1knw1mew5CmfnePT58/P3GJvtksGQo=;
 b=Q86gvlIchH8Q+qHhM+TYnc8N6aKFsU5xGkB2VOHyzXJNaQN0Ytog1wFHVXEJRY8+a62elmiE/CaUqTIGgTfJqXe0B8/2hCaUlryzgz5Cx+puo0n9cXaSjJsa4nHXBpcBrqOHK74vzYgQqwappIJn3T+OObbY4CiVSs+73OBaamhExWvo3NQlN0GAS5cRqr2ZLOrSOWHjhdIS2viJU+cd0KUlwC4CvWsPJ3YoyUq0P4dhHig85zW1BfzA+yS4GWZXDPqxDjErT3pgcZK0YhqRaUMp2e42A4Op1ru9IsuCa7xw/DQNMJDPuwxqARioPUM9LtD42LsvwipvuF/Iagrwgw==
Received: from DB9PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:10:1d9::28)
 by DB3PR10MB6810.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 13:54:27 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::74) by DB9PR02CA0023.outlook.office365.com
 (2603:10a6:10:1d9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 13:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:54:26 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:47:16 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:24 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:53:59 +0200
Message-ID: <20251009135417.282290-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|DB3PR10MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: fea13fd7-96cc-4af4-5aa9-08de073b5c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H/5DLjCLXAtfq9sDRyDCa1XnpwPxdxV0Ys9Dz9w3oiJUz4qE7u0P84P+rxDJ?=
 =?us-ascii?Q?i85kHcSwRKewakzg3FSqFIZSv+Rnx58xmBoDIER2PCmh0GGXl+nKWMO/JJvc?=
 =?us-ascii?Q?ww+XWqst1mxh0uJhd4psS8z3EUY/6CaTFm0DwJtlyst0UJwh749eK6rVN+Ch?=
 =?us-ascii?Q?XIrgEgR3Nd4NSIArDT7ANjfBldx9ZYRJQ6WhGKmCb9H9s/YqSdLLfoVU9zz9?=
 =?us-ascii?Q?hwZPpY5K3m0VGGlUZZjYfXLEtb2Nh65/ecklkRW1FNH+1kZ2p4Fgrzl4gC5W?=
 =?us-ascii?Q?s26LAV228OzDodTHmgVBXdGWINNOJT70/VpRM/GaACGmkYRGxhHRZCgNe1hQ?=
 =?us-ascii?Q?WcHepPcJQUbBHmplGieygIBqPfZqzLyur5nAgN//ISJWHDSc81O1ZuE5IYUg?=
 =?us-ascii?Q?kfqlDxY1rkIfU3TLsGvZ7bDc5ODIXHbGWYLQS56WjjyHMUOTxnQsJ+7xH1eK?=
 =?us-ascii?Q?KzO6s2r/kSo3MKeP6XOnU2avI0Q3JurUfp07RcpUJ9pmQjzFDVQjmL6YPOEX?=
 =?us-ascii?Q?V9ghIRV54KJc7BAd0l8VtAXg5r26AECIrGbcuyJIeQpwVi9ucy/PaG0zfgNq?=
 =?us-ascii?Q?sriieD3ZI1krfhujceLasyFE8uztKkwCXNjSGYuOqN+z8w6T/wxLECg/ojKc?=
 =?us-ascii?Q?pUrPE0lp6qH2oYJm2Va1ufbeKLQjM77PuXrYeVoMrn9J8q244XT3UYz+xWqL?=
 =?us-ascii?Q?QkSMTO8mn3vlSPSMVcR1ZfI+9KPN7/MVrtHJjLmmX5LcmYA13XzGkPG8Ew+g?=
 =?us-ascii?Q?H60ZVRuN0qM3D1Z92flLMB/XPacqqtX4mNcRWv8wE4mQfd/x7ys9pI2+0mYW?=
 =?us-ascii?Q?kwqviUiDgM4Okec3cFLRo7FF2jpPH1T07TsqU42shi8PAb0toQYD3IG4tDAl?=
 =?us-ascii?Q?Vn9IoMNVyXBI5+gE0IkJ1fQrBaFzhXSWLuo83GDuLfH/E9U1sIFdfJzQWjM0?=
 =?us-ascii?Q?WwcUfYzVZX+FkP60+gkyzxU6XE0QZxC5RggZpo/iVRlTmLKInR3G2fks9K0s?=
 =?us-ascii?Q?c3Cn6wNF83doO9rnYbl+IbH/j4pkcE+bcR9mMi9K+/rEsodN2vdTfe2VsWZg?=
 =?us-ascii?Q?2WFzY7ueiGBUqo5NU5t9PlkrUVpQ4t8P8KBHZLUWKkzLwqJzJKBzU+k3n4lk?=
 =?us-ascii?Q?+8mzOXbMQIRmqtf3aJ2eGUJ4t6BnDZ03YsrVqhB6ZwyIH5KwIjJxTHqpuhoU?=
 =?us-ascii?Q?gyrfVYvWYB6Yhsy38pAwIzSRKj6tCGiz17RnEUVtBinaOtFfDfG54c23UXwS?=
 =?us-ascii?Q?nqHpsRqDBlxO6gqKyWjWn7yeq5n9eIinsYUYOErjdLb+pSluGQ3jyGRiM8bp?=
 =?us-ascii?Q?wnx+yX+V9hSoHyiU+ba/BqMvQabAor1bpS6z6fE4avrTUjYvgqfaXtKrgOQT?=
 =?us-ascii?Q?qhzv9hVqpd3I+uhatJvwGgI0+ylAd4nDvXEAGKVovRr0MtcuJab04CnS5R4F?=
 =?us-ascii?Q?YUK+4DUTRs1AFKBXvDyKyVWm8xQJt4u8uueIyLob717zTwYC/1/NPgLocqRq?=
 =?us-ascii?Q?iaYYvHGvTmoIJeRRG3sxk/S6/cKAEZ/sq3WMpXbvD/xw/cU6cdHKuY3LEZmT?=
 =?us-ascii?Q?6JhaJNrqgovvkQ1QH0Q=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:54:26.6839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea13fd7-96cc-4af4-5aa9-08de073b5c68
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6810
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4nyl96PN9aJP
 Yr6T7m6wbE1JOrjbOVODqiBMS7wLd/nbwmgai7xibM+xgru7UhxjWMEGudSXb//CdFSO7dBOa6/
 C6mfzI3G02zCO8v54tyT1xlyHZ79WmpZNW9h64tQVsb6cjSXZqXAKvYYs/42blXmzitUlxPRgd0
 GcMk34DwrPke8CFXzIfqF9BZQnQndxEfRSzzEVbRzUUi8JAz4gVAA7UQWc3RznVCO/xeJepjDTa
 sdVpMRoagBgt5IKtr5ulq1H3OXqatXhdSy3xtCMN8ZjSEG63obrFSjRok9apxn0wKdbWmLR1jCk
 9DGdp0TtxpP5QsZHU6yZXhtE2lbZrpZrs/L/b9g0ImYtcW44rznTk9tzE1TIiZbDsq4hwzw5V7H
 UF6ZHt1YJSqe3fhz/ymsMMuaGRkcMQ==
X-Authority-Analysis: v=2.4 cv=aMn9aL9m c=1 sm=1 tr=0 ts=68e7be95 cx=c_pps
 a=eBPJ53WjM1CwWhcwHZNLsw==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=w5g0WkLCaQZasThakogA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: CLGE3voJkvt-vnXm7H3tmx-EI4Atv9WU
X-Proofpoint-GUID: CLGE3voJkvt-vnXm7H3tmx-EI4Atv9WU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 05/11] ARM: dts: Update config node for
	stm32mp137a-dk1-scmi-u-boot
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

 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
index a5158fec7ef..2f67341a076 100644
--- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
@@ -13,8 +13,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
 	};
@@ -36,7 +34,7 @@
 	};
 
 	led {
-		led-blue {
+		led_blue: led-blue {
 			/delete-property/label;
 		};
 
@@ -44,6 +42,12 @@
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
 
 &adc {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
