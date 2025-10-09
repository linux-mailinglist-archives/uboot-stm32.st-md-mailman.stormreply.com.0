Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1831BC9618
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:54:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90BEC555B2;
	Thu,  9 Oct 2025 13:54:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D722C555B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:54:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Dl6VT012220;
 Thu, 9 Oct 2025 15:54:25 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h48u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:54:24 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcx6JnQIp2dSh/LKBH14s8UKAf4tKRtOaZUYNhiLbSCuVyOoj2dYxvQjJmnVUCQs1lJeLb+tCsiaenS5/xbfwg4GOMVxPPx79luJgOqBTPDG7VvUSw0mlBWhlqCd0tjJLJAH46KSdPYwH/vZaVDJl9zaUsiwjd8SVj6SSf9aZV0tlhmOaIk2ipE/pUi8LRCeoSvhx3T/b807NWzKjioprPOiGfVDAx6dKGO4WoAq4q9ioMJ6yc5oz9fvLhDhn8EVeiuzxObJ210UuCnDPXwU5Nqf4zNTjWVumoHbK1ugV6O3v4m19HWXu8ka0Qbek8T7+b46Mpcb1KlrG8Ek38M2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0yq+Y4fEGp0XscJTPjilm3o8LjveH2UT/RA5dOc7Es=;
 b=qwDxhdcpsV/BaAf+FZ1CdfosjkOKUwFV8ZMEnsG9N+6wP/swcNea/xvek7L0omafkegPJXFkSXNuPej9Azw5foERXTBFdyvdU6LVvNr5tlpRn2Prl/YcvyTAXEeCNmO7i+kOtNYSNdMhpU4bPV/4Oa/UiaMp23bhvtxzytXNuu/gmF0ntVpAc8Ku9OOvSKahDngv+UTtEJ/mHzPccZLGqPe2ULNY/cwBUSYJUm0jA1y/U96St9Y94+0nD7LVZHG9bG30I3HBrU1CKlhRUzbVnqFT+D+rKpqov+UI/TaFy3U+tVlGobDfJR8qstTzx3F38cW2/W4VLSwz2jQu+sMG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0yq+Y4fEGp0XscJTPjilm3o8LjveH2UT/RA5dOc7Es=;
 b=ZEfep5PxW9C4V0QqNWNE3tOTpOrAUVHoYUNKNLS7HXyHfaczPlN5KQ4h4yq2N8E7nQ0YKq3s6zB1gWFGZcVlGj1DZgwXBWy7oDE0VYld3J1FINXgkqNe5ScopbmHHDbWNLRxrnspBfIFbZG1xEnZua/olrMFNYmVlERSjqav+vSJDm2RvqrVAFb5bmOsG3Eq5iIxbS4kHzA7vC9fpsn1B4+M3rKWnOYkAGPX9S2Z4CTSMEDgysbeS+mZiXKcWpKL8TIm5Kgtp4zlaGVTHFPdNGU3Z6IVoy1j/F/XFXAkVTzKTjWClDYGlWKkF+cdqJ0SERnF3BVdyq9O4shGWRk/Pw==
Received: from DUZP191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::12)
 by DB9PR10MB7242.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:454::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 13:54:22 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::3d) by DUZP191CA0002.outlook.office365.com
 (2603:10a6:10:4f9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 13:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:54:22 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:47:13 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:21 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:53:55 +0200
Message-ID: <20251009135417.282290-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|DB9PR10MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ff7d92-b38f-4823-c1f8-08de073b59a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aMX3+ge/7AQCZ9XzdEr024jDnETvFU4nsumeNzYozwsC6H4Usg3gwTyMSbST?=
 =?us-ascii?Q?kYmEeIyNF9kAkn7X4IrD/uDv0WPqRgtlpDA45SwBD3QMRVuYykUM4B5Un3/C?=
 =?us-ascii?Q?1zP+rrkLYZHV56DxjYiwSkpkHjS09oY5lrBTDYDbRPvY9dkDWDGxDZwoclaY?=
 =?us-ascii?Q?wdRbnffpVv334FJK5Cvlajq3ayV/sWkxIMbysaq2fNj+L1G6nS+aIVvPdt5m?=
 =?us-ascii?Q?BgweLHcT9Gn0qZ+YWnjcHBgkqWrDIw7rQkl+Y+AVR3IkB9I21faD38o9e4Ks?=
 =?us-ascii?Q?CSHbZJmLuGVOY6oEzgBD5Wk8YRyMSVVO1m19KUmXcJnN9eOlXo9Js4wcz/H5?=
 =?us-ascii?Q?AdvirubO7lzZLUrdwDNw7/B4AG+objj/h2miDHwhICG7BZMQCEXBcLtmOGy0?=
 =?us-ascii?Q?6zV9z18ZbPPY6Bj3R74F4favcyxfArei/dshmJQAEqn1eWt885RAv6op1Gne?=
 =?us-ascii?Q?7ThAs4A892nTmBqxYSmggmihRMvGFW9X3alsTJMTk3vXzEHDk2HRrpLMhHLX?=
 =?us-ascii?Q?/hdzo5/AYHHJF+VOd6+69UtBVotaVK6TPcnex7eKKIxGDc/XCVcXNv+XtSC5?=
 =?us-ascii?Q?5lsYSoX3IlZzNurb95V8W4+B7g12rz4O8zRJwKByUOKXYLPZdFwnkhoKQ9dB?=
 =?us-ascii?Q?Au1shjEmcAdnOAdLXd0jm3NA+ulwjrwzL+1sqcuqosUkVmA0bbDd5iy7+MLc?=
 =?us-ascii?Q?V1xv7ZGY9k28Jr+bEmHIDVoE3H8lzkFXuzjgQQHeDPmfRp4rFahhSAb8IjKq?=
 =?us-ascii?Q?mHzhzABjU6lbssG3ryeTGPS2agMMtCKpjiyU84Eyg2dR862yg91jTYhqfRR+?=
 =?us-ascii?Q?Vox1UO0tgAPYrzPZpa9zQwgnzzemTjtTk49Gqc+iWx8Fu2g7Vu6/T8i5mAXI?=
 =?us-ascii?Q?msUriFUlg1rxFAgABEp+CcYkLEzrv4gLuT+ESjZQ/OSp+i2R/tPzRs+JnB+q?=
 =?us-ascii?Q?mi8pQFx7NCf4JeYf15TQ9uDSXSaQeY3l11m9UEw2Zf87Ui32N6on4LiywE4n?=
 =?us-ascii?Q?ViXx6ctwZ4ih8BNwsvn/AIdcdA3sWzUUgId7iS/OuoYSTYijuGTdgBeCwqIi?=
 =?us-ascii?Q?y6ZqyWYVIM3rJkfxm3j1F4FgykgBsA6jMDy20Vt7aUvul8ewZy8h9iAyzKiw?=
 =?us-ascii?Q?PnykPIYXg6l0UKsQSYdOl7P9MMnDuGXjjLpAOpZFUOgNg0ULQm2mxhA9jZ1a?=
 =?us-ascii?Q?GvKWHvAuOGcAmrINnnolQH1HJ7BAfzAgIXrBo1Znfr0GuqDafxgfDQtkvGc1?=
 =?us-ascii?Q?Woqy4IWKG6mYED3Ud7oO8u8Fdg4+X2J6Zf2YbC5W48+kgBvaDj3Ie9NXvvav?=
 =?us-ascii?Q?s1xqokfTeCjCI6rxe7OpIEA3KPOwCILr9Eq44fvWYBgyc2b12+H2cL867TwM?=
 =?us-ascii?Q?HRPdwnlAcVsP7dqsasFqtXgK5z8z6OjuDm2O39HDPsfkJpHMiNE1AOYMKwMT?=
 =?us-ascii?Q?fFWI6B7gtdo5Fk95BTG+bzTvcT0vhnmXYCRB3KJVOgfHhN2yTqwrZBvDSHqu?=
 =?us-ascii?Q?9K8BLzOP73Dv8qJLoQgT6TUXt+l3N0sjFStiuKW1zpq3rEr4dSX6Bi3iL0sh?=
 =?us-ascii?Q?B6nowxiPjvspPuZDar8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:54:22.0179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ff7d92-b38f-4823-c1f8-08de073b59a0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7242
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+/rtldgeuOA9
 KNZks8g+nIlVVnfRnvANsjh8GS8T9TO1cLmR3PPnlqKyRh/b1LQ5sjOn22DTCXEuudEdKjrBYLL
 QNqePRIRVInedIbuHdamqcinFvdBGF6mWajuJhTYE/IXi9R9S3NVmyT8v3SJTI8p7o7G7lvX4TW
 wAkDfwQq+666gkzS4lX/XyqCyemZay0puOXAYo6LiAVcSmYAxrbTOLoU+n2EquE1zZ98cMtEETy
 QN7tqqG6+dgSHh8/rTR0ZeBLxwxIaEKnqgw6mOcSvCZ8SmGc9I7Z26QVHEd9h3eGVpsiNl8vlZc
 hK/tLoHOYfivHI8pLqf1Xi/97cBZY4xqgIH25uxSdEl9vYOYkmFuE6Cd4EDVe3cyodnuqhau/+V
 rYXoNRrhyKlyOIjyeRD+AH+zSLFcVg==
X-Proofpoint-GUID: 4icaws-NCJLL4-Ij5CZ1eycid5QY7dDF
X-Authority-Analysis: v=2.4 cv=K6kv3iWI c=1 sm=1 tr=0 ts=68e7be90 cx=c_pps
 a=c5q0Yg7rtICUX50m04GAGQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=cm27Pg_UAAAA:8 a=8b9GpE9nAAAA:8
 a=pGLkceISAAAA:8 a=KuuYGfQ-vP5hN8KP3NIA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 4icaws-NCJLL4-Ij5CZ1eycid5QY7dDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 01/11] board: st: Drop old LED code from
	stm32f429-discovery
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

From: Simon Glass <sjg@chromium.org>

This predates the LED framework, so drop it.

Signed-off-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32f429-discovery/Makefile |  1 -
 board/st/stm32f429-discovery/led.c    | 39 ---------------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 board/st/stm32f429-discovery/led.c

diff --git a/board/st/stm32f429-discovery/Makefile b/board/st/stm32f429-discovery/Makefile
index 6b02c0fddec..233eafdad3d 100644
--- a/board/st/stm32f429-discovery/Makefile
+++ b/board/st/stm32f429-discovery/Makefile
@@ -7,4 +7,3 @@
 # Kamil Lulko, <kamil.lulko@gmail.com>
 
 obj-y	:= stm32f429-discovery.o
-obj-y	+= led.o
diff --git a/board/st/stm32f429-discovery/led.c b/board/st/stm32f429-discovery/led.c
deleted file mode 100644
index 4b8038341b9..00000000000
--- a/board/st/stm32f429-discovery/led.c
+++ /dev/null
@@ -1,39 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * (C) Copyright 2015
- * Kamil Lulko, <kamil.lulko@gmail.com>
- */
-
-#include <status_led.h>
-#include <asm-generic/gpio.h>
-
-#define RED_LED			110
-#define GREEN_LED		109
-
-void coloured_LED_init(void)
-{
-	gpio_request(RED_LED, "red led");
-	gpio_direction_output(RED_LED, 0);
-	gpio_request(GREEN_LED, "green led");
-	gpio_direction_output(GREEN_LED, 0);
-}
-
-void red_led_off(void)
-{
-	gpio_set_value(RED_LED, 0);
-}
-
-void green_led_off(void)
-{
-	gpio_set_value(GREEN_LED, 0);
-}
-
-void red_led_on(void)
-{
-	gpio_set_value(RED_LED, 1);
-}
-
-void green_led_on(void)
-{
-	gpio_set_value(GREEN_LED, 1);
-}
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
