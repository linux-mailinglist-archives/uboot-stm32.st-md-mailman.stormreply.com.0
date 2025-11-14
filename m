Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8BC5E1A1
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:09:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8902EC628DC;
	Fri, 14 Nov 2025 16:09:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D029C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:09:48 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG8lW92524337; Fri, 14 Nov 2025 17:09:28 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011029.outbound.protection.outlook.com
 [40.107.130.29])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ae4y8rp68-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:09:28 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4xNYStsDdB3f6GolIV9L//YlheL16gAAJ667eYJWP9vY5ywHqNamedCR1i1KCKtWL878apbMYIvwMGuF6m+ywyg9KYDOW+R4Oa3QgXM4iueNMZjFmHp/VV0F77s68euHpAFk90s43kppUWfIkYfs51cHHvcmYUhTPSNrOmwIyCPEsKAeCEym79TWXSvzAVHqCppIC7m2rNZJN7+J9oXSbY060Vm4CFQafXAZV6OAJXYBqw4MfBPqJWfSUA39SMSRMGeV2CzMg3iKcgaZaFhAfyjZpbbeAcAwpZLKR8PXrg9/c+Gs0GqkOLTPI4d86Dqp5RfvMdwjcc6QSOlW4KmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fV0XaNIC7+k4VULnbdpWyuL6i9eZgimb8wd2aKQO6s=;
 b=SMjHmitCMPK0ZAS2vF19RLWi0tlt6HJ/SCg0Nhzk5Mf5ZEzDEvQIsydVdsaOBxG8uyPfRw1aqeOE1BjJ06tLNkPUBcz4LR44dAUuNG6NCbcoVZHMfJN97IKfN0cgz73qTaWqaIONVvUXIwFKgFEb+XCdoehYh1eEaqLWSCiVCXDKm1i/WGt3YXwrWMB9SwK0Qfgotjevr6neAfumZLs7uDdVymAs2AsZnpcL/3UNeFPjDy9k91h7NXgNKKex05hWFHtqLHaMk4GWlaam7mfkpWPToXFJiqXpthc1xWmhuCHCXjWTa7wd8/AaPI/rZRGbR8BEIlgZr6WMZuSdEz83iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fV0XaNIC7+k4VULnbdpWyuL6i9eZgimb8wd2aKQO6s=;
 b=Ybs+3Jc4McS1kmBY1FcfjaJsE1bGu6wOjUBcXm8VA1y/8zmdFprAkIqtZZNWHk6B8nV3w79UpwIbkwu++D9AG3jwbdfWmL1IU2e0TBRv0w97pA/hUP3hqgI6bhehbIrDNQ6Qy8DD/NqsFuWKVAmUhHpda+JFi1heJpkRf738zIRUqD3nYhm+NYdcWQRXytHF0eyCQzZJSPheCJ/xAmkxtJ8nLuP26W4fVdENbjAPfXd18MVQSMDvi5MSSr081XtHmPrCVTTTP4c/yPc7qSSp3Exb8G42NX5t595rC+3VUjnBxHzxyyPdo+BfGpRnOLvxzR8VxOrpyJ2T55QtL14i4Q==
Received: from DUZPR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::17) by PAVPR10MB7354.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:31d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 16:09:26 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::bc) by DUZPR01CA0085.outlook.office365.com
 (2603:10a6:10:46a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:09:25 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:37 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:25 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:08:53 +0100
Message-ID: <20251114160916.4051853-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114160916.4051853-1-patrice.chotard@foss.st.com>
References: <20251114160916.4051853-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|PAVPR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9f89f7-a3ba-4ab5-52f1-08de23982ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QTUGeyQ8TKbqYjAXV6A/K01b/Y4nSNqPXlXCVp/ur5e7FBZbKkKWufl0EjED?=
 =?us-ascii?Q?BZyjKedhLHM2LKAfv+pzw836givRjJzQGqZ+qrvIJPXx3MD6p8bRbjK0vP97?=
 =?us-ascii?Q?olWYLhVD2gRWwCTLh5J75/TRa1E/YxThJ8PYqyC1VGsuoezVL2m/cYcdES5f?=
 =?us-ascii?Q?Z1C20vgDfqxauBtT3j5k4Vrprbg0PjARdWkSS+Id5GwXWApfWpxW/U5my6m1?=
 =?us-ascii?Q?ikxo1tFfRc8alJS5SXlJZMUY/X1hGOHwmoV15AY8KkOiaAPgoVM31FpFYM39?=
 =?us-ascii?Q?V0ghjkVoBWm+beFCWK87euaJ736KOJlYcsrMy1jVJnF0i7jr1RqhNJz8i5UY?=
 =?us-ascii?Q?0A9ALIo4vdSU1fDWF73+ZzBYCR/YJy1d+CysfqWghbranAGuhr/JksrXWw5h?=
 =?us-ascii?Q?yDxFqMX82s2xhOYkUj9lSuA2lE3e0adaJG4g5TAy5GHPxQDdv/ScB2FWUEIE?=
 =?us-ascii?Q?AV5sWB6YzOvJvZQJqSxTsAPKr6TD1t8RyXgpWxTHAZpIKXCyrPrz3WKAUiSv?=
 =?us-ascii?Q?XnoUSGguUKtFrT5wVuYr2+DUO49yRhAD95KH4XX/Df0P3xZLzGikyI6bo5jk?=
 =?us-ascii?Q?/Oi0Ac9RIkvXMOwgU7YRsn0mJ3Rm5ICMb0OcV/FS8fPJJhU0RL27tqjpB5jS?=
 =?us-ascii?Q?pRh+06c+XLGNKQ5ISDakxXmyDFBKV6M2UrmZENLD79iMxB0DJecY0R+wCq+T?=
 =?us-ascii?Q?OX/7GAWTwzWpBdCywTZEz+17ZykwOW5EAop2ETQ0qfI7Djk9btE5ba6/teht?=
 =?us-ascii?Q?06MaQBI786avFr9zn2tz15RU0QELxZu2yt6+CAnjyTiYSqTSLHWT958Q9O3S?=
 =?us-ascii?Q?qF8EE0DKWH5vABfEcBnh8n1Wj/6i6zzhcX4YJ0yt86o6rBv/gEls91P+PUhZ?=
 =?us-ascii?Q?88pYcMd5OuIphrnxhu+Gj5P7B9G2NoRmEBdQ6lO/gkUzYqfTF25rqfTZnCUc?=
 =?us-ascii?Q?T4L2iBWX5gd1G9y/FSHWyo3oy6WRcaqSt1J8qrSu9oUNvhio/hN5vNrm5BXP?=
 =?us-ascii?Q?ZzdrNfFKYa0b4YsXV/ZVGfi47lkJgmMGeO+sALsIMZu7OMQdxxGj1y6Aj9Eh?=
 =?us-ascii?Q?qDMUPsqX7PswAmz9C0Ehcf4gakouJa9CftRAktN6Og+MGelTHB9Qrg/wKL55?=
 =?us-ascii?Q?PWmgSFaXsO0bLURWPzd9DUiP7kUM8T7THjunN/5a8PeLdbyokm2FfW9zgG73?=
 =?us-ascii?Q?+mxyODFZ/G9Jse7b2iqR6xx6rQvtg5YLzT4d3Yv5Zk/OxsqcGtpbW08zEe0i?=
 =?us-ascii?Q?kDWNgV6NMdAAE7I9EUtbLCK2hn3ANT7DbzBz2JvzuCncl7AxA+cJtvVxrZAT?=
 =?us-ascii?Q?v8O2gke84gpKQ7kIXyqTr3S3rIY5tEj9LcF3N47Bd1g1o1ThhUb6fExi+qqK?=
 =?us-ascii?Q?N0ci08x95TG2s8hdXfL706GbbC/IVC05yOrVmenQyYJQ8VAYNzX4IB2UUjru?=
 =?us-ascii?Q?ygmw3bl5z+JsI4HTuakfYtyaN9TxiNc/g55J6NS6Sy5FndgMovO0o4lVMfWt?=
 =?us-ascii?Q?LvtMGKD8XDXyXNgr+cvho1r2B+J+t5c7Jzx6TXUffWk4uSbB9g31NxglrPqZ?=
 =?us-ascii?Q?0Skh5TkcgRDjylXqAwI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:09:25.9428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9f89f7-a3ba-4ab5-52f1-08de23982ecf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7354
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMCBTYWx0ZWRfX4QfkfbMjQZ/z
 ayUmPkqXW+6MpxaAWhpQkvSs3rZ6xWN2m3Tl1fLpT3HX3UKl1ClCkEivSVSxpDKpQCdynQUPumt
 klt9OEO2ZTNuDvqZmVooMmOzlYBQ1MoGb+2HpzAnyTbIwXEiPrCZsXORduPo7uMZNSB7tvMs4G2
 5BpoubDWpQQ8vM8JfAEookYloVGHCdTZ7D2AiovYlRSWy/96548kKh7QAgedoPf8ydXP6n+GKXE
 42mAqKCemoW9g01OhzG9FZEZqBwgSONLPoHAkHtyyNnroJtLqJ+OiChrqnJNVYbPZJPBlHt67iO
 PyV8LkKsG5hZx5Hcdu69ZbmqMZKhL4KXCoOehTvrKdFB+sYUzmYEfJxqNPeUCqcLzisuXD5WOHF
 SaSLiRMWqzxdHN6kA6a1sIy5ZmaRHg==
X-Authority-Analysis: v=2.4 cv=ZOraWH7b c=1 sm=1 tr=0 ts=69175438 cx=c_pps
 a=FCXGMy8pXViI/SoB7+PbHw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=ohR1Fj1OpG6KedVfzL0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: RrZNFzSXuWXKEUQE9wZetEcrqA53jsKS
X-Proofpoint-GUID: RrZNFzSXuWXKEUQE9wZetEcrqA53jsKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140130
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/3] configs: stm32: Enable ADC support for
	stm32mp13_defconfig
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

Enable STM_ADC and CM_ADC for stm32mp13_defconfig

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 configs/stm32mp13_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 3283e910219..8ef465ac222 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -29,6 +29,7 @@ CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_UNZIP=y
+CONFIG_CMD_ADC=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
@@ -56,6 +57,7 @@ CONFIG_ENV_REDUNDANT=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_MMC_DEVICE_INDEX=-1
 CONFIG_ENV_MMC_USE_DT=y
+CONFIG_STM32_ADC=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
