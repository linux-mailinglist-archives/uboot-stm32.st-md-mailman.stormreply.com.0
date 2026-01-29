Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK8eBXA5e2mNCgIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B0AEF60
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D24EC5A4DB;
	Thu, 29 Jan 2026 10:34:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FAE8C57A51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 10:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOA2MU7MyiAzvycn4txPbrovPKNcIvOMW0ToYSoUA34XDZvOK/6CX+YbZZPvNCAujFGVjFQD3rOzZikZrf2ryjsJEeqIXZHVJqKdPzGuRtGT4xjSiFxbjZZ+yJz6nEKQUAAejv6ENzyvLkphAlYAylucqaBGsbdtQd9qyEJjqXhaTobE5BAXJSAh6Xf4dBdB+k/T3z7EZ3lI08fb18jGAMg7shmKaKGYErqPRPc9OxAp6JshOppaqWZSc6/2dV25YXDL9nljER7FQh12TwXaxDk9yNqekvTc8TP0cGHJsLO0Z7q1vuQkFB1H/LZDY84gMzHS1AzSV0FqM9XW53ffeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEFsPir44vQpQI/wc4FbHfI2Y9mGPsofrTEAYbmKFtQ=;
 b=T5DAfvlVv+kkIXi4/4S4oGuDnWkoLw6/9CANUMRG+alEh2i6OgZVQumr3M4ywCEu7St9bm64Q8PkWR6awE1E1OsRpCdbWZTsiwVJ1CHTUCZteA0qJYCv8YLKenzTiOaJNIYViFzovPugjqwgv59PxnOTLaatWHAbQgKxzJQF3vojYv80TEVSBqvWcf5ZFjcdwQFBoumARGkDqf/rprq+AkhbDhRH31uKCIE81yOPICTN7u3/sjsRrxO/OVqHEccC8dy5yd+zgw7pMxoWCxobWpasw4bI68CIhawANMXW8TXliO0xLmT755tXXRqmqYIT4TC0ldKPbaGgDzWZq7dWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEFsPir44vQpQI/wc4FbHfI2Y9mGPsofrTEAYbmKFtQ=;
 b=OsODiWGO/m0znhRE4hbMjvH7iQMPLNT83joEye56z5keDcdM0tQ73ZqsMXvMEtf1X1QRXi7dYKQtmrgEnF9xfI9mSstFVK9Ag0dQzb1DWb/s2mxM4c6+BGODsbOUTWp5T1LQGv2BDCwY9yrLszumeGMJ5Xs5SrwGZMT7aLt6qWTsyDD/yGYEAEiEeY8Apza6+MFTXjI1oUlWEJ6vEkOEefbqxQ3CHzWh/JdvAoO3ndHh3nCwVH9Woe4rSarHdZ4cArRHnnw87RgUTBGT+aC3mGHNRdJDjqDNqp37juI5KoRO1Spg3oGqodmVfvnG8ffZjLAtgfjcrmlmfMTLBfVc+w==
Received: from DU7PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::25) by DB4PR10MB7496.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3cc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:34:09 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::55) by DU7PR01CA0020.outlook.office365.com
 (2603:10a6:10:50f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 10:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:34:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:35:51 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:34:08 +0100
Message-ID: <e46442e5-cd5f-447c-b58c-1a802b2003c0@foss.st.com>
Date: Thu, 29 Jan 2026 11:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20251216-next-v1-0-469e1d901920@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251216-next-v1-0-469e1d901920@foss.st.com>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DB4PR10MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db6fee6-11d2-4e4e-03c4-08de5f21efd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlVEV1FXUUhBQk1MWUxlZmF4Yy96cnZOdVFSM1JiVTRpMEFEc0gwUmJyeVNG?=
 =?utf-8?B?eWtUbFRtcG16MnpmTEMrVDZoT1E5Vi8yaEh5Vzd2TlhJWVQvM3ltSHdUSThJ?=
 =?utf-8?B?OEpTT2VXeWJwbFFiT3VOUzZKbjVOR3RvN3M1MHlaKzBVRXNMaHhTbndlR0lB?=
 =?utf-8?B?WW14NVdHOEdRR3QvWXQ4dVk5QUt1R2tYYkNXV2dqY1I0SDBGcS9vTFBBU3kr?=
 =?utf-8?B?MGhaOTN0T0c4T0UyYXpYdFpQLzFjaCt4Mms0R0kyNFJOR2thekVqU2xJMkFL?=
 =?utf-8?B?YW5zT1JzMDBWYkdLRVBaSFIzSG1nallFUk0rY2xmWThkWnhNcXBBS2g1VDEy?=
 =?utf-8?B?cHNSeThXaERIQ2c1RXJ5WEtzNVh4aXVQQ1ZFOFlGNGp6cnpXZERYN2hvRUJ4?=
 =?utf-8?B?SEQxVnZLUUhMV1ZTTmNPdkpFUGxkN3VsMW1iSGhtWHpROFZyMkIwZTBzUWlQ?=
 =?utf-8?B?NDJoTTZ2clpDeTQrQUhxZy9rc1lUdCt0Tk83L3IzK1hER1ZnMXhpcDllaEh0?=
 =?utf-8?B?NGl4aE96NDdINm9MY0xZZHk4VFo1NFlHY1Y0bzBpOUxiNzhTNjVKWVhDWHRH?=
 =?utf-8?B?WnJhTHBiL1VSS003bmxRamtYNkh5d2FscW1DUkcvcmdPUHIwWW1FNlAyV2lT?=
 =?utf-8?B?anNrOUxWL1JTQ0ZqU2RaanErelNZeDVka29GTERsWHFTakFDb1o4dEE2MERh?=
 =?utf-8?B?ZkRWN2lnUmtsN2NROU91bFpMazdRUFhlNGdOajFCdEdQL2RtQmE3L3VUWXI4?=
 =?utf-8?B?Vzk0UE0vTkpJVDdIWjNmV3hYblN0aG92dVdxb1gvbzF0RTNvUjYyVnAwdnZo?=
 =?utf-8?B?N1dLa3k4VnhnT1NRR1JmWHUzQXlGdkRCUHVWQUE2ZmRCQ3FObC8xVzFqUEpE?=
 =?utf-8?B?Mm43UllkUTZSVlRpVGNPUGJFdjU2VTczUGZJVitDWjA1dkpSS1h4bldWTjJE?=
 =?utf-8?B?UTN0ZHR2TzBOSGRqd3dvS1YwMUs2Y21SQ2hFSkIzNm43UG9VZ2NoanZFdDYz?=
 =?utf-8?B?bGpzbGN6NFUvT0RSMEZpY21Tcnh3a3krclhTMEt6bW1oelVhL2J3SmZPTkVE?=
 =?utf-8?B?a1h6Wm15R1FyS2FzcDllY3FBb2ZxdmRFelcrNFlmTGpIQm1DYWc5SHdINmZY?=
 =?utf-8?B?cmVSSmJHNzloRUpUaXpBTmFkenZrV3ZiUzF2OWdxditYMytMeUpYNC9SVjFq?=
 =?utf-8?B?dm9XMGtLU0t6QkE4Ylgxc004UDY4U3lkQUtYUUhnYnNEWFhnUWo1UmVubzlG?=
 =?utf-8?B?bXMrMTM0OE9va2t3UkU0SUJOeXJCSEU3R2xmYXRLR2RJTUNyS0tvN2JQbHMr?=
 =?utf-8?B?VENEL2c5ajh0Tlh4VXFONGU4ZWZBUDZDazFMTWwwbmd1Qm5SdmFXWUVNaWY0?=
 =?utf-8?B?SytpbkVQWmh5TjBuYUNra3Q1VW8rdEttdHFKNWJuQWFUdzZVSXZEZThGdUY0?=
 =?utf-8?B?SEY4bCtZN0JaUXlNSG9TVUpqajNtZE0yc2U4Yk9JU2VjQ3VFYXJVc3A0VTQw?=
 =?utf-8?B?UkMvQnNQL211bEpsTFpzSjJIZnFXcHlranpTNHNqL1ErdkhYd0VpYldnOXJU?=
 =?utf-8?B?R3g3YitpMWFSblVCbFFYdnpPVEQ0YVE0SW1iSGxmMFFoVGNoR29ISVlQa1hC?=
 =?utf-8?B?bHE3YUJNLy9jZjM0bUMzdThaNVl5dnJuQ3dlYk84ZmMvWEVPTWsrQlpsdm1o?=
 =?utf-8?B?UFJUY0l3ODR4dnVyYS9UUGhLL3lZNVpXSHFJQk5KVFprVFVSTjMrbkcxQjAx?=
 =?utf-8?B?c3RONW1ya1hCRTQwNm1XMytjZWJyM1FUTm0zUzlsdHB0WjBFTUg2MGZjc05X?=
 =?utf-8?B?eFlvME5KcXRMM2MzWjFHeHFCR2FXMjU1T3QrRGRnQnlFLzFmM0llSFRsdEFX?=
 =?utf-8?B?clg0WngxaFFicFB2TkRvWDhNWXdvVmJqMWNkajNscXhwc1JrWEZjQW1YbXh3?=
 =?utf-8?B?a1BTZmVhWXU4ZHhvRjM1RHdpN2ppczVjZnU5ZThvM0pyd2ZINTIyNEJtSk92?=
 =?utf-8?B?Y1dIWFhWWW1EQllmR29xdnFlTlZseGhoL2lmRGFHaHlHYU5QTjYxU2UwZUlm?=
 =?utf-8?B?Y2d5b0ZpOEZxVWRJaTU5WkZzZ1R2Rk9TNVAvNjZmUzh3My9RNkt1T1JrYkRl?=
 =?utf-8?B?bUJCTnU1ai9saU55WUpLL3hyS0RLRjlVZUU0eFJHZ2ZBUmg3TnZzTkRmRTVp?=
 =?utf-8?B?c0JBWnVVY3VFR0RwMG54Rjlsa3lFR25Fdy90bHJabmkvd25mTDJoeDI4UHI4?=
 =?utf-8?B?MlFYR0twZCtlT2JPRXllTzE0ZlR3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Gr6j8BxQpy+7rCut9Bx+FgqJeLT9B6lkQbwTcuqC1s27kdK0DdrQUKTQMqbcFQHi6o/cfu4q9IAk8Sn4UxAHI+087CHpgLl9UWREUREZA86Fj7xGcJknOPt6zgGwjLRNG80txwHLTjT44uk0L5vWAXbtHdbya+KzR9CdMvB2BixOmECjorYVOFR7zcUGSo/BD1pqRHZ3lv0PkNp0RTk7LrL0NONqo7mu5fDdfdxD2pT5wy0Wd9QywvHGAh9aNKgHVTjvZr4aTstMC4/ebJ6/qKmfBgUHju43Dy1cYEwEg/bIO75OPRC8LW5yBUUWDOqQzj90Th+GY39f6yI4avYDq7+BTmJ4A06Bt1qOTSDq4dfcEb7wldEvGw4pf8FK2hlOm8ELGokWV876yWiWacdt9YtMjkkBop+ugA6y250R/9SZNgZ0jbCUFxZLmHXE5SHAEua0rLe9R+42qpL+5KMNhWx3g2YPgf4tArwHy1H01Wk9UUUfxf6sQYtKIM1fxV64RGZ8xWMCTyyFXDjn404S6f/NRjSW99CSXJSBtM1VtC0uJQjHdijVj6odOFFWec31Peyl+vP308nFBkXkmMD/6FuV3wgxHdmltmGOMLPW/hkQwR0YyKkQRZ45RuYIEJt/dd2gLF09IS3UXq0WiX90eWfH6QEmvv06AGmgeSZ0gUqR077ZTWfb1wgXKv7PecYhIqvkyeepOBSPAexV4EMb5A==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:34:09.4554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db6fee6-11d2-4e4e-03c4-08de5f21efd8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7496
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 0/3] spi: stm32: OSPI and QSPI throughput
	optimization
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B67B0AEF60
X-Rspamd-Action: no action



On 12/16/25 16:31, Patrice Chotard wrote:
> Update OSPI and QSPI drivers to optimize indirect read/write
> accesses to increase throughput.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Patrice Chotard (3):
>       spi: stm32-ospi: Increase read throughput in indirect mode
>       spi: stm32-qspi: Increase read throughput in indirect mode
>       spi: stm32-qspi: Optimize FIFO accesses using u16 or u32
> 
>  drivers/spi/stm32_ospi.c |  4 ++-
>  drivers/spi/stm32_qspi.c | 63 ++++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 56 insertions(+), 11 deletions(-)
> ---
> base-commit: aff0f4d30ec6d7968578fc05fc6df6b5700d9913
> change-id: 20251215-next-e0b3ed280f98
> 
> Best regards,

For the whole series

Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
