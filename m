Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD07C5E31C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05F7CC628DD;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4527AC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGLMl42642220; Fri, 14 Nov 2025 17:24:27 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k3vye-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:27 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHwjGK7dLeetuGPdEHk3q8s2WKat8ZLXEWImOMIVe6R6ELmbn5QXr81db+YNQzO1S8jc4W3k5RSUyE9xl1ZSmtJr7RZVU6Evk0MO55O6NCyR42clZIL7paEYlQ1cdXFVtn4ivkW2/wkyug0T8OWe74V6u5WL29r32CR/QWerm9endMdZ7YFlK5vqpKmU7Dl4IS17JI9yAyLK6Gm/mUN3cVr5FUv3JOpgDj6aXYcm01QEzNZV6NTjQPsJrAxmpaulk4G3z7OAyx+xpc6vu5hkaqACC64sL7QMEOe3A594o7Qn4oV5DDBhLQI4fdc1GXHcbmVNfSgGWOVIKQuA1FTyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcQIuDILXhi8vcyjU4H8hOoOu/0Go0EMQjkYuDJhJBU=;
 b=OMZccYeI1qPeajYjhhsf1vUSzQbCb10hdBVRq67WluAo/3J8miQg/uG5Gz1kVBzKSlN69uz2SRwJoECNYGIlxCcz7sJW9oXxqGi4s9RqjAYUZdB5fo5NiWYOHhLgu2FplFlv8ZPgrYdPC0/h2XaHsg9xmSBlgDS4A96YaGrIwbmuhx5gQvmzT6i5LW8+Pwo5rPLQK5dNrhX3xbG6Rqxzt++9q3q0dgLjtWwQjK1C2EYZyRiAsAYp5o3g6/CQpT8jeYD+f5WvYlJXhUbHzWUSxFN6lzlbxQjI1grKyhkkCFOC1/IPmwaQ93Hb9UOLx+28P6/PlfekyP2EO57cTJLfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcQIuDILXhi8vcyjU4H8hOoOu/0Go0EMQjkYuDJhJBU=;
 b=Ux4TX1s9JrHijWi/bDpLqjJkL7rYizZ5KLy/+DeMbM7oFLD4L/P99kZYz2jrW+xTvsgBx/DCf0EsQiE8sTDn/3H2pyiFN457EBe3KGs9r/TeX+q/Amdgyq6+oLcTiy5HgkjbKWyXomYEo2/HbVFaQdPu2IUifVmdFDbouqYm/DQ0BP3ZhuOsabaXwrIy+BRvehFT/xXaacHlAaGvGQE5KNl2MQaShfaAnzLHfxVJSTH0En9xg6xeuEFpMZ116/YyhFyVi/4ZfHCtu2jfhxNKmjf9TvOmdAqFxHX2JvLZp7WbDOjJbkgrXWHmnPU2YayaHOq0bFDH5gam5ebhZZId3g==
Received: from AM0PR02CA0159.eurprd02.prod.outlook.com (2603:10a6:20b:28d::26)
 by VI0PR10MB9389.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 14 Nov
 2025 16:24:23 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::2a) by AM0PR02CA0159.outlook.office365.com
 (2603:10a6:20b:28d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:22 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:34 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:21 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:36 +0100
Message-ID: <20251114162417.4054006-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000044:EE_|VI0PR10MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7b3199-85d3-44ef-4872-08de239a4540
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4nAfRhXVnfWu+kAahzPCnymgEpS85AmR27HMYCImUJt9HXSnJILrpfyVSMg8?=
 =?us-ascii?Q?p4/SPfxtvhXugIL3yF+Gs9Nh1QuQsj69kutj44iuEuUTmVQ0C+s2SN4eU15W?=
 =?us-ascii?Q?ePltXbVO46WFqmJBAM/tm6z8mf7LyXMj0z7qNZa4R0vGYzlmwOxXWE/wkDu5?=
 =?us-ascii?Q?vgXQ/E6dJFij57wEdCpJt8sW8nP2PNOXE4RyLz7QxIZM7p4RFmtOL5wYi+zn?=
 =?us-ascii?Q?/z6k3eWOtdZIRpm1Vb9FAyOtoUWNXYr6u/rippKy6F3I5jOETBJzDM549ONW?=
 =?us-ascii?Q?HOCs9LAfEoqIP02XSbEbjJXO8asxj5nl597aulQ8qS6IHPc4ihLj0tgeff7I?=
 =?us-ascii?Q?/9wAwnKcxlA49paB6qI1mpSTEm7M2jvVrPTST7t+UEQqcBnIDFGaZOs5Lao7?=
 =?us-ascii?Q?qprNDgw8CIYN4JzJDh5GbIhcozf8Y6hKUC4i+dTwlUe6+zVMHuTQNdNhXxjA?=
 =?us-ascii?Q?1d9CYgSD5yU1fQZR+WD1jGN67X6sHbFiwjl2EmRxxoUw9fp7RLQd5a/HS6Fq?=
 =?us-ascii?Q?czkvpO8dk5S1qWlNPFtuFiEdVAQxvt6JxizAUCK1h5rvUa3SLitcpq1w4J+Y?=
 =?us-ascii?Q?EJ8UUJt3m6Gfd7ngF3z4vmyIgxMiubpFSIX3o3VfpnPMhQD0NW46So/xOMEt?=
 =?us-ascii?Q?a1r6Wtfym7/jO1DB51K/hUk/2KpjyFEmg1YsK4GLzVi5KRcaQXzOdx7pKcXy?=
 =?us-ascii?Q?1vPB0BnNYyfH/qSfT3Y4meAHeMKdviEcMp8VR0D40x5UW4mZwM0I+rosLL1P?=
 =?us-ascii?Q?Izmta7X9lLfSxtAf2XCEV5EKluRArcnpwwnGOH528HuTxNEDlKuhRRvRsLoX?=
 =?us-ascii?Q?h8depEfs0B6sV2O+KsN3/H4EDGmMT3jvjhImt+QcrNidfhIHbEOUkZ8CZsKy?=
 =?us-ascii?Q?I0olecPZFXFjwtumqW8KDb/fs+KUhyVaHRywcAfaCw7MmrosxdDR0360/G82?=
 =?us-ascii?Q?qEFDZ6NyQmKNeskdYWrw0DENLRoySHbvJkA62mWfEvGQO/NYgeltBD60ligN?=
 =?us-ascii?Q?B9maVLjvS0XrtmzRBP17l8t6lwYyM6b3za+y5SjH4/VQQYRqpMgSt4Q96MKs?=
 =?us-ascii?Q?YYBgRnQ6AQSHRw5VJE66XzJGh/v83j/ODjxK/9NYE8Cwqdw9dvJByYR+Jmbv?=
 =?us-ascii?Q?gsYOUfRqALMZO6FcwHRycIyXcvmvdLBeEWxgWKqFOJvFxpIar5pytqHa0qu5?=
 =?us-ascii?Q?fXHqHgUoru0yyoMHZ6tIAvGonbmmKtsvDtlx41gmyVUM09eVzkSQ9iXw6pla?=
 =?us-ascii?Q?bM9wZML6LRRNCRqw83BuKM8sUQjQ31KujCC/aBz5cvD58FyXV8D7b7lTBE0z?=
 =?us-ascii?Q?2KCkKK9YriMfbMFak/+lBSfiBx3Zy7V0gDm941F8TKOTnj8Bl7v3qWX843PU?=
 =?us-ascii?Q?sjdBxFE7ESX9F57gT9GLipnPe2dMMDQIofsFlkMZ9/fcgEEXhztZi95YKT4K?=
 =?us-ascii?Q?ghAAvDiye+map0yjV/dQlA5wrM6spEgUI0L9mnyjmu8X0e6dp5eRYrQWa7zP?=
 =?us-ascii?Q?GGd9O4Yc5utOCjaIB1gGVh2mtVdl7SYPLuGVbWWhLvRiFd4Hko4LUbgCyGnb?=
 =?us-ascii?Q?hsacw4tbjDsm8wSnxL4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:22.6192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7b3199-85d3-44ef-4872-08de239a4540
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9389
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=691757bb cx=c_pps
 a=KcsGRJhTsSBytxN3sS+/eg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=Vvb6TTdoCAPBUSKityUA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXxQboHbdl0fS2
 ERwMidKRG+K+1DbRXwdLPM9hUIQvYAzNvMEZOh4zaSBSNZ0y1jwCZTeQr9vWYvOrznSAN06I8sQ
 5pcui3B8G4QokZc/vfFD7qHUj7DYBWYXyGo64cWd0gbtkRTFz+34OtvsQXIsoDkXdgENQDc/AYN
 7rakc8VAWfjDMQQgVJIHKVEk8teAlhsgOxZZuy/RtWXnFqwnO5nFhCpaR7hKRXO2QpXArWoIwlk
 JlZ/XNBRPJpy9pakr3qVwJi/yvCjSOns77gTEAWcMva6qJl52M+hQOy6Ap/QNy/M5BAvn5yn307
 032kORySF8McS48BHA4VXF4LB1kPUbiy/J1cE1p+8ugcxApa3hZlBp15NjDOAamSt73zhBMmAdr
 YiHbPA73rHLt4cFkBGKgiflyZgcOyA==
X-Proofpoint-ORIG-GUID: u2ERSSGeaKXWO6hjUFAaCV-OaQHLUn4m
X-Proofpoint-GUID: u2ERSSGeaKXWO6hjUFAaCV-OaQHLUn4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kory Maincent <kory.maincent@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 02/23] board: st: Update LED management for
	stm32mp1
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

Remove get_led() and setup_led() which became obsolete since
led_boot_on() introduction. led_boot_on() is automatically called
from board_r.c

Regarding "u-boot,error-led" property can't be used anymore since commit
Since commit 516a13e8db32 ("led: update LED boot/activity to new property implementation")

Instead get the LED labeled "red:status".
See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 45 ++++--------------------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index cb5cab9f36a..5f7c6822116 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -247,41 +247,6 @@ int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
 }
 #endif /* CONFIG_USB_GADGET_DOWNLOAD */
 
-static int get_led(struct udevice **dev, char *led_string)
-{
-	const char *led_name;
-	int ret;
-
-	led_name = ofnode_conf_read_str(led_string);
-	if (!led_name) {
-		log_debug("could not find %s config string\n", led_string);
-		return -ENOENT;
-	}
-	ret = led_get_by_label(led_name, dev);
-	if (ret) {
-		log_debug("get=%d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int setup_led(enum led_state_t cmd)
-{
-	struct udevice *dev;
-	int ret;
-
-	if (!CONFIG_IS_ENABLED(LED))
-		return 0;
-
-	ret = get_led(&dev, "u-boot,boot-led");
-	if (ret)
-		return ret;
-
-	ret = led_set_state(dev, cmd);
-	return ret;
-}
-
 static void __maybe_unused led_error_blink(u32 nb_blink)
 {
 	int ret;
@@ -292,9 +257,9 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
 		return;
 
 	if (CONFIG_IS_ENABLED(LED)) {
-		ret = get_led(&led, "u-boot,error-led");
+		ret = led_get_by_label("red:status", &led);
 		if (!ret) {
-			/* make u-boot,error-led blinking */
+			/* make led "red:status" blinking */
 			/* if U32_MAX and 125ms interval, for 17.02 years */
 			for (i = 0; i < 2 * nb_blink; i++) {
 				led_set_state(led, LEDST_TOGGLE);
@@ -418,7 +383,7 @@ static int board_check_usb_power(void)
 	 * If highest and lowest value are either both below
 	 * USB_LOW_THRESHOLD_UV or both above USB_LOW_THRESHOLD_UV, that
 	 * means USB TYPE-C is in unattached mode, this is an issue, make
-	 * u-boot,error-led blinking and stop boot process.
+	 * led "red:status" blinking and stop boot process.
 	 */
 	if ((max_uV > USB_LOW_THRESHOLD_UV &&
 	     min_uV > USB_LOW_THRESHOLD_UV) ||
@@ -672,8 +637,6 @@ int board_init(void)
 	if (IS_ENABLED(CONFIG_ARMV7_NONSEC))
 		sysconf_init();
 
-	setup_led(LEDST_ON);
-
 #if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 	efi_guid_t image_type_guid = STM32MP_FIP_IMAGE_GUID;
 
@@ -736,7 +699,7 @@ int board_late_init(void)
 
 void board_quiesce_devices(void)
 {
-	setup_led(LEDST_OFF);
+	led_boot_off();
 }
 
 enum env_location env_get_location(enum env_operation op, int prio)
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
