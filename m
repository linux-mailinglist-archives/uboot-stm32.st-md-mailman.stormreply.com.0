Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAGABfehnWlrQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:04:55 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C91875E8
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:04:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B810C8F286;
	Tue, 24 Feb 2026 13:04:54 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92049C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:04:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8WerybqUA183p8t53ut19ZsPE3VX+IN6+hRvoyc5gQZqgK7P6ZJY0pGlBfMXemZqwfm9WczWojg75b7azTTpglHTX58Jv0MgRofgAkJmDT1J/ymBoPxK9PZ3aaH9UjFGCMJklEpJQ4n+hlcE/oW40t69WVqxu4h2iCZRHOQ9CPrdqLJ4SseOf8Xj4yEdXQXjS2QhPpOoQvEaDLdKAlUAQvKAYFN+AxXsYCwkun0/Jv6uzWTv7kxzu8SqoZCiJOTP67ih1lZe9YBrQFCnrZHT5w6xS2nS0GWhcw2S/tDGSr/zZXuSY7XQD0OfOUYo+/hrgXmcJP9IYA8AX/97KpTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZnZIQYz82ai5dVNQ2rHhMfNsZ6Unur3EB1lcq51sbs=;
 b=s4RAV2ggWcLxNXO/bheONtnXT1dx3EkN4F133MY4VyWv7yGF2W8Oi7m85qPWpD9x3sZZe1IYZwNugmQ0rSoIudoL/6QpE9ABkTDucbasC8n2Ioh3rTPADlkNPO0HTGbBKk31h8i+SbCpHw8fRNGPZ4EoVmVEkyQcehKXmibT9I8IrcJK9WW6o3Lu4Y91XdksfteXhO2vjHpJu7cjVNKq8Z0cSXIa9Twb/uJnaB8B2J8qtzJYyvPhUzuebf7y1QpKQB1GGLAiyId45tGZ4VnJV+QuEprXEdJj909cOJU1OJu7NWi9DQ+B1tNUP/Sxn2YGLcgv+ZlKPMsI1+fd+axHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZnZIQYz82ai5dVNQ2rHhMfNsZ6Unur3EB1lcq51sbs=;
 b=JNOf8xRy+q/cGX4zjmxG5qoajg2GtXri7bhmElnQa3hQspa4O1T0iFwaDWw7cMX6Zv2f+a2SP/UunOe4Ef7Vobhsz2VAjGV/VAEGTKp6AsV4lUtJpEJDvV1kgCACzVq6zPlwYNMmnnFx9QY4iEgvqEG0Rd6SIGvcHAOsZLL3vvbnzBkuDqwTaupJsAh/dDx4FbhhGUVLdIAok/yPVhdw4PlN6V6Pho1okFCljD7ufQThBTkorIfqnvSgEhdYjEPtJH9oVXcrovBQ6Qmu7tx2Lqsap4JL2+jJn/91h0x730nHxBHlWVXJePu6WWLwE3yNt/oLqVM/DG1h9Rabyh9fbA==
Received: from DUZPR01CA0343.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::23) by AS8PR10MB7277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:617::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:04:49 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::80) by DUZPR01CA0343.outlook.office365.com
 (2603:10a6:10:4b8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:04:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:07:04 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:04:47 +0100
Message-ID: <d96be1c1-fd54-4c70-898e-71c0cc911601@foss.st.com>
Date: Tue, 24 Feb 2026 14:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
 <20260203-upstream_add_stm32mp21_support-v1-1-48ca3409cce1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-1-48ca3409cce1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|AS8PR10MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff46fab-7068-410e-4913-08de73a54a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGN5SHM0a2JBUTIxM05NUmV4bzNaTmd3UGMzMUdWb3g4UXVPZFhlcEpYdGNQ?=
 =?utf-8?B?bURRY2JGUmNXT1J1a25NY011UStLK0NKYm9meTMwZXBSZ0hObEdpa29HdzNO?=
 =?utf-8?B?cFhDU3NtUGl2Q3RvRVowMXhjUllheEwvWkNvMDZHRVdyNkFpUnVkSjdzNEVZ?=
 =?utf-8?B?Zm92ZDVTWlh4NDcxbUZSMnFuNVdxOEcydUJ3dDFSY0tiUkxhZlFrWDB0ODVI?=
 =?utf-8?B?bGQwaWkxZWRvQlFSVWZ4SnZJSjFtZTVQWG5YTEUvTzJpMTFmelAwczh1bEcv?=
 =?utf-8?B?M1g1eVdwZjBwcWxsMktLeFhnYUpBcHlyaXJOempWdGdlRml5UHFteGhSajVI?=
 =?utf-8?B?TmRidVErN25qbVVYcm1JSS9pdm82bTg5SXRFUVpzSllxbnU2YjBhc2dBUzhi?=
 =?utf-8?B?aTEwVGpUNWpZUlZ3SVlSRk56blZ4NVJkWlNnYzZnWkl4emw4d0NXdHZhWlRY?=
 =?utf-8?B?YTVtYU5RVjZ2Sm1jTVpPbTNlTDJZZUR3WlhkZnlYcHR6cFpxbU4vd0l0RVZm?=
 =?utf-8?B?bEtPc3E0RDRTKzRnaHBHa3Jwcmh6bGFLREUwYzhUeTB0aEZ1aFZVYWdSemFU?=
 =?utf-8?B?UTZ5Yk9XTGZITk9IVlFSbExLMElIZHVkVmhIWGN4elc5SXVYVzI0MDlpb0F5?=
 =?utf-8?B?c2pFaHMyNWV2ZVZ2a1dTZ2NVVDR4TCtCamV4b1BGcWJsRWNIUDRvb1hPSHdU?=
 =?utf-8?B?OWtOK3hXb1JoTDVYSFlveUZXTzBvekhycXNNd2ZoT2dHOFM2ckxMUHdjTi9Q?=
 =?utf-8?B?ejlFQkk0MGhxOGtEbnBleFA2QURtYXIwb01Wbm0rZ0JFRzBGd1JkbHpjdy9C?=
 =?utf-8?B?WkdZRHpPR3dlbXQvR3dTNlREM3Y1Qk45RXRtZWEyd0VURElRVWpVYXR3M29T?=
 =?utf-8?B?TjI2M0hwNk1ZTUFoaTZJYTZYdHY2WmZYOXk2TTcxLzBqY3VKTWU3dnZOWmZo?=
 =?utf-8?B?UkFnTHhCdDQxNm0reG84OVlzY0VMRnQ0cktUMjFBYTZiaGhkU0hJM21HQU12?=
 =?utf-8?B?bmVZb0RSOWE2c3ZJNytnTzNHMHFKZlYzQ0pJNGlBeTJkcnFaMlhsWlQxTklX?=
 =?utf-8?B?ZzZ6cnpBZHlHejRVYkpoWXJHL1BBRFBCSGNua0RwRU0vcWhQRmZyL0ZkUzZu?=
 =?utf-8?B?WEs4eVk5TEVYOHpKd0ppeUM2VTdVTCtZdjFBejM0WGh4aEQ3Zk5ZY28vRXR6?=
 =?utf-8?B?a2svUjM0dXVjb1J0NStiS0dCR3NMZUhaWElSY0l1NmlCUVlJOW9OUDZ2eS9Y?=
 =?utf-8?B?dGxjOVZ3OEVLREZqTUtZWWo2QVVVTlROYzJSM2dWR1d2QzFodmRqNDc5ZzAr?=
 =?utf-8?B?cGNvNy9zeUF5VnFyS3FmQTRFNEJaQ09DR2w5dC9xc004NTRCelh0T3NvUnFW?=
 =?utf-8?B?ZFQ1VHBIekFOc3prWENDY0k4cUhSZFRDL2tJbVFPT3VJT01nME8zZ241Y1dZ?=
 =?utf-8?B?djFSVTkwZTRrWjVuNzFRU1VXQTR5R3lyYUd2SEN0NTJKQWZaSHpPTFRIdnBY?=
 =?utf-8?B?M2RuQlNVWDlWSFhiL0FGcDlOSzdIMVBNcDA5Qk56SmRRZlQ2eldFSEMweXFS?=
 =?utf-8?B?L201Y09LVjRKcTlrcnJKUzN3Z0QyTjMxYno5c0tlNVJzVHg4ckJZM2QzYWdi?=
 =?utf-8?B?VVBZSmxUV3NTcnYwV0N1VG5iOHpaV3BmZG43RHdFd2F1NVViY05VOWlJeTFy?=
 =?utf-8?B?QVZmNmpVY21DS2poTEJRbm1kWDFzdnNLc3dBSzNGR0ZVQlVpM2NXWnBJVHE4?=
 =?utf-8?B?bXk2RlN1ZFRuTlR2VGhoMjB6QksvalNHV09pdktmUGdYY0Z4SDU4WEpQOFJ2?=
 =?utf-8?B?SGtScE1vUjBxTGtPUkZDNDNoSEZzYytLZHNaVTJBd2NRZllnWExUWWdnMStN?=
 =?utf-8?B?RkhpZ0E5cGhQRFphWkE0L1dkUE9rSGgvNEh4dkhmRkVlWm03dHRPUVFoNEt3?=
 =?utf-8?B?VkVwclVFd053V0xxNXNkaDMwdXA5MDkrbnJsdnUwKzRCR2dQc2t3QXl3bWky?=
 =?utf-8?B?UlFaL0RVZTk3VXJkb1grcVliZlE0WmE4SmZFZHd5cEp3UTc0TkJkSDMrMndZ?=
 =?utf-8?B?N0NNRHA5MzVGUDZnSG1iQ2xqaWNjN1VnL3M1MjBSbVVpZm1EZDBwTDgwRXZO?=
 =?utf-8?B?NVFJKytIZXViR1U5OFZqRUo0dklTVzZscEJrYm9FRWxESUFUVU0vYmtMeFBT?=
 =?utf-8?B?UmJCc05BQVMyQUtGYkhneVJTRmt0SDJBQ3pCNUEyNjhIUHVUdVVQaGtuSlR0?=
 =?utf-8?B?d2JsN0xIZkFZVGdLcUxCYUdnSFZRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: y6VcJGCrmvR+6NQ47ciEyvqSMDE15TY2I7qE99LV2hHNXisx+KVCqCI+8F674/hueKB55iH68+Wtm+UYpCeCuak2lfSLI66+mDv4IS8bAeDoz4dHnwdcj43fIAkGUxFLLAjRBYTUqn3mG0bBMzflg29KCE9+/UVG4ZuR1jYu91UIzmzAdtXSjnsldWjCcysYLgNcGjSRFgEQbMmJIzBWzMM248G27yNwY0ddWgTxsBMAzeGlwB8p1hzf9yT9fUbRn2xqodU6hpuihhecobRk+lq6OlrecmIYjO5wjBXrljWjJcBpSy1jcVydHeRv32jom27cPHfIZQiOc7YVX/4xwIXcJc/mkah7ioj68/M04XunMOtS/HRGBFMRqVrEgVJZjcbKu7x4IgsZOFAMKtEWe+Z4MzrQbFg9eVqgYlBDJyH5tQWLAYBUSFT/6g/ud0Cq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:04:48.5318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff46fab-7068-410e-4913-08de73a54a4b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7277
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/7] clk: stm32mp21: Add clock driver
	support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.836];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F0C91875E8
X-Rspamd-Action: no action

Hi,

On 2/3/26 17:49, Patrice Chotard wrote:
> Add clock driver support for STM32MP21 SoCs.
>
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/clk/stm32/Kconfig         |   9 +
>   drivers/clk/stm32/Makefile        |   1 +
>   drivers/clk/stm32/clk-stm32mp21.c | 709 ++++++++++++++++++++++++++++++++++++++
>   include/stm32mp21_rcc.h           | 651 ++++++++++++++++++++++++++++++++++
>   4 files changed, 1370 insertions(+)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
