Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE276D384FA
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jan 2026 19:57:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8781CC8F28E;
	Fri, 16 Jan 2026 18:57:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011038.outbound.protection.outlook.com
 [40.107.130.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B079C5A4C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 18:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3t7cXhKxkbm+9zeMKMJfjGN/yHmR2Pipbpa20XptBV7oAHKgoZHUhtMHVA/UP5nIOaJFVDOOf5Iy82LoGi9d8m+6zyNR7EFgdvx4+WbLw1sAbqeXmM9ALUd0sT8fhDNoRUvVoZgfwXfslOR2+JBvS0HNDx5OVx+co3INIupeU8CL4pDCRzvqf+UjrdVmLdi+lGlji9n5UwAeTJf6Wfdmu8KuB3xvI5HuTl9oUlixyqcoSKubUVXnvkY5NUt7a4OW3RnojrzWwcuoONlykrA6bwqkrQiJHKHPq1mTxJXG5gfqJ83psjC317teGuIumMdjUQ8LMhT3r3rQs5j9qiHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TKyR+1Kguu6Ap9Y3bAosHEayT8GAECR7zUT31Ibnh0=;
 b=c/o4lUf/24kbi5DBc1GN/pK/qCQ9ED0ic1ia+k6mpFRjGj7DpzBeskAgApaw7HgiTJkMJ6xt0nFEKhxs6JbQzmRSVb63l2xjSkRCTX0zUzQWe78kU7pKxAycN/A6WxFJFGvNAhy/VzXE6s/EsKTqjNpgN072lsTURp1e1LXALaAUSG8FkdvxcZy+B39Rdn1weKj7tKRm3dtPvSheR1pV/rsnuXbBNyS+eFnVYPCQ6iridih3323Z4nDh/yQOWRJrjShrSRUxu0WKp7mVVDWGhwAM0vq9d0Go2hrWy2d+nRWJlwEuupgBlXFR58pzMtDptu2JpIeR9221elvgAkiCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=denx.de smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TKyR+1Kguu6Ap9Y3bAosHEayT8GAECR7zUT31Ibnh0=;
 b=a3UwZeKuBpx1EXIwNtsJsk4ZVxy/kVqdmCplLFx17RM1XBwr5xv/3AxLtpu1WNPNDw4JL5808HKBVXGDnbW5wMKTOA/z1wMtmrVOPsXZJuTlj41kAiZPt5cwAHwwImktk+YYi1HjXvOIAve4vZCDa0Dq9SKp0k4p4hsNMIMnzLsy00/MZP3hqtT6/3+Yg8AD8pZwm5V+XrW3KLu0vFu46nx87/O+QdMPDBV++my65njC/P72kcw0s/Hv5qzk4MGHTJ1ygkdFSepzTmDerOQm85PwJuEXc7fO0oi2x7+Y71fBqgPDFQurlgYD1p5V9Qcj9NQtvktRGbIw2HWkghi4tQ==
Received: from DU2PR04CA0267.eurprd04.prod.outlook.com (2603:10a6:10:28e::32)
 by PR3PR10MB3997.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 18:57:49 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::ab) by DU2PR04CA0267.outlook.office365.com
 (2603:10a6:10:28e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 18:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:57:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 19:59:05 +0100
Received: from localhost (10.252.20.137) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 19:57:30 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Jan 2026 19:57:25 +0100
MIME-Version: 1.0
Message-ID: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-1-d7cf17cd678c@foss.st.com>
References: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
In-Reply-To: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.20.137]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|PR3PR10MB3997:EE_
X-MS-Office365-Filtering-Correlation-Id: f58d69e6-5d76-4302-ca92-08de553124e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmRnbTNmczY2MVk4dHJVRmZsaU1xbXN3S2RCamV6SWV4SnlZQVNFc3V0dXo4?=
 =?utf-8?B?WUFhTEVBT3d5eU0zZnFxcit6ek02K2xDaGlCQkxDM1RXTm4zWk9BOFpmSktL?=
 =?utf-8?B?ZVA1SExPQ01oS3pSVWh1TG5CNXRZU2ZyWS93YnJYbUNvUnlaVU9seWpHTFVo?=
 =?utf-8?B?bnpSUloybEZWNTZLNkpWTytuUEJobEN1QW1iaHpQYzQ2NW16YjNqaENnRkdE?=
 =?utf-8?B?MGd1cWZ2WkIzOE1iZDdkN202T05JaFphandCWTBFQWhIMml1Vm4vVVlTVnJ0?=
 =?utf-8?B?cUtpbzFzOFYvMk4wb1JQZ0ZEWEJaNFNMWWN5NUhMVjZxTUsrc2tkKzFURWxh?=
 =?utf-8?B?TDY2T2w2eTZmWmdzVnpqWHZ1amRLWUFKc1dvbngvZG12RiszMHFGNWFod1BW?=
 =?utf-8?B?M004bkhvV2hJQUh3clY1WGlhdkhoM1Q1STZYUXhtTnQxaEFGSU5oTzUyYmo0?=
 =?utf-8?B?cEJTTWVWd1p3WXQ5eUFxZWVLY3ZEa0F6VzhmSytORU40NHJBdTh2dnVXQVZm?=
 =?utf-8?B?S3dvRzl5djlJWlUzOERhazZwOWwzTW1FVXV5Z3l0NXNBU2Z2aDFmY1pubzFQ?=
 =?utf-8?B?UER2Uk1PT21UN3YvdElrVzFTQkdzVHduczVML2JiazhoMElIdHJrT1cwTzdx?=
 =?utf-8?B?TGdIcTBmbWlzaEdZVTFCUGhLY2xHa1JHb05FUElEcXNWeUtFMHhldTJCeU85?=
 =?utf-8?B?VndFODlQWEhIc1VCQlF5dzM2OTdLQlA2WGlvSko2RjdCZmx0SjVxbXhCQlhS?=
 =?utf-8?B?T25VUm8vbEh4S2hqT0N2Y2E5aFFZNmhzeGI3V0JKM0Y3U2xLdXhybS91Qk53?=
 =?utf-8?B?MStING85alcwZlB0WEwzcy8zTUp3d0cvM3VqS2kwV3BPdUJyOHdjWjkvT3p0?=
 =?utf-8?B?a0V4bDBLdEc1dnh0dzlyVUphWnl2RHpGblFadUJrR2pZbHpMK3BsdytxRkQr?=
 =?utf-8?B?a2F1WG5ZRGI2UldoS3NuOUVGdkxBRzdxVWVaRm1iQkg0aXNVY3o1Y25vZ2hH?=
 =?utf-8?B?ZjM5NjBadG8zN05nbzJzT0FUZGxpMFI5anpxMm1VaXJpMGNtUEptOFdyUVV2?=
 =?utf-8?B?Y3F2MzV0QisrL1BzLzQ2OFc3c1hLL2xqTm55SEJYYnhVMnZmSkk2NDdYZUh2?=
 =?utf-8?B?SncxZHhkWHVhWHBmTk8vWE1leXR4ZUxnK01CZTRkeGxGWkJMaFd6WkoyM1R4?=
 =?utf-8?B?MVhQNlZ5andvUzhEM3VoNUlRYW8wb3l2bFROK2draDR5UlE2MXNIWFY0L3B0?=
 =?utf-8?B?dDk4Qmg2WFg0NWxYRjhqVklYUExBYjNPRDRrNDRRaGl1dmFKOHhtUHdnNEVi?=
 =?utf-8?B?MnQwRVk0YzZiZThSQjFNT21Zc2dUeEVKblFQVVFOOWRpbHF5RGZXZVF3Vlg3?=
 =?utf-8?B?bGtCdU9MRU54a2RJT0xlUjMzTUNEaGR2dHVNZUxXV2EvcFc3RDY5WXZTR0Ns?=
 =?utf-8?B?VG1seUZ4NlNoamlQWXBrV3d2Tlovam1lRHFGREhFdHB1bXdzUzJkVkh5V3dH?=
 =?utf-8?B?Q2h6K09BcHlvT1FaYlVnWFpWZ0FyWnB2R09UMnBldWM2cytiMlhWTDZEU0dt?=
 =?utf-8?B?T3JsYlpZdmFNTktSNVRSL2lEYnVKejV3dHZZcUtLaHhFRGI5akpMd2FuSkx5?=
 =?utf-8?B?c2xrTlg0THl6cmhuUDRiSklHK0gvV09ud2tjVm9namNDWjNpcEM1Z21UVWdo?=
 =?utf-8?B?dllzSGE2eTdaTGFjTzg0S0JLQ3pmaE9DQ01JdGpMYnd6YUFsWFhqcVNYUVFR?=
 =?utf-8?B?dW5MQk1LSld4VXpjdjNERHJFVE5ia3FPcitwTVJ4eEt2L2NJUndpaUhrVnNQ?=
 =?utf-8?B?ZGNidnE5UGsxb3Q2ZzV1ZTlWQUdRd2dDZ3k2ZDBJaDZQQUlBY1BKOFJ2Yzhv?=
 =?utf-8?B?OGtHRXBENkFqSDZnMGR3Qnk0bHcvVnFlcXRxRFFpVGRnejVzbDV0RGZhTXAw?=
 =?utf-8?B?YWxtUDFOWXFzZ0FSTmxwWU81TTNVY1l1U0Y4d29EMURYVWNNMklZeVA4ZE9a?=
 =?utf-8?B?ZTd3MHVJcnh6ZFJIRi8zK1BSRzdsWWlmV1EvRGVzVnE2OWQvdGpVbVpJeHgr?=
 =?utf-8?B?UGhDMnordWsyY25kdmR2Q3B5Rmh1RXFYZGlHUENWOHlrZ2UyKzh2aUZMSWp2?=
 =?utf-8?B?L0duTjB1dmRiRDBkZnNoWXN1c0FGMUxRSDBLbXNRY1d3U1FQWEpMejJ4L1Uz?=
 =?utf-8?B?cFE9PQ==?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8UPvHtZTy6jk9Txm/xR+xuk8JwRAU0vFSbZeiXKjdpbPVnBQs41sQIcgbU9Dm1Y0MAROZ33Z4/rs56lW/rgMmTiH2EsRn1l2oCjMo0EHIh6ty2Dhk35+xOCDw8helsx9DxSrAS5SP++paE/3DxIuFiiFT3xX1TWfivEeJObmdbcO0jBeMFWOgCwDHlb8eYZ1c7b13mi3eyDBSa+Ykig5gPVEPkpWoXGfpaHuRw4W45w7ggIeUAX9fvPPdU9EES0DrgIW8kl6eIaKsv+F4XTDWYM4wUr+4DFKHNMMgj224UDpSyXmjZgMhNpgZOl8eUsQKVcNQD3oHUxvjs3dEKKXD5KjbQ9aBuf4rBL5WyI2BE7mx3iPWs9xZwMY7aToh25nVW3ntcCAkjZOH0tUw3+El52BWADb25egaEJDROxoiguqFtzJ6kTspKxINLn/VBoGX5IMV3eZ4WNHXGbODr/BSluhrceCjcWMrZ78ou8/dkllYk7nDd14drvvUGQzmQC/4O1omeSaLE1Gh46lVEpH6KnMw0/kNkAv36mkGNqI1StIrdZAqYcg7ekV6LLmEjw/r72oUZlaT79P3lptC6yMFluG78KENB9OjfBPwjpaNX8D2pXOXwV89Qkc03layscs1gJMU/nEhB78avwh1MRhGxHl0oPBHnSXlgBZ/HNd5yvzQM1GotdIZ+ZhxXFINo5V
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:57:49.2966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f58d69e6-5d76-4302-ca92-08de553124e6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3997
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v4 1/3] clk: stm32mp13: Reorder include files
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

Reorder include following rules available here :
https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp13.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
index b4d0890f902..18e9ab364b4 100644
--- a/drivers/clk/stm32/clk-stm32mp13.c
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -5,28 +5,26 @@
  */
 #define LOG_CATEGORY UCLASS_CLK
 
-#include <clk-uclass.h>
-#include <dm.h>
-#include <log.h>
-#include <asm/io.h>
-#include <dt-bindings/clock/stm32mp13-clks.h>
-#include <linux/clk-provider.h>
-#include <dt-bindings/clock/stm32mp13-clksrc.h>
-#include <asm/arch/sys_proto.h>
-#include <asm/global_data.h>
 #include <clk-uclass.h>
 #include <div64.h>
-#include <dm/device_compat.h>
+#include <dm.h>
 #include <init.h>
-#include <linux/bitops.h>
-#include <linux/io.h>
-#include <linux/iopoll.h>
+#include <log.h>
 #include <regmap.h>
 #include <spl.h>
 #include <syscon.h>
 #include <time.h>
 #include <vsprintf.h>
+#include <asm/io.h>
+#include <asm/global_data.h>
 #include <asm/arch/sys_proto.h>
+#include <dm/device_compat.h>
+#include <dt-bindings/clock/stm32mp13-clks.h>
+#include <dt-bindings/clock/stm32mp13-clksrc.h>
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include "clk-stm32-core.h"
 #include "stm32mp13_rcc.h"

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
