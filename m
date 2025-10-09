Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C1BC9622
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:54:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EE5EC555B7;
	Thu,  9 Oct 2025 13:54:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1D8FC555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:54:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DSd7W027731;
 Thu, 9 Oct 2025 15:54:30 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h4dxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:54:30 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZMivvTHDDx7Zo4LtsmSZseTN6XtiNJ22Yvo0GbLBoKEJYcrepfM+v0MabejYeFUcSzJlQCbnr2lHOxo09y92lTkjq5m6ZKZzNCEwIO3k7Yel4uRk2a0Y2jVUQstyUnt3bHbhyp5YvuCp9p5lT2gIWwh2EpgDSqhhjOnIBN5qwwM+8GkjGfseE/HjGun+EFOFWo0fYu6WHc8Ix5CEIbCaY0b+rzyqeYwZi4qXtNrafuKl2DAiudvlL+BA1uvgY1iteVZ35zfbvgk8eICPwqDncT3vYVRlgdTbcM1czQzhgJI3lde0hVjrcrzlgH6OlqsvNui8/aa4Duq10zAON/x+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q7zEKwROMD2RxF+XcVna6Q/2Brt1cTHkUxTbUokpd0=;
 b=qNHcSRXTvcFELUsEhHPtl/n4eDaTtKZE0xyLPDqJxc0TD/Y3YiU8QNe8avrPRj3yN11nEPooSOGs9SlYzlEGaPWJz3sx0edCMNZY04RIn2V3a74OzqiAGeilAC35uHRxE1bhm7mzRdd2SIgFRUXQQh+Rgh0VWQHdMB0fBNQWkFwC6k47tlIikr2Ykta+yIhGQFbfiJvJeSqMhQCkt/xQwMlDPWppPe3S7VgZ+SPeA9bBVY3vmrstjQ8oOhF2DxiaUotjAAbzNc+mpXX0oFHbpbdFlxBZOUKCRvWYIJc9ZSYttMp3hveRm2OnEVC4EipO358aRLTxMHHq39CoZ1GHVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q7zEKwROMD2RxF+XcVna6Q/2Brt1cTHkUxTbUokpd0=;
 b=YMvMtd5qTzirdsMfjzgtYYbaAmnxC/8wzTcuOnQ3IM7rPgDrrsMlZvs0//8b40V+GcWb2cpsN1Als+NxuSS4ZRst5iFx4u1IP0DnSK3SI2l3kFoM6+0evVcpcW+cb7/9jwSDWOSW+ad5SeZphFB4cPkhzCLgwVq38esYhwAd+pvRWTtMqnylItobMa4o6wL8cZUSGpyiBA+7QmQeWjPpqrKy4KltMFD4WJj/L4hyl04GESDhVwKyX2iT1Ibkf7uQnkdfci2DAGvJzbSq/dFpC+KMmU+hepvscu9onV6Pov00td+T5U1XyRZOEunhAA5SyuxKBcSIiW2hH0gieLn5zw==
Received: from DB9PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:1d9::22)
 by AS8PR10MB5832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:508::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 13:54:28 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::3f) by DB9PR02CA0017.outlook.office365.com
 (2603:10a6:10:1d9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Thu, 9
 Oct 2025 13:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:54:28 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:47:18 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:26 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:54:01 +0200
Message-ID: <20251009135417.282290-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|AS8PR10MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a533a6-3df8-49a3-8860-08de073b5d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VBLTBiZ9/EgtxzxKO3ZszCLWCRBooL4cbFvZsbq82h/DEf9av+isKiUKtEAj?=
 =?us-ascii?Q?E+vO9gX395REYxaUrS2mx6pRHeJnoI+xPJnGGWOq44/2P+0tgHhvVs4QtPUJ?=
 =?us-ascii?Q?RhfJE3k5+lJ81UB0DDwtPvo7TqlNgi3LI2ECJSEqlZ7995Q7tBtkFZIlXavO?=
 =?us-ascii?Q?68nLjxc7G41XMXWy4UjVVfw6SP3+pXPovivn0Xx1R4x1KiSJ19eoeHSi9Rlz?=
 =?us-ascii?Q?lHLHwxbsr69yt1tL4UFkpnWGvP3bIoL/tt/JtXCK9c0+qyK9NdqaYkzdUnk7?=
 =?us-ascii?Q?tMHQxvEPpwI+CjFmw1YbTBZSkzMIq3GmLZrhJyM0x4670VSiQX6/veQJppcm?=
 =?us-ascii?Q?0eHQ0UUqy7tNh2CgdWEIlhC/LNoL94r8FUt62hdgaaOvfrfUg4SWoENwlQSP?=
 =?us-ascii?Q?HUutQkHKcYY+zzxelz3/CWrbWFh7/8UHilMKK8cdRRFao6iiYtlUQG7WcDU7?=
 =?us-ascii?Q?QjKkC54kYTJedzkf0Oq3PLV9mI37p5BX/JzNJKVJ9hkeLTmBmOHL7VLbxp/9?=
 =?us-ascii?Q?VGcNbpr2BFoAvMgnczlhKCd4lgT8OpY5adxrFk1dw0BU+iCny2XvTXrStqVI?=
 =?us-ascii?Q?OUvajPkahRjgAsaJV1Yq+Dz+6Tr00PK0DXtTyHl+cvSpHtHSJQKGag9Ouvex?=
 =?us-ascii?Q?qGzptdPElpCxYoMFoMefGyMzC3UDomQjFqA4M7QtqrvZTiZzh+mIaJPcCaC0?=
 =?us-ascii?Q?mCWcVvZi8LEpLPnUOugsmzTaYRqQwH9dsHBnr0yO+jhioKbJtwVyEjzRzFrD?=
 =?us-ascii?Q?sQSnIoi9L/t9ySjdv+uEW7uuK5gn/rR7oHsVl7sU8D7uzdz68BM7taY2Uwzx?=
 =?us-ascii?Q?8krGMICv8h9Vuewuhyx+dE3RqOqy4lRG1ozOOLjOkPov1QLac4v2fEDwcUii?=
 =?us-ascii?Q?+Kw0DqufpqHq1pdD7HgituRbHSCTKffwWVbLjxNWmjEKbcbeMTqhaOGYXoTS?=
 =?us-ascii?Q?jMaJDQKbpmT1ipfA5gildNuZPbcbrOp3vRILmE1eAv7IE4Vzh/J8rXd8o2sW?=
 =?us-ascii?Q?NXCHzKJ5KiQvgOIoFOmiIIQLDCjcYttZq7WXeUaUqvbFJSjPtPjuwKN8pWYd?=
 =?us-ascii?Q?6SDnKhD5frcT94j/qGDNa2RArwFZ8NVCRViRV4kgwjIo9TRUsDDAzyogcryC?=
 =?us-ascii?Q?pwHUBHzUkI7et0vWS6biAsSmTqJam1T/PxX0lgImRVAORtlqtX+d8PmjK3Oo?=
 =?us-ascii?Q?y6+jfPTPP3L3NzcmQNLrpLT0r2ot5Uuo6vg8ue7II3mUO0YVSVogA2wRuBpu?=
 =?us-ascii?Q?8sDM0QrI7/+SnGCZXBDfYA/x1b/SoZIkguu0ksSnagR1iBYKhIDRZKPlab2B?=
 =?us-ascii?Q?sZjKdHTj9t4Hfg1uDqIUwL9xACVdKfQgZgONCIbqvCrgek2cythwOYLWatT2?=
 =?us-ascii?Q?uw7grEOcDaqfLQJ07RX+IpnFkx/cjQ+hsrJfLm4Gk6JWnSilrX+OXPNyrHmA?=
 =?us-ascii?Q?+J35HiDifdzLi/PFj1jtv8LyfvkoYkj+fVjFs5YHI4fqNx/mKz+gCks7ZnA6?=
 =?us-ascii?Q?rTI1Oa/1dlMeWxFu8v0qdI8pspFV0bb9/2xl+Am9iNK0evX6bAEstdCEGlXc?=
 =?us-ascii?Q?13Q2lnOOg7Fmd65BX+k=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:54:28.1908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a533a6-3df8-49a3-8860-08de073b5d4d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5832
X-Authority-Analysis: v=2.4 cv=S+/UAYsP c=1 sm=1 tr=0 ts=68e7be96 cx=c_pps
 a=cJFLXlvTZex2m2t0Pupgcg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=NEAV23lmAAAA:8 a=voM4FWlXAAAA:8
 a=8b9GpE9nAAAA:8 a=pt8fBU-hXKLrckiAU8MA:9 a=IC2XNlieTeVoXbcui8wp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2xJeu2HYuCMt
 CxCuEaj1yXauPU5iypccQgoaSLJF2Vz0DTHVSEMyMO1xELDR7YcGrJjY4m9vr6aNxxKAQhVQ70p
 aJNCkJLRcSWKEAEd8EbmocUEjCJqrsU3xiy5q5R1Q/uypAqV3CedEuN1l/P3lundkaDROAresGv
 HJrW5cAbDhC7vs6CaFXqeny/DJ2psqtZplcXQcj2o0akltQ6h4il6pPOvNz9xobmcEACzkRUwac
 c5o+GqbUJ5VkurnsQlXXIrd8b9H+75mb9id4aXmtY6CQjARQQQ1yCwd2oMXjtCjNHDtkCPYcyXb
 ZcR2bHc8RWowYGSoZf3ehx/VV32lRMfY2BQyGsPE3Z1d8BuWU/vOGhL8zmpEwBb6S7SQQmENZlN
 jxIGwnEiENvacRHgsrLb38GaFsrSWg==
X-Proofpoint-ORIG-GUID: 1Sl5jui3Kqn6lmZjKA_IZRISJvR2Ox_V
X-Proofpoint-GUID: 1Sl5jui3Kqn6lmZjKA_IZRISJvR2Ox_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 07/11] ARM: dts: Update config node for
	stm32mp157c-ed1-scmi-u-boot
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

Dependency with series https://patchwork.ozlabs.org/project/uboot/list/?series=476911

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
index 7c0d1bab11a..54acd507d0e 100644
--- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
@@ -12,8 +12,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 
@@ -36,7 +34,7 @@
 	led {
 		compatible = "gpio-leds";
 
-		led-blue {
+		led_blue: led-blue {
 			gpios = <&gpiod 9 GPIO_ACTIVE_HIGH>;
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
 
 &uart4 {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
