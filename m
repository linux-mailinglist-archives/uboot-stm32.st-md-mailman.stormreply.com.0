Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPeKJMYHi2kdPQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Feb 2026 11:26:14 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1A119A31
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Feb 2026 11:26:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7DAC87EC0;
	Tue, 10 Feb 2026 10:26:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013056.outbound.protection.outlook.com
 [52.101.83.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9BD7C1A97F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 10:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVJN4rpa6r9x2Jra7tpIyEhtlCzZ90vLCWaFZ6dgEtx8tu3sp0Gadn5anTIBBK0ipcgUhruRpJt9uABg6FOWl5lMRTZTXVwTOlSBH4JA1AUdgq+7gYRVjql5jIihd0Ju0G6Q8EjFmETzIFPn+I+mIT6+raI7d3Ys6MTZN8RKsfct26sK0HSz4w1VcokjZVygVMfPjCuLbLZjwEXcoWAqL1VSI9gefJGFr1NLon3uOVjOyLBdQ5y4JeQGNobSauQuEN7D63cdxMVME4JXjfX4JECSWAzK0C/yJn5DL13M0aKjacP9W7Y6/DdbzauK1ZxyxADnhv4eJGOLn3fGc7h96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzSed9FmwaPhN4EpasDye5cwD6A8uMYB5J9R8GpC6Eo=;
 b=HlvSIhw8InS3/3v0tihOpnRQNvse4D2t+n0RdcnZw+SRCL0N6LwZ/1gfcDk9XD47IOvNuqA0xI+OIOmTzER7GpAwb7KQHONz4RUEqOJk2osNlLqBLu45KMKtdZPwX178uI+Rs4PIOUULiUkWIi3lBdYv8bySFGBcQy9NvdX189fqaLN2tR5zKen/IomQ+Nseaxz99l+KNy8Vpm08mZu/EqnEvF9ttFg+wvzdbFifT1l097vvHYb/WNG9exmJJ4fEYwDwIsulHj5nYYYLsb6Nloi4yXmcw2gA0/F7bpw8ljzMzmOup8p9DQjE2zKf2a/4UV/gopwtOtFv1ENk+rr9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzSed9FmwaPhN4EpasDye5cwD6A8uMYB5J9R8GpC6Eo=;
 b=d4+Mlo57cooP4FKY85D5xmBG+2xkhyMZN00VNmvrlJ8Vf2SdlrHqJDwwtM1e6wJXXdNDCVKNmUox1eVaSdasXpJHm5b9pVAm4oOY1XMC9Jlt/AiQINfAeLSOzhjil5bPNAh/bfwQ3RHUKkVN35pRoycVfuhCNqbf9YMxD+AUK8IyhJ5omZPdPbHozUhpsecyU4valVYpZkkdzypKrIK/oMBrm1Drhj0aGhaBUe3xE2E4Fy2+RYqWUrhJcvYD9f7/LfjUrdtcul9YUIxUzc2DXwWw4tPoERCzVZGdegHyM5aXu3M4ZA1KantnZQsoajV2WZL1L6ulDzTJCDGsbgfeFw==
Received: from DB8PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:110::25)
 by AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Tue, 10 Feb
 2026 10:26:11 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::c1) by DB8PR04CA0015.outlook.office365.com
 (2603:10a6:10:110::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 10:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:26:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:27:52 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:26:10 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 10 Feb 2026 11:26:02 +0100
MIME-Version: 1.0
Message-ID: <20260210-upstream_rifsc_update-v1-1-74c813fa4862@foss.st.com>
References: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
In-Reply-To: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|AMBPR10MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 802a8c60-c442-4fad-f285-08de688ecfa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzdHT3crKy85OTVOM09CR0cvSjdpdHRxL21SeTErU1E0RmRkYUsvMmgyQmh6?=
 =?utf-8?B?TklEMFBjVEtkYmZsY3FPUUFvS0t5dmp0K1VLWHlNanU0OUhRWlVRaWNxVjUr?=
 =?utf-8?B?ZG1Xdk83YnRSWmZDRE5kQ0VacEFTNG9laStPZ1paTGtlNWE0c044TCtmYjJS?=
 =?utf-8?B?NytCazc5RXpIbHdGd0pENkk3SnFCUnBadXVQM09vNkE5dmNLRVEyS215WW82?=
 =?utf-8?B?dWppcFJObEd0bzZIUkJiV0JpRFR2RkJINXNwTVRLY3dVY0NkWER1clRCUElo?=
 =?utf-8?B?czgwQUpjcGE0N0t6bUtPdHQ1cklCRUVTWkJ6VHE3OEZXM21BUWk1K2V6djZu?=
 =?utf-8?B?cDJxWVpVcWhDYW9vZEo0R2pvb2d0VElpY1JSZWlyZjhaV0RkYnBUWS9Md01W?=
 =?utf-8?B?Q3NhQ05vMXNrdzVLYVVrYzhUdTVDd00rRDlKQXFSTjNCMWxnV3ltMk1uQlB1?=
 =?utf-8?B?alpqTVhsVGZzcjRFTWZxeTlOVmdWd1NpQ2pFUnpGOXJ4MUlsRnRXOWdsMGRJ?=
 =?utf-8?B?ajFIYzBIWEIrbzdwM0l5T0xoYXl3VEpZRnhnS0VvOXEvdmtjSTZRengxRUFx?=
 =?utf-8?B?WGR6VHVwV21JRnVZT3dHRzhqNnRjeWd0aExUL2FkUnZMN0plVXJ6U2Fta0I4?=
 =?utf-8?B?cVp5N254R2M2SFBEbGsxdHh2YWQxbEJZeEc1S1BLMkdZTUhPQUdXRGNZVS9t?=
 =?utf-8?B?MEluckNRM3FXbVNaTGhtcXpxUTk3VkZ4d0dVc3dVUCtJcTJaT0d2R2RXaXEv?=
 =?utf-8?B?em80NlltZVQ4emxIQ1lndlNGMm1FR2JxLys2WkEyV2JNU0FsRCsraFF3OXBp?=
 =?utf-8?B?eHpKdkd4OUdjUEI1RXV3WnFXZU12dURTMFphWEpUQXpkWE1rSTNBWEdzSG9W?=
 =?utf-8?B?ejBUWDcxbHppNmQ4bGZjcWRrenpDV2l3cFU1Wkw0Q0pEV2llNjRrd3gzcUhl?=
 =?utf-8?B?OWQ3cUFoVHc2eW91M2cvWU5BWWJOWXVycUQ5VllHMis2YnBlY2RWWjF2ejRO?=
 =?utf-8?B?WG4rYkRFN3JLY2Z0ZWkzTUtrK2Z5MDlvZzZtSGpvZmYya3JpNHZNKy9ManJL?=
 =?utf-8?B?QjlhU0NtWUR0dkYrdVBoOU1SckJySHZmTnpvQXJ5SnVxbWNNbVk1cExrSGtO?=
 =?utf-8?B?L1JqSVAwc1RRallORFpjYnpHWHNpMHc2M2crWWpEMmpKYnFwZElqcnJFRVlO?=
 =?utf-8?B?MjA4VnA4aDRFWWhiS1hMTzNGbTNUNTlmWXlXOGJlcTB2dkxnb2NBRWZWVUMy?=
 =?utf-8?B?dFdxMHpQVGVhblJkaFRQYjIxelliUm04WmdSWTBIaThVVGFDTU5UVnZkVng4?=
 =?utf-8?B?NS8raTNQNm00ak1qbDVNUjM3ZVBKazVnVlAwOHUzTEVzUjRnRFkzUTdjZ0Jr?=
 =?utf-8?B?cmNzOUhJZzBtbXFwWG5XZnNMSVlhYTA1a3BzMFZIYW05VEZDcHFxQlUrbXc0?=
 =?utf-8?B?c2V1Nkh6SnVDdDBuQ0dLTWY4bXczUWIzZHFsaXhEUUhiNkN6dkFGMzRsVGgx?=
 =?utf-8?B?a241WlpObG9NSUJqaVBjV0pvT3NzbnU0UUhFZzU1bkhzWDVtYzYvOVRwVlRB?=
 =?utf-8?B?V0lKdGF5M0NzekZuWWs0ZXl0MXJpdkxvMy9iK21FcEZad2JJV2pFcUkyK3RU?=
 =?utf-8?B?ZURRYWVzZmFjTmZzSkEwTXFsMmtDKzFWbU4zNW5VVkdmbitmdFRkNUJXNGNW?=
 =?utf-8?B?WUVqaFlQL3crMjJVVWN4U2dDdzZoc2hNVzFmVG1WaURXMDRsYXVnRTRpVmli?=
 =?utf-8?B?RFdHNmRKbk5ua3k0Wm1YTzk5eU04VXQ2cmVsazF2aVhmc2wzQVNaOEtDU3R2?=
 =?utf-8?B?SkdPeEh1N3B1dHJPd2Y1ajNDd25wejJYSGZwSDFjY0p0MTA2TWp5V2N3bnlL?=
 =?utf-8?B?QUhMK0JHYWt6ZlliWGMvZUM0UFpTYTRqejllUmhIZlZVb3AxWWxkdjRNbTNB?=
 =?utf-8?B?RXMrYlRINW15dnVqeE5HV21lVDlRc09SUTlhNnpwU1J4SHJDR3RreFJTenlz?=
 =?utf-8?B?VmhaQ2YxMW42LzdxWjlYMTh1SFZUMzNkMEl0bFBNRGVEWEpHWXoxbnNKTGJ2?=
 =?utf-8?B?RGFsUVJSQitSYTNDMDZpNU9veFFjNmFJS0RqUU9UM3g1UWlyMzVDOUw1bFFJ?=
 =?utf-8?B?R28wcWNXUFlrNXRQU2pTem5DK3l2YUYxcFdBN2dDOS9TMS9FUDlCTUxXdGhz?=
 =?utf-8?B?VHFybmxJNVZ4Q2FqSllLaTVwTFhIOHlCVzU1cENiV3pFaUlIemNaT012OEtD?=
 =?utf-8?B?b0kvVTdpWVBlTHBUZEtnem9Nc0FBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AFeiBp0tdA1DGgT3bqdOnkWIxFyCQTZh7CXVhrkFC0XU//Hj5cZvAPpqamJ4NH9aNrLvEoiUwUWFZ6IbO3WCWJSTJj57Z6WPCINDW5KHs32swSXKyC8kOVcvE3//JGVA6VgZWj/TJc7tjh7CXacyQzYAfahxsndrjGoGGwiCNAQqh1McUCpprGlQdKiDwuF4A/TMaNXVr4W3jiOkYR7uYj8NlTV+W7axPD0CJlpl09yM2AGyn/lQVIyUw0rMXs7iG8InPFfY3yoj5kw4els8aFET8vJqRDY+WgKoyFtwIX4p7NJTrAapfDHAWjGO1qIpmh+PFIkFsu+x5k+5bNPYDTBrGQYybhFS7vAOggKWy8IG11nXmbdEmszOsGLlDYj/NYnpIWR/WTT+VMoqahXJrRnUDLYlZWkTkpnmuSzJgpA5JgQfcbmMOoBSX1v66egO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:26:11.0617 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 802a8c60-c442-4fad-f285-08de688ecfa8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9376
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/4] ARM: stm32mp: Add STM32MP21 support for
 RIFSC bus driver
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BD1A119A31
X-Rspamd-Action: no action

Add "st,stm32mp21-rifsc" compatible for STM32MP21 support.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp2/rifsc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
index f8f67af4449..cf8026088f3 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
@@ -367,6 +367,7 @@ static int stm32_rifsc_remove(struct udevice *bus)
 }
 
 static const struct udevice_id stm32_rifsc_ids[] = {
+	{ .compatible = "st,stm32mp21-rifsc" },
 	{ .compatible = "st,stm32mp25-rifsc" },
 	{},
 };

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
