Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C38C5E31B
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF0EFC628DA;
	Fri, 14 Nov 2025 16:24:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03AA9C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGMJvf2998054; Fri, 14 Nov 2025 17:24:42 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkrg9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:41 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xB/7XGlnAYy1QWszUiskETOVEZ5xf5xrOYNfc8JYc83usa06McCNspqfssmj+0ZibLaaSTX70A4FOa1sSpz2O6lF4MzN3hD938GLezYUClZw7i1TbuNyk14kOJN63+ovkTjrjZTnhyKAGqUyQRgCaGz+vhEnvUSr1HN7IOxtdchJFp8uUnc9GqcVfrGmMnYxPBD7jAItdW6IgkaCWMtBdumgmpQaQbnFqDXxpKZ9WhK1c/Xel34ORGfgvZdaI+Ve/I7UY2ITXFx/cbNHfGhmhPsKdwjC1ZDIesq1ITlHpSTmWmeic6tAFjKgN3FwXMfNp/m8cCx27ErZkk1o3HHsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJh5Dxw/KvIXxL/DfAq1mXgV2TZywxeVUsFGDisiZrs=;
 b=xc8V1YOy2nPk+WgIUV2MEewoXme1tmEPTXvzK3l9iCkLdd4Ox5CQYRNASKsbTT736Hr3UMIFRbF07nnWM8LNH0j2zRaVUMdyoqeNIDr4VleSd7QPAWMc5sAfmS0R9grfGne43gmkKCRUw4EnGxP1Az1vRnJR2xb1lrmjLYtwWKxRH18x5u97FAkni5PfWtAYuVUWtHsYviu9H3H2xNG5fTk4+OfFmnXbaInSYTcefeTbGss7mH2MWfgqaqolb6UnFEl5dfAjLshd+ah88UXUBZ7egNT4ng6nvEu+M+vDQjtqTXNgndT2gKz7jNNFFlYE3s5ZPIsHAXEzUF7s0Rcj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJh5Dxw/KvIXxL/DfAq1mXgV2TZywxeVUsFGDisiZrs=;
 b=IeqjpFOv/XW1ZvQNmwcUSq0RZbOHWMNd258s5zN3CljmDtl4gVdrpPhyoMov+P8A1vGXxHzhX/fZdjgEYtZHMUfSxERxP/DSWkextd0xuk2bqZw8YmfRWeXxbJD9mlsK8q6I+JPLUT5yLWNRdBvqWaNZsJ4WLcpcEQ6CsTaUvSc7aYO3Afkoqe7OO/zVZZvGFzYIRSCfZfJUYHvBSxNpUbq5fR/7SCVv0YtslEBJjGGeqimSoGmpP0xKgbIMn7ZpU95JUKENbRHLyTpawE5xveyQoamnR3p8CBH5qK06hubg1G0TchkK0hkDJucDIPXyBBM9+R+cwJeNBDM2gCd0fw==
Received: from DU7P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::17)
 by FRWPR10MB9323.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:16f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 16:24:40 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::21) by DU7P191CA0013.outlook.office365.com
 (2603:10a6:10:54e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:51 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:39 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:56 +0100
Message-ID: <20251114162417.4054006-23-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|FRWPR10MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e891bd-516c-449e-6e4a-08de239a5011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CCq079DbNhAPaaIGP+4etesH8tee81lHGRwzFHS4T/+Ns8qsrH9KO8C7NSbi?=
 =?us-ascii?Q?49CwZ33IJ/Y296TnKqVFocyUdGDvcU5VqLd/v2ImlcRyPBf5aB+mrLp24RV4?=
 =?us-ascii?Q?I0RdZro8Ovo9FK4t4EYrfUT1zfiLUJLb0D9B1FKROPG7KKKE4kTwKZJeME4x?=
 =?us-ascii?Q?NJ4Z21V+i3LxHRayzdwcMkgNVADUTDqscB/iU8UrvhR4qgNSRorC9+uKglZg?=
 =?us-ascii?Q?EtmRsiJl5DHwqX95D173YfIGRaGkmVozL7U9mYq6a1Jj7NnkbexVjczGFbzB?=
 =?us-ascii?Q?dVFMOFPuXy4wA99z+nucppouGrCfLLk1fFDT6iH0D3X28ZoTJ/eQ4xYNWc34?=
 =?us-ascii?Q?Z4WNhh/Ph729MzgT5MMbPWdmXrmx9XVFLQox6cAjzr15BkHWPioqRRMsNqu0?=
 =?us-ascii?Q?4ss+Rm9UQtf9OWfH4vXf1H4HJSq1xYZvqgt8dQq5MIz76Iph7K8ZMLClgUzF?=
 =?us-ascii?Q?qoaJRCY8aX+lwEqoi+jlSlBIDQA6+VLloOA9mBqhmkDm7JBX8VDalYZjcMxN?=
 =?us-ascii?Q?BlTnRwkvNJc/DKWWaLZfbkEBdD64StJn9GpVfn7+M7AXKZICvl+up25wEDZx?=
 =?us-ascii?Q?ayP8LLYdcH3LxzDY6N1ccd0JEaBTMavsQrUfipUDwSzajO8smopjfMIekitw?=
 =?us-ascii?Q?NIZ2wYOu6VL4/Q70W0MYLcChZZERNDKFMAE2Gc6vfwYx24v0TTopJCmq5roF?=
 =?us-ascii?Q?2/gmE3D/lk+2hz4ewML/Mf1ipfjdqgCvyFZzmJV5qx50VBNZMpMxiM2qfqTU?=
 =?us-ascii?Q?9K1KO640d2Rj/a2rI9N2S3Yt3juY4sSq19XAMuN8ScbsqpS8opLdVKCP0kvq?=
 =?us-ascii?Q?fi+CRW5RBb0EBVtA+86G1Pc1kq7NRt1hQafLTaLVDpR42NoM7/PrznuFOVZ5?=
 =?us-ascii?Q?8JllQOro/t95aPk+xgM10zk5WQLWlEUKCsNat3N0NCouj+SKyOAYLAqroypu?=
 =?us-ascii?Q?TyMHQSsA5N9L2DhmuOnFABkzXPtuoQdCX24iMYey94dUlumII3Ks1SC/FpVn?=
 =?us-ascii?Q?fmk6qbwLy0omAQqBDoczCpEdzEpMJ/V0ZL/mb74OXFt1ArRAX+TobGFuL0pQ?=
 =?us-ascii?Q?Yz89g1OnpBey7SoteILV2CSIiq+dOmqK7RLq2enH/Yk/EfdbDu8p82Fr/vFT?=
 =?us-ascii?Q?w/sEwW+sBs8Fr5SV1dAbp+d6zjVBbF5vQLoJ1AXf/Y60s6p+G+78SDYRiTpj?=
 =?us-ascii?Q?tZzxxvn4kVX1mwgS+rG800uMd3gV/HVjPjcyjcJPQsitkXzRvG57LmsUTeHT?=
 =?us-ascii?Q?jmgjIqC1Vfx3sEwaHVuvuXlf9ozaqz/jKyciAONdFwc24rlwn9xCXdfRdu20?=
 =?us-ascii?Q?p64ZIhHQe6K/bjSjJOzDsihrjynAEqIQpuZMcfkzRM747jlT3ZC6n+BPosaD?=
 =?us-ascii?Q?q1PKPO3+F74mPGPkTvf/XzXZLMFuEXWrK8AxVYDoiTBuWfLgn1OkGu5XyCaq?=
 =?us-ascii?Q?liTR+Phvgktdz7AOzZeIqmV7KKSfR9xxLrtd1Cxs9pl3hvzNf2yiE4p33N8Z?=
 =?us-ascii?Q?yLmajVhEYFFR6901Jae43f0XV88PGj0aRRO8k5tWmg9wRarLgt4dGelsIlts?=
 =?us-ascii?Q?PvROuJE1k+CW+fyI+Jw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:40.7327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e891bd-516c-449e-6e4a-08de239a5011
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9323
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXwblLKqYa3/wq
 hRpbUdpULl/OB/YBIYCxIJK1uGADKhGDlNkL9QAYh0dqNmXKcFwLcyhcb9t8MJu9CFBi2tFrm7F
 XZUagUo1VJ3refJIOtCLny+fqtvl5rWyufBxH4fHZuWJGgZ79b5thTe+uFTZXY1ArXyJYknXbXS
 cKeZRGB/sOwe/MUBqEgZlwfrVWYkEAEE9TAPC+sPrIZsu4qRpUUPmijEhs28npfiyrU98D/zcLD
 3+Y70sDvErsF16sYGUTe1AQVd3e2h9NSl0GJLoQ+SR8aZR/YRVO1uu3IaYIduXy4e68pXdJ+wdg
 /+dZ8vbTSKFSPRsoVEKO1cwGltvNcViCgfhL7dG5itPpn2EFmrARXC0kfJ78mtnT6+0iYXQtHA/
 pyU9PEX1SZyDyfKGezn9qfGom2hkFg==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=691757c9 cx=c_pps
 a=rpDra4TIJV0i4HlMjvoxBg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=g5--MkaRgCOj-ZVQwt4A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 3FMXgQhCyADLQdaeO_iAte0XKSkeq9LZ
X-Proofpoint-GUID: 3FMXgQhCyADLQdaeO_iAte0XKSkeq9LZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 22/23] ARM: dts: stm32: Drop "u-boot-led" from
	stm32mp235f-dk-u-boot
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

Remove obsolete property "u-boot, u-boot-led" from
stm32mp235f-dk-u-boot.dtsi.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
index 1bc77874050..ce8003650bc 100644
--- a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
@@ -7,7 +7,6 @@
 
 / {
 	config {
-		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
