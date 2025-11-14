Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE99C5E349
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 059E1C62D4C;
	Fri, 14 Nov 2025 16:24:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C77B2C62D36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGEjC92686620; Fri, 14 Nov 2025 17:24:37 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3rn7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:37 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfQCNNUSrK30SfxmMGWgbk2EzmwrEAPV0rYDKeO7cR5iO+2adkBfF6z84qRihipCRKw2DjIanio6qOvk9qEPrbtn9Re550xnejcdJLp/taf9P0Ram5rFd/GvR+Hqpbu8c6xBzhnkOCbnHfjC3myAwLMA5MGr40AkrdpxVDfBpG8rtmdbnGn30lWrSZoKF8ZUoi2bFkclTF1pogibGgpBPv7N88V5GA/EPuJNzhq4IuoOwB/LgnD5nAw+6Rl/NIMJ6xPPI6lVQj97OsLpNoafn0jpmiy9un6/01MVassDg0QMtTsOi4nHK6xCR1o3T3bWK55HuzSxAiR9YntKp9mN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1Qzx/xy8XaP4ZCKPvjOF4z9CaovdSfiJJGE/iYQeAg=;
 b=sr7q26kOxgwrbeFj93F63WWVDywoQR2a63Uz/UQyYxcxgaBAtcVIk12kE3t/OcsegJY/dyBmVxemmftnQLcDX5dskCnJVgxPgMz8PLyQEaqp8SkUoG0a7USZx88nHWSzwuADIn/djnqnBbigS+7yhpK1TtfGFit6PliIaJEj7dsJWHjA/WU2vvkI7pt3BNwjbyXXXi1jAchwo2jVCr2kPETUxxUbEDoJyE3Wj/WP3MAQGy0gGMcXmM7w/339UtgFQoobKIKtmyXMUUvSptmYgoj31YTtxdt/P/2Px0WhOTsHniXJOLfN/O56P23IcigRIeQaHh6PEFTu2ZkfLhgcFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1Qzx/xy8XaP4ZCKPvjOF4z9CaovdSfiJJGE/iYQeAg=;
 b=TU5ARRDZ014YWGaWzYwyCKBLKXTOun8LCJDoA+Uug/KsijWZdNQsaEEEx+s0t3S4LMJc1DDA979MkD9haULCWI7vKUA5ahjZOm5QPsJ70mJ6ocKD6HjcJUMCsKEJldH6pU0tTjgbc8M2onIfihgBGP1m3FpBQa7Y5CywECH8Bg1qGgWfqCX+jxngvQUGIu/YldhjyhAxiaj7JKiNy5qQGQ3YNVUyHMo/jsza4DBGFslI3arZW7tgcBPWTIT3+bvV3qJW9gpZsE298Wr8qVJNNZ0cNmzYRmZum1vloPS6fJMvWolOpls7NYxr91Ih4W4vZFgt4tRikPEWkbnm8CqJOg==
Received: from AS4P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::19)
 by AM8PR10MB4001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 14 Nov
 2025 16:24:34 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::9c) by AS4P190CA0029.outlook.office365.com
 (2603:10a6:20b:5d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:34 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:46 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:33 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:49 +0100
Message-ID: <20251114162417.4054006-16-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AM8PR10MB4001:EE_
X-MS-Office365-Filtering-Correlation-Id: 07276f39-53c9-46e3-91bf-08de239a4c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VrQMIApJ1Ux/snibV3eo6FI1vSr0Oh5XLzWTdTckIzfwpEYcR97VqXgtiy5o?=
 =?us-ascii?Q?+EVFNXy2+aXqg5HFq6ffxTC4mFjs1xp8zw9NFuxVl3LBxnq+MxMrwGl6Cq+d?=
 =?us-ascii?Q?y9yjij6DSV2D93c1NuR0yZQuOJIaRKq4xJDGLGABD3eKLJ1BeNLCYpQtLVKt?=
 =?us-ascii?Q?Tr0oy3/CbL4DPdsuTlI7iyszdCha1vcw+YTyzV6MEjGxKPhHy9WuJZrqc3BP?=
 =?us-ascii?Q?RDF19Xz7iY8cfd4CF7b40MYgoFURBbBB8oZVYjhvRtWXC7AHf3D3+KtJrrgJ?=
 =?us-ascii?Q?6QJ1CzLHXaT83sqYC4o9gJ475hpyA+0gjAZm/3wyrDlnP8Jv2RDOr67lTrlP?=
 =?us-ascii?Q?h7OC79pTL+FgF7VItXeE2Ei//rjF41MBPLOMooiz4lztahwOV+S9iUAoZQH3?=
 =?us-ascii?Q?ZStiUYF3JvFIhULP6y1bj5mThPvqoktVSpjUqKJ+wEK79qqKkUiXKtp787w2?=
 =?us-ascii?Q?ny5aBRXd/cf1+TJuCUiDGS92LYHqkKVemPJsb614hSJQWCkVZl9o3AuriKzK?=
 =?us-ascii?Q?dbziCCd8DSaa4uIbJ8UBTqjG7nE78xcJAKL6jNBKt43C4F9kMaszF4KW/Zuh?=
 =?us-ascii?Q?RQBILGyC59e4ZLcsH5PajnW2a6YhJ9eYuoEX509ZIrqNuFZ8fs3G0a+cUp7g?=
 =?us-ascii?Q?e4BT/igShWAPJuaPYbzCLbtFrov3SLTUJGvlJcqejbWy8q84MGGtK1xtgBut?=
 =?us-ascii?Q?OYzNfVxN5MQTWSCEvA3X6bwqIkRqb87rE45gK+Fjwybr9NCWSVJ/BIZFQCOw?=
 =?us-ascii?Q?Hbh0MUD3+BhFaCr/5aJGd/mmmExjcV0dlOIfuh9ZVZMkCZSKwh7J+0T21tfa?=
 =?us-ascii?Q?FSNkJRMZg7swn8j0YXiQUQpPmA20X2gY/O5T9QjrC40mDkw/uHwmRV+S9l1Q?=
 =?us-ascii?Q?xQI3qGodoXUSLtdeL/EMH59Fg0D9cXTsLQdujsx/ASrYwaiesNAFbhqGOOvm?=
 =?us-ascii?Q?YwL+GjLc7KbrLDnRHl70VcMTHNRjg7Ul9GPxI9gYRleE90O3ldXLRif8sEP/?=
 =?us-ascii?Q?t5nCXMkQNqWufd9HiEpsPUnnNo8kmIsHt1e4kGXy0eI4wumecie+tIKOP/Si?=
 =?us-ascii?Q?pqrqZCxPxgjbT4DGrRAYDh6dgUx4ylr2h8JgI9K53Q/YvHlL46iyzytmqTpj?=
 =?us-ascii?Q?JQGz3l6XGyoDbbMPU5yYMDlEtKFC0OMv0zIufv67QJV5Wp6J9Xs0H9lbdTvj?=
 =?us-ascii?Q?Pq68wdlQD1e64orrp6nbw2Hm+ikyv9d3XbvSX5W+3Ja8F0eMHjk8qUjdb54y?=
 =?us-ascii?Q?ZJv2JPBNdEwevyE/K3qwqKxVHeKDb+0OSoBSaqvNCLMotznpbBBk+ZWMiVY6?=
 =?us-ascii?Q?7WQw6wJGi0JoILqu4tLcsKKby3MqvIpQJKOf0qWgAS3l/C4STrGBxoDofbOs?=
 =?us-ascii?Q?gxetrSiVc17n+SosmyFd0pbSh2DG9TgXz/p7X9HM3+nmAuq4dqdT+Boyq00J?=
 =?us-ascii?Q?b1bq/IbSHO9Y0iMK1jGCxJKfoVIHABpjWMq2E6TIrUVpmEfP+mAlWxmeOvVu?=
 =?us-ascii?Q?0ZMYuvOjiyJg6PdJFj4PC10hOAzTWyz2mFFmQqTn6cgYqLGmpzuHMD2U5zDF?=
 =?us-ascii?Q?rpgn2UZw/VjhA2CkBrA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:34.2359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07276f39-53c9-46e3-91bf-08de239a4c2d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4001
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=691757c5 cx=c_pps
 a=M+1nDOdoQCQ+1suM7pAQFA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: raD3o2IybNWebskl6_bvK9NuOiyAF1OS
X-Proofpoint-GUID: raD3o2IybNWebskl6_bvK9NuOiyAF1OS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXwJJHJm0SyTDy
 q9SuoCMf6gEHmmU16V1/S8nElnBvzOOrIvVml6i/8/d8wqLUciybo1D6oZjIr9QEiSeo+qPHrAE
 qSJX4wQ/Nk3lLmNWNveJz0jkimUWVIHU5R1JHSAn3PC2WBptjJHCh/QH7VPUvRPY2eeu0LbmZPA
 Vvj5wdgJ5S0UY/e6iiNfyIJuZAsESAmqbLzHT4CI7OwJzaqBz8WE/q5YTXEUmBbHkK4Kto50QRV
 nM14HDLfP2tfnhH9+NjiSQiWuLwuR9qrTD9dpzt34n0php9wdQwQJeyAOk5NM14kFMz3YJBlewV
 6b8cmOlGu0wepNDRLzRVRXsgcqp5R9QhPyKAj61Tfg7v+AEDyp91hFycK4AjAc70F9ReJJwbAft
 zihH+TpfzrZNs/T34nKHVfczrrQ0yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 15/23] configs: stm32mp2: Enable LED_BOOT for
	stm32mp25_defconfig
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

Enable LED_BOOT to use led_boot_on/off() API in board file.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp25_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index a5ee02a09b4..7c3b46fcf94 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -61,6 +61,7 @@ CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_STM32_OMM=y
 CONFIG_SUPPORT_EMMC_BOOT=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
