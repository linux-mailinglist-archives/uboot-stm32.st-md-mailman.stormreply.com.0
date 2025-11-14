Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D5C5E33C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFFBBC62D2D;
	Fri, 14 Nov 2025 16:24:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72DE7C62D4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG9Ax02976843; Fri, 14 Nov 2025 17:24:35 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011067.outbound.protection.outlook.com
 [40.107.130.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkrfu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVGPNEetg548m7eViN74FEDIXzCvsZy3XqtpXGseo5pgv0H0m5U+s+GwtIJSKOIVR3D0ak8K4DPS1BOg+QbBhZW3Htl1RLPv6zy+/KyjtNpSp0ztO9UWzsXiUTzasLGoY1m0mKxKlsCVLrym6YTDCJRBNIOHrvVNo2+d+IazyOdSi/poZpsvoicP8QUZmUzSnMPDy4lYD3JPDPCcZXVveXZ1apMB//cxwtFe+fO7WYMJ/SrgQ6P8KgDEg3sHLiv1EF941LWgpp1Xx81Q/m+VYSBjYCsXg5qimkd7Bi0V1hHQ2PzOd7t3RRsZYwO8Ed2j3e4a1OpDOCvQx3IXhNcRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJS+VDpRD+U94iUcl0xHJz+2zKBddcnzn89FF0rammQ=;
 b=EnlbS9SNtGlN5zToSjdaeO3MbLb4VvJ6gcn3MoYyRszi1AIttQMvXpDzuwvJP3j8yN2g4+C9uFLmAD4bcX6FQM71JkiO1mTiAZxVr2CteQ28XLDq+afv57QP1SzKXkZeQHtDKhP41FhjUGQjvie5g4POZQQq3XF4DnjV8zIz93+lR5ploRWUDiPE8+KLB8GAcY45l7FSd0yPq2swz6pAN8cG5uXR6e7X6LC7MxXS7+fwsvPbHe6F+kJUWHzvJBLt8NoAEkpd6miTAezMoorWbHwILT8QJkAR1u2oLFi3K/vE0xGyZAI91oBM9m0Ruhr27fC6gR46Kwz2f6eBZBnNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJS+VDpRD+U94iUcl0xHJz+2zKBddcnzn89FF0rammQ=;
 b=G/ztoy/ekV5BQbe6274e/N8sSPgT1gV3W7vF2XpNYiXrJ7oAG57T6ty3iYNS+pLK1K7gaygE2xd/DitqCMkhc3RhqBgNHysmTSfG8c+a9zxoSUgL4AEqxR8xbzBdhsV4DVvhpvK91Tyi/ZqqvHZ3gKUw3nxpzvJpy7op/6AQhAaI92PKc4EZiv+zZtEOyDwPjELnbnybmiVIZee7QqVVVMFlrKbOEvMhQYWkVL5+D3m+8RevsApSEiei9EpEfHI46zTGzc0UapadPstTYg+Zppq3d1XJH586QXFKcX3WBVdmvtpKiweN1oQqhH7NoYqx/E8vKcxyIURH+VtpdQ/lKw==
Received: from CWLP265CA0414.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::17)
 by GV1PR10MB8676.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:33 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::34) by CWLP265CA0414.outlook.office365.com
 (2603:10a6:400:1b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:32 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:31 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:47 +0100
Message-ID: <20251114162417.4054006-14-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|GV1PR10MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9a28da-6357-4f02-26d2-08de239a4b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VTtNwhZ9sLvVCoU4HnQ5l6WkASDyTLeHFMK6Oj7+UxdpGLD1Faxiaf2/fIWR?=
 =?us-ascii?Q?smQDJcHbD6fDQtpA5UZVZKHFos9OZ5BeiOWWbYp4hLHyXOVQEcpFJk6+hSRo?=
 =?us-ascii?Q?wxE7ZxayUe2L/7JZV7ffJgJJUBJoMmkQp5PxZ1T8hEElH2DXjvnXL4In2t3R?=
 =?us-ascii?Q?foBXWPZs7RDUrHGqwSG0Ckum6kz6sY7JWss4/GMPgb11DZyrQyP1YCRj2VTW?=
 =?us-ascii?Q?Vr4dNrv/vAEfQXJ3U1FWI5jlNhBHRol62otYqc8U96WksYkHau1f5niuSGJb?=
 =?us-ascii?Q?efmY/aPZ9guKMW3TOLXbSjhm/j1kbYoc777iklfLp7YkSmbIInPz9tCgaRQ3?=
 =?us-ascii?Q?cXOltUFHFLbQkHAdiZx3EpqyffGRzyzMQafElXRFVoPRZ1D5A8/t6B7TUUKR?=
 =?us-ascii?Q?TJTQ09Wxx7QTjUl97IYHCsOJl5se7qCyNiLj9U4pJ05qSmzMR/9fJHu9CZ5R?=
 =?us-ascii?Q?/qocTd92UMxG5RrI0E73JVT/rMefngotyDwiZLwpAZFuxlDZ9lgj5eYQbiH9?=
 =?us-ascii?Q?NoNcLQBxYe1ceRDr2Hv7wPNuEJ5ro+gbynPhR2mPD4X5gklp/wfTpBUoXwfL?=
 =?us-ascii?Q?a10YBa3inA0WTd9Bw47oMFGI3lK//cv9DHX1m0SAs6QuROMId6TIZ1eJsVBw?=
 =?us-ascii?Q?EQ43GOqHnZBQF7YDuYpGiJXVS17xUl1RcZHbumKwj9S+TpnA4RYjMWNVH5mJ?=
 =?us-ascii?Q?kooeAmvUw0wWJYqKipScRvg1/SnKEE7sXKWDoGn92eOaO9fMkKyrcxfuDRmu?=
 =?us-ascii?Q?W4Te1Y6fXmymeIFD87ElYB4aXBQTuKwdJoT7qoOfOuWNLAxRcTxeI91nwHuR?=
 =?us-ascii?Q?Yjhz91YFiz0o1Lcdyfwdbf9WdTGeJyMiOKBNXCVwz8VMjRsx6KI8r4ZaUoG/?=
 =?us-ascii?Q?vGbrdg+BQbf/b71P+S3rXa4W6wwAHGriXAgH12C0ZanVxRJ297GX/cIc3lRg?=
 =?us-ascii?Q?KpaHwucA09KZcq4yF0Hl2BvOYO7Dt9MEZ7IjnbUPagltS8ube1ahBEbP7MV/?=
 =?us-ascii?Q?mMof83SNpKS5rbno71CrP+aipzQRx6LEqYkvtpPytK0RrEP/f9gqtiNQuXN7?=
 =?us-ascii?Q?LsVR6SuDQwBeQMUO5iVGHC4SxTP011CItyzGbvKmvg4oaTInjMP+VXqWctCD?=
 =?us-ascii?Q?gcu7gkp/YXri4AZQJPUx326C1u+7KP9iITaY6G8AX3fAugiV9GNKEl2Wcfln?=
 =?us-ascii?Q?geyMCZ1C2VT+/JeavccOcp+jBBVoCs1afSNW320JGew6CLZv7RnK3PLw5cFB?=
 =?us-ascii?Q?HQx7tlUO5Q3UjCnkDNu5j5mloIRgQ25NdYL0fzh5aKR81RyzLYqm0oCTXDE3?=
 =?us-ascii?Q?Lnzxqb24SXc1vMTzqtmuz/AYVDGIo/EPub2uZbeCr/B4Mj6M94UQz6dpBNPA?=
 =?us-ascii?Q?lsRUkqghbJF46Bv6R70XS5/7Y+D6IWt2ZampJ/T6iCZnACh6DiBN2ZwFYid7?=
 =?us-ascii?Q?4ZBgOn5KtkOaRLKrcQyAurS34ESzlFdwmkaACM05UR5o0tl1fBJYRVNwdvVz?=
 =?us-ascii?Q?7MWP06USkw7T46P1xuw6NJhNuDiJYOMAHzzFA0/0bsQ7pPbhlZJFmzQ20spU?=
 =?us-ascii?Q?uoJBbv4ZefTCq5Y++yQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:32.4269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9a28da-6357-4f02-26d2-08de239a4b1a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8676
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX3Fdg2Nklp/TP
 /B89EVlmNRfpESyXxnaT9bEKeWgjwkdstplTsJEBiqvmXj436hgaZrZGbGagdETx8EFV7DmJXjW
 +ZUjwyks+oFtHurZFRIsh0njwqO7gYiDWLd4k8h/zyy9X/7DvfvAezKIXPUcbnzy4nAPNRDJrJl
 YQFo8sUPFQ7xTVPQhOIld9ZMpP3eG/Q8mlMBxyMBo7Yi+YCpI42DIYQxRF+6ZTPhtoiymI80/Gv
 7Wg836zmleHdQ3HSY4xxmVk1EGXf5lp81s8QHuVoblgRfTdEcaurwR5RwLo8EM6trsAZdcsKrqW
 fNvWy0KArRql13e2zYnFV2OkBDcNikqCXt+bVXKOZhX4ZnlaomN8CPljDmTZ5Isq6+Zy4Y7/v5b
 uStlc9jsVKPRkG2Omtf5Gks90p/9kA==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=691757c3 cx=c_pps
 a=dUmEMB2IXX37q/x6H8xczw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: EHNHumFfqlP5_DhLsrMm8-nGUqvZ5klo
X-Proofpoint-GUID: EHNHumFfqlP5_DhLsrMm8-nGUqvZ5klo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 13/23] configs: stm32mp15: Enable LED_BOOT for
	stm32mp15_basic_defconfig
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

 configs/stm32mp15_basic_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 79593cce9fe..15edea314f2 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -123,6 +123,7 @@ CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
