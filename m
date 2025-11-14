Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA18C5E324
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2724DC62D32;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EFEDC628DA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGLfZa2642462; Fri, 14 Nov 2025 17:24:41 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011061.outbound.protection.outlook.com
 [40.107.130.61])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k3w00-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:41 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzjaUFcR889gs3O9cff/2QbKu/He8SOBYcTlskZg4J+8CcKui2JANwa7OCZKXnUlSCtsqzxS0GPDoSZLmhX5XSDCFlLnhFxkln8WnEvsy5d1IjoVladVUg4PV5k+XVSGXu9CBrYO9Z+7CtQQna43N2yjagUExXWyx92DeUt7B93y8yFbTNkK16MKZiRDo8ztVzUSntBRIkJdCsNLRUdMk06zaPr3artm8Jn9NN9+iM1K+6DrX6Jgo3sGZdZ4rhocXEfJNBQRTpRtROiMzazzveQm7G3E4/fQAjPS0Ki3ngX1wsGSzxKKXMT4CdKqBYt+q5AKZLuzGmOLi4/bcG2gOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AKOCjyrgItRLOcbYsp0/bTZrP6PfsVpkzKKguCAvtA=;
 b=pkFCmawUc1tSC2cWF8aeQ3bUWVGtniXG3c63SyBdPDTQKgJQPjKAMzDkAhfSbomrbbtoXoXxNmGNuKH/RUVykgSYFTy1eeuzu1zTT+cMyL31vIFICbmeKV9mGc6rRKbdkYE7w1k607qdeROeKpC9QGhxFmC+n651zCGBLyRCwtd3x+1jVlOP4lrxxMB9uwrmDmuFBXURZHETWA3eObCzn7tfcdvqBoDpoD2wTDVWhy+fJom0CZHSOW+9FDGH8FmXy5GTuEH5SMetVkiHVDxEQj/LrK2IBTfmW/1fgPALhcIrzKXII7URRPggNWPp5+19BOAE8aObqKeIZDEEhZz13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AKOCjyrgItRLOcbYsp0/bTZrP6PfsVpkzKKguCAvtA=;
 b=JFyfACRxEdcdGbQeWRBI31Lq2Ml3WciVn/I8Kk/b0B9RqKlfmuB7/yngo90hyxtmyAcilcicmhJPRJWlq4kLlTb8vrk26PW9ke/T9f7XOi/6Md28zDbFhWlme4nio5eHGsCRVtRb89HKuhzmQGSJePmDNRoJpPiHj0xgPjTHxqnAxMGXOkI+MEHmmDcYFQ188w1nrpUA4hAQPU+4DN1iQ2/hocOsqqdBvuRAZdAcjPxRlD2mdnPJvOfzAeplPq0opbB+VOLaxnpXVVFshXdL9c1MhhhTimoUgj/X2eM4J8p5r4QuwA9BPZX1fdQj1FNvVsDrkkJrQjG9NnnTzUGn1g==
Received: from AS4P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::20)
 by DBAPR10MB4137.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 14 Nov
 2025 16:24:37 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::e7) by AS4P191CA0014.outlook.office365.com
 (2603:10a6:20b:5d5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:24:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:36 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:48 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:35 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:51 +0100
Message-ID: <20251114162417.4054006-18-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DBAPR10MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: f25424c9-cc40-421b-dfe0-08de239a4d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oWzTf2JZizXdUpDuMxwhaXbe6W4BeKRgW7L2O6LuH1ses+e73DJD+Tt1HYpN?=
 =?us-ascii?Q?nCV8jo2ymwTnQJS1tA8WUAhfO4Dp/vz6wOmEO3Xu7+NFHxUZmWhaUPgs6vXH?=
 =?us-ascii?Q?h/MT/RzPxvplwDk2aLSlremCsha+c5ewBe7YMW8VWXXftEQJK9VUMtPinMLD?=
 =?us-ascii?Q?Pm7r4AYc29BFin3ekht7eDmZlC+8jV1D3O0w8zDWZb/E/oFizHOi5sZJc8bO?=
 =?us-ascii?Q?aSQ1hlVDJUGFB66coVBNSHayZ1GhPIFhreULgTU5NU7clqON37Q5dXgVPwR/?=
 =?us-ascii?Q?IHfM+FxkA+Cw9MzzVAqDEnYxzjRCHqkeSABghQZi/773bvFMkiN0YPVDoWAE?=
 =?us-ascii?Q?xUm5vOfowIHTVg9aBRKzFiJXoR2YbFmipYm5GozMJd63ZW2dus5clPNiMAXT?=
 =?us-ascii?Q?Euok7syw/YYSCO08ik4B4B3e9GlNX7qwhXa+dvbtDF2I/72ExWb4ynckTmgw?=
 =?us-ascii?Q?4XKWafikTxEmSfMwFoe9LwvVTRabiAWr66xjAOKNdDcHy+9fSwDHpQ3byRg+?=
 =?us-ascii?Q?U7eymotBbqVarR+kJNL+XWfAGIOv5MsrO+hxKIASrwKcnduRqHyLYeFzVQxJ?=
 =?us-ascii?Q?9dUC8EgRg8BA+P0m1AapR65kQ6dVoCTNQ8U562FyRvBczCEh4TEeYgI5BXN7?=
 =?us-ascii?Q?l7qXvDa91u+jB6/qD0f7yEv+Oeo1Z97Um6rnAqeCHdSU4rK5IoH6xrAiGISk?=
 =?us-ascii?Q?j2oVgaoS+mva8mo196avjXFXh1Nkvqs7ANyKwAF3OaBmyKnXCFg6vRz4Bz9V?=
 =?us-ascii?Q?yWzSFg6qywVFKcaOMsDW5iPz8JT+8f0kKEdCUdGihMO2QPKNMdi6uhxtY+Cv?=
 =?us-ascii?Q?pUMgjkXvwZxK/ZQ9s0iE97RR+gj2gojw3FSsLgfppeediFVq8BzQ3j8yq70R?=
 =?us-ascii?Q?t2/BHv/bC6+T4pcS5t85wVSWf9vP5AfliXPqxwzq3l6YSbcbwkjqaHVu8LTI?=
 =?us-ascii?Q?O4Cv5Al/ZFPf3mI4sDsLRaMLJrhP8Rw0RWMD9lP8kwrlf4EcRESkgPa+QasD?=
 =?us-ascii?Q?us/ctbknzvVhw014o8wMN10qR6qTSlk/lJTNHs760jp2sY1pLL6SFet5/ti3?=
 =?us-ascii?Q?XaiTlmGA8cXwC4+bjZwerg6AOIHXZeG70UNIfXVN/mqlMHGPNl5AYQhxqVTH?=
 =?us-ascii?Q?2jWiasUh02Zzdpun1bt6kedvb0N+/kirBxjXCJhePVWyJM8LVpHY8iDw+E3Z?=
 =?us-ascii?Q?GjYjgTj38x4rgOisZQcUIjfOOGioHK0XJjODtxI06ElCN0TYCk8XsID5lg0k?=
 =?us-ascii?Q?uJL94V4CGD9zJS1u+0S/31i6hRNY0lhI8lxYZMWbmyH0cgprS9iYNh/i5PTE?=
 =?us-ascii?Q?xcr0XXVdtCDfeT5SEM9p+RQR++llc3vfR7kv7ai9JNLOhdtPxVWZwxw6u1GT?=
 =?us-ascii?Q?ZmVipagVMARR1geaOFVNlJJpk3yCLhneFXkfl4G2txIEoc0PcBBGVfEAyJvP?=
 =?us-ascii?Q?Rp7iOA/BTu3f9RFEsJkhsPPri5Lec/ArTQHoyE7xTAgXgEv5BqPHz6+1oeSz?=
 =?us-ascii?Q?inIKHtclxjbyjvKATHzUQbT4oVofSUueSLH6CHT1ziYY+GQ3BQVxvCDPV8jk?=
 =?us-ascii?Q?/pzdqvYNj9BX/L4JCn8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:36.2072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f25424c9-cc40-421b-dfe0-08de239a4d5e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4137
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=691757c9 cx=c_pps
 a=5QAvvq85QCtgM74ArbrJwA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=5Qe6RSIVTcPmmCO6od4A:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXxgSdty/dkcoD
 1lCihXnklyd9nkygWSuGZl59s3CovNcseXXsqHP9xbPaRyHZK1tDL3/MiYeP24HIt1MN84POrBH
 0vY9BiYPpzk11k+To6ldpXezuUa8PABNdroHP2QIQQKGBAhspsQepJeFynjJCmde90Duo3PKWw8
 v9Xou2mV9W6fxpwXrmbnrAXrgajIHn521Ef6D3JnZzM1ebVYZjo/rPFlZeV1E6SdSW1YIuUVMwM
 dacPYuJXNbuOo/fL+GMXsQ0zYQKiNXhKZKa2rzZb9DCGh9EYMLqoCDdpT7ZLrl/j8LVx2sECLkd
 rGEe+E9W/+YthI4RlaaS2FRTIdhWcUpYM059NIGfnxm8/p0EQxP//DTY5k7WE3Lo2jG0zizXhS7
 BPUXKGdXYQdOoNIQwqnjh16vPbw9hw==
X-Proofpoint-ORIG-GUID: pkpnuwd_Py5-Cz5qOMERO3YYa98TQ9tA
X-Proofpoint-GUID: pkpnuwd_Py5-Cz5qOMERO3YYa98TQ9tA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 17/23] ARM: dts: stm32: Drop "u-boot-led" and
	"error-led" from stm32mp135f-dk-u-boot
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

Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
from stm32mp135f-dk-u-boot.dtsi.

Remove also led-red node which is now part of kernel DT.
See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
index 3d428c3c4db..bfd9f128cb6 100644
--- a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
@@ -11,8 +11,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 
@@ -33,10 +31,6 @@
 		led-blue {
 			/delete-property/default-state;
 		};
-
-		led-red {
-			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-		};
 	};
 };
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
