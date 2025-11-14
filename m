Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB97C5E2FA
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FCB1C628DA;
	Fri, 14 Nov 2025 16:24:28 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E5C5C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:27 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGLfQQ2700855; Fri, 14 Nov 2025 17:24:25 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3rnj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:25 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VszSngqD23FPM6JbHak/z707CFoM7idlT+FsEBMv+G6XH9S7EDbOBeEFMV40vi+TA1MD291ziwmGY7rTMoFDaHcbMmRPkVJ4nlss9pN9gWVqZDehrrguBatx4gbXg5KnS7jrpt3F9GdIj7BWhCHTko1X1VMMy1KdzZROj6qsfnf8l/wxU2pvoAYx/WGSeSPVS42wSNPuJ+dnU8zMOUw/lwIUxHRRaxv9ZFdOnNy0xlkIzRZ7NLPVjgiI0kX7o+LdS9o3Y9VTkI5rD4IleIICuUc7Su+LL+CoxmPYpDwXGb9SfeQUYZvlrANQRVK+YVmj8UytSE6Eolb5gsg2XejiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0yq+Y4fEGp0XscJTPjilm3o8LjveH2UT/RA5dOc7Es=;
 b=MO1sPJbbe1nN2v+VI059j/7In7O3Ym9Raz9frwhtFngwR2+hSSmfG+uj/pArBJjh5yrGDA+FSMy1mga2k0sdnlwoQ4HsItTn4AeNXO3gVeuyMNxIdXvgPItq2EFNls5tjTutI6pYaOsaR+Yas+4r1YFeiR1qkNECvKIT+7AYgL4ruWwOLpdogPwrY0jVfufkk3g4NxiUBPyQ5JH5rt2pn3jE+cWMAW+yIEVy8oqd1KAMUPtIcGH3BfwGvaUEaOd6Ddna36m1JFhZF1xoWH/jv0+GAFGzkKljyrXz+HN4djHykHiyiHDwv1gI26Ud6EUUnSd0F/nkUkL0DHXGoFjOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0yq+Y4fEGp0XscJTPjilm3o8LjveH2UT/RA5dOc7Es=;
 b=juXFs9XPuxbz0lWD0oLvAtbL3F+eOk1qRe0MeTPG6lFHEg6I2yit6WJoqnJ+CgeW/hAOkdg+TyNRJQV95293fuwKOi10GxCtvTfWAv6P97OripjJDiWvsXOe1dpfBn38uCd22/9TOOEB0PWdBF0biZUKrapi24ueS+9sdfHYkLU2PITN6JBT3zmyYAjm0dDf2bm1SapWqeGpFVTZSeTd7JrUgYZG8EU2LAaMjpHE36Py1YRLFq8EIRvkSwoaQWHXEZHCuAcpGfYTDOI2jAwyCjLiMJpleQn0N2SqYsyt01vqesTrfz98OZJ92dgz7AgWw1QTEvkjE4luB3OLNH+ltg==
Received: from DU7P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::34)
 by DU0PR10MB6607.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:404::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:22 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::74) by DU7P195CA0004.outlook.office365.com
 (2603:10a6:10:54d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:21 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:32 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:21 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:35 +0100
Message-ID: <20251114162417.4054006-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|DU0PR10MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 5382c75c-67a0-4037-94f8-08de239a44c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f4yEVp2BaIVJT0QeP76Npadd1o0/DsqPoiPaK6YZl6qPVx7OOKi+kzAERSbx?=
 =?us-ascii?Q?uDleUtnoAHXEziahec8wKQ1A3OP1egZLr2TQ4ioYEVGQSOu8tJ/bZ6nXaW6s?=
 =?us-ascii?Q?M7qM7AJCrxo8yOXZ4zuUynTDxf3h+p0z8nrSTRXXGptKGKywjGeSmsfBPxoI?=
 =?us-ascii?Q?bw1+85Zdunz2saYtXJc+18CeWwAZKKRbm6Z7O3QDxwXdpFPat0K1kjyzHjSH?=
 =?us-ascii?Q?YTAG9Jb3i3dOc3Oqtjvd3npanX5gWtEVb605UrLc+cESiIqR9wIAkL87/eoM?=
 =?us-ascii?Q?/RuuSYcRBtwhax7k97zpJmD/0vwIE1Zuv6xESeG4u8a3za55Km9u6ttiFn9T?=
 =?us-ascii?Q?DCGaL0eBQ6P1G4UY13TYG+wkuUSXvW9w5mHR7FwV2p+Y36rxr8UBmRV0OB7U?=
 =?us-ascii?Q?10KpGK2hJaE/sZwgHUv/MD1G790S/1Cf+SkfDIXApWQVnI+8ZOb2BQQiw3zP?=
 =?us-ascii?Q?4ceBNZJcWuNKsVpJ6DXo52yddqoa344k03/Dzg11RaSxU5FyThi2+eZl0xT5?=
 =?us-ascii?Q?qJWMY3MNmqbRPDmYKjz8UmcmvLLCHGNZsgVSUuk/qFvuum/W/DqzK9uATkHP?=
 =?us-ascii?Q?bkefsjSFmIcbilLo8xp67SET/Tk5GzwC+W7efC1YCBR5c3XvmeKVWidPGFBJ?=
 =?us-ascii?Q?8phOvoWssagCgYaD4DEJ1hpTfn+8mpttMYtmISulg4Xg22z1yA/tKj7Hv6M/?=
 =?us-ascii?Q?hsh4CougJNDnUYfAYebtR92YdKm56t4WIvmA9OlYlONunmk6ydxUixW8o0Sb?=
 =?us-ascii?Q?Hk9/ljNQ9RU9JdCDeBsoVT+sygiH4+J6qYRQKqfxW/pyJ0jHwcwcj58yOW+G?=
 =?us-ascii?Q?O8+NRJcxf6/wF2tLO4r/dhuFCzdoVQuerWavgk8QBB6iW3Z6jzGIY32wOysl?=
 =?us-ascii?Q?pQsjFhx1SvjjslBW9b/fRqqk2kmLINnYURdVdNfjOykICZZlyyRW3tK/c03p?=
 =?us-ascii?Q?kX5bb/EdxTzSkcXklGJqSYORUebqblrtGClM1ekGQCUEPHHaAx20HQl7JINg?=
 =?us-ascii?Q?Z+NLi4yjwzCfe65Aw30HKS1TwmBVt+AW0VHbuK9YL3G+DNtlFm9lns1RNhJe?=
 =?us-ascii?Q?EWFW+ewEHOvLkz0kV84lTtjaoXUD8bosKSPVFgDwsk5lRwCGaBsWCP7MYH+P?=
 =?us-ascii?Q?U7Ni9T984sRDKUuDi45xhIz/fo1m5nGJhrhRKXrXltf39NZhLcc4C4fYi8Wa?=
 =?us-ascii?Q?up44UnlF3QjHiikZJsj7LT+/onwj9IxlgkyBl9bqHqDk3xoacQB7df/eRApH?=
 =?us-ascii?Q?UWcQum6NUQyY/Ks4R16dsltgiJorfjlARywz3PmNfNu5JFVu3sI5XcrfIVqa?=
 =?us-ascii?Q?TzFrV5dBe0jcR6n0CZ1CW2d2ysnaz/QSOJvpUG2KXifCFr4Krl5oWVDCsqrO?=
 =?us-ascii?Q?eT3nWcmzK5pclxW/FZslJKe8+EEcMMl755Y7tQ5e+wIU6p704Qe84Rs+3hoS?=
 =?us-ascii?Q?NPChnFA2GCWz4dSRffebX5mRxKgI4Mclb0eiPbwWJlc/QqiJlcX8FS5xVkJb?=
 =?us-ascii?Q?NGY0dJhHDq9SFtS8eKnPshn+mFnBZOHx7LwAtmdcnHE0lX2Scy2LfPTMSG3Q?=
 =?us-ascii?Q?FZoCDsRJ0JWBSI4ASJI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:21.7889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5382c75c-67a0-4037-94f8-08de239a44c6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6607
X-Proofpoint-ORIG-GUID: U1rhvgrjOwUj2gzPe5LPOF6AlU84ERqZ
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=691757b9 cx=c_pps
 a=dbSG3FUprPSDrUkmEO8KqA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cm27Pg_UAAAA:8 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8 a=KuuYGfQ-vP5hN8KP3NIA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX6naVuUCEi9Au
 CCosjev3EwRiiA6TBMJNi8NP+WPUVyyilupEsbW16mNzKSiHtcXxZ+KYGv0OPPBst+3eOST7Vo8
 63d3V4jY++RQFxXjBALNhRa9P4IOUwVBAzXGuN4aa/vY+Ey9nU1bJWYoF7XqJvEczIGG35XPr+N
 PUjdSWfardWSPWTPRSfKYlz5MOeUctvMkP9lVybeGOadkltPnEH8Jjel8SNTwmRBN59h56aEi5i
 G8yyqdsLPN2iDoOLDslFh+9qEUyyGrAJKlvGiPhY9tgyXssfUrBYv+119SCUrwaP2TXvSWZ0uzM
 Z4ZdrhrT9V7Ef6jXechn3oP/Hx8mIEXYAUcF3dktZtrf3UAH4OgLM47wRWNtPkGj0g3LNYJ3id0
 UbW2e1BzmtB50De/EqgtAyVKhc6vIA==
X-Proofpoint-GUID: U1rhvgrjOwUj2gzPe5LPOF6AlU84ERqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 01/23] board: st: Drop old LED code from
	stm32f429-disco
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
