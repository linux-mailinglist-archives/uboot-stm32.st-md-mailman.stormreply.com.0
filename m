Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPebIxlki2nDUAAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Feb 2026 18:00:09 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4996311D7DD
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Feb 2026 18:00:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC8F4C87EC0;
	Tue, 10 Feb 2026 17:00:07 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B93CC1A97F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 17:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICwoEcR04YXEc+Ph8b2fEc6NVzJS0DSPmXMPcyUH1fBVOoS3Bi+ltcm/WNYaQ/30jmbuhmWXA/F8gmGQsxgCv4kVpHiRsXmvTm4zU0gBWBtJxo4bNe7xGcs6ncz5VNYutA5SSL5ReYmiy64aDDsLvXobOaEFqGjJp+FC8cRTL+Xp7i1yoX+8A1TE7uttv6GU1RnA7ll6CoLvGTVNdyINoxtXS65msCPZoduVqvCeIqerSVr5X9JClzXg+OtCQm4LZ5eLYl2152s8VhcB4qYinzJTZGFgTcrGz41lewoFGUOYkU+tpxcQ8qAV/r04pQISGFzSK5Q1WGtOnzG61ys8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=od6Q0yCV7Wnmyi0txEtoLOelFzHNtLNZdaSC9isIAJY=;
 b=h4Bk8gcg1GIq5/b6iqun0ukxYVWnr+2N/UZyCgzA1f76urs/WufFsOK/QOkYWnRWzCydQMN9j9tGv3hhFYp2evJaTM6fAw+phgR/R6n3GqAXy0MBQsVeqxWdTxmGPQvAH7A9tcOJKjt4IX3k0cXftP9SG0ai3qDP6dEmndF4ja68B8un2Er7Vv6G8SU0JQlmEsSTChPNkxUDzuxUNaa30+zC3qpzucINwDwpvhx5TeaCSwqLg1SYGnUvyN5SNwXImZ7XRPrq40HeL6ic93qeJwoemN/l4O4C+TDfab6QsuNs0jVID2Ey+nz+yNeWApgXgq9433SdpucdYeLP3FGJLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=od6Q0yCV7Wnmyi0txEtoLOelFzHNtLNZdaSC9isIAJY=;
 b=BmGmJp1azpuiiBMeoxvoiqKINU5RYzGe/GGYK974e/qdvTPaJ5yds5dh+mUlM8fbeGngV4su5rN6kcu+pZiJrM7yOSbgdJwv0SCReefEZiovUc9ojpPhsdxTjNxCXQotv96NRalZ1/MlQ9ldEZiMzT3ebHLn1ETsKWNMgcf+58UWwr7wFF+VuCrWD7M/wk+jr6aufFozviaSTVhPHvUuHOYBEYMN8ysO51cjZtZEibHUMpFqGsHqnKCLAwNTQzsZ/8q1h2D7nfbus0ZdqKT34lCKo9EmIXDoB4k8mXeAzNJcPSsc5ozYmyo/tNy3IU+LzKibh9bLOsKUN4cf3JBelQ==
Received: from AS8P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::6)
 by VI1PR10MB8255.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 17:00:03 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:31f:cafe::8c) by AS8P189CA0004.outlook.office365.com
 (2603:10a6:20b:31f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 17:00:02 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 18:01:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 18:00:02 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 10 Feb 2026 15:57:35 +0100
MIME-Version: 1.0
Message-ID: <20260210-upstream_stm32mp2_cpu_fix-v1-1-f37c509d79da@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAF5Hi2kC/x2MQQqAIBAAvxJ7TrAtgvpKhGhttQdL3Iwg+nvSc
 QZmHhCKTAJ98UCki4WPPUNVFjBtdl9J8ZwZUGOrsdIqBTkjWW/k9DX6gGYKySx8K+fcjI2zzdJ
 1kPsQKev/PYzv+wFHOeUIawAAAA==
X-Change-ID: 20260210-upstream_stm32mp2_cpu_fix-bbbd24ba4f99
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79C:EE_|VI1PR10MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e2b857-7c24-451f-0c22-08de68c5d544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1hWSmozQjUwNEs5MjdjWllEZ0lRUmRySUl2cFA4R0JVSzFlZm1PNjNNbUxY?=
 =?utf-8?B?TFIvMXJ3R21ieXlaUlNObkhSUE5PNy9XUUxjVTdIaG5HY3J6OHZ1S3ZXZ0pS?=
 =?utf-8?B?TUc2YjVGT04yWDNwbWl4TDBWVjlNR0g0REI0U2ZaNnNYc1cxSE5ySmxiRkZM?=
 =?utf-8?B?eWhkSXppUFgxVjVlRWtLM1c1U0hRR3g5UGp2ZGlWQVJkQ2I5Yjk4NzRFMm15?=
 =?utf-8?B?RS9wenZlQnVLUU82eTBlRUpXU1VvajUrSDFoWWEyNnRUYTduUUd0ckJXclB3?=
 =?utf-8?B?QTJ2ZlRJS2NhaUZ6UFI5WmQ0akZPMW9ZZzlTaExXLy9TVVRrbTFQVWozMFJv?=
 =?utf-8?B?YnhSMHJ4YmFvZkc4dUsyeFlXNWtQSTVJYlUrWWZSUkRjSGRpVU1INlRRL2VK?=
 =?utf-8?B?STMwUUNGWFhUV2c4NTJoME43RnNDU0dmeWNTTVh3aWwrcU1QWS95R0JtS3JW?=
 =?utf-8?B?akVGcENZakw3RnNxYnpMMFQ1aXNtOUpHYkU2KysvUU1OYzVMbUxXd1VhVEs0?=
 =?utf-8?B?NzJMNVI5NTJEbEFkM29SNG1wUVp0ZS9rUWVzRk1GVnF3NDBTbkxTTTEyRTRU?=
 =?utf-8?B?d2NFMVYrTkRBMURPVXlCSlFCSW9LQTBiZThvLzJVVHEwTy9WNjRHQzZVZzZI?=
 =?utf-8?B?UGdsVmRxcjJMME5qMlZYR0luaDZaa2lQM2JDUjNWZ2cxbXcvcWh0dndpbFN0?=
 =?utf-8?B?ekplZm5mODFxSHQ1SlR2TTJneGcvemlSRkVpbk0ycTJCVFVRbkZsMXpJcElo?=
 =?utf-8?B?RThwcnBwZ3NKYjVzKzJpSjliQklYL05xdzhhU0dwRzBaZnRDWlhpTUhwQlF4?=
 =?utf-8?B?dzBHQ2xLMTlqOXlIMUcwNFVjNjNBVXFpOEp1RHh3SldBMjR6a1V1emRUSjhm?=
 =?utf-8?B?c2JQT1Vsc3hkVWJZZmM4NWcva1RmQzVNaDlyMjQxNWtqNGs0NHQycUpCdkNV?=
 =?utf-8?B?dFJZWi9mcFB1cExxQWNCa2pjSk82UGtPRXAvZmhZdFlVNVBGcUFhSytURmlI?=
 =?utf-8?B?UWt5SWw5cHVuclh4L3RCRXJpeE1CMmhVTHNncUI1Q3lqaVlMZWU1azBZY2Ra?=
 =?utf-8?B?M09CeWNIcVZjVXpSNElWQlZ3R2VNKzBmcXRqY01jb252eGkxeWEvYTBHakpE?=
 =?utf-8?B?OTdseE50OCtVblNLMVRuWHFXNW1OKytLRytlNm9HWTFSOEJvdDdyMW5uMG9w?=
 =?utf-8?B?d1ppbWF6Uzl6dU5LSkRuNDBGSjlQcmVGVGk0ZHE1VVpMdy80UW8rZlZJY3Ir?=
 =?utf-8?B?TkIwblEwaTBPRy8zNlpBbisvWTA2akJXcGU2SjFOK0Q2TWJobWZLZVFGWTlh?=
 =?utf-8?B?TEtibjVzRy9tMFJYY3V4R0V4SnJKYzdvbW13MmRkbS9KNGt2NjUreXNwajhx?=
 =?utf-8?B?NlZQeFk5MStreVBqTVMvOE8zODFWNUNjdjhTSENFSDFwYlRVdmFyQkhObE04?=
 =?utf-8?B?T2Z1NnBEMDNON0ZIa1NublhMWDVoKy9JL3dCbU52TTFjQzR3ZzQxYkFwK00z?=
 =?utf-8?B?QmErdXZ1RWVqMkpHOWNjWCtOUTB5N2dOcXo0NFJiK2VrcCtsRkp3Z1AvTE9o?=
 =?utf-8?B?RFVzUWVjY3hnTnU3Nlo1Z2NrWlJMRVVQblc0L0xXU28vL1U1MFd2TmV4c3dW?=
 =?utf-8?B?S3JUVlVldDVwa2s2ZmFrQWRtSE42VUVpTzdCM0ZzWWhkeUN3SFpXT3pzZCtT?=
 =?utf-8?B?U09obVlRT2FISS9weWtsQkRkNWxOdVVCNWdNakFUYkRXY0RWQlB2VkNwbTlY?=
 =?utf-8?B?djhaQmQ1MVdHaVlkTHArN1NTYy9Nc0pscHdGc0xyUUFtMU5oUzh1OE1qOFFq?=
 =?utf-8?B?aG1ub0xKMlZUc3pYTDVvZ0RtU0ZEQmgxN1RDTys1OHNwbHVOOEN6ajVJYjZH?=
 =?utf-8?B?OUlXYWx3Zjk3NUZmNXJ3L2F5M1VYQi9OSlFIeUZLMDVLVkFoZmZsUWQvQjQv?=
 =?utf-8?B?aFdrdnl0cEFtY0JnUC82OU9QOCtGLzZjVkNpQ0I3ZmZlK2JTbk9oMTIrUnhJ?=
 =?utf-8?B?UEJtZ21GL1h1d0pZZnBodEFMM1lpVVc1dGY2MjNoU0YwQ0VEVUpOZEMwM3NC?=
 =?utf-8?B?UzlraVozQk9ScTdmM0M5L2I1SVpQTXBTSURyS0NVaXFlTlptcExSSXpQcFUv?=
 =?utf-8?B?OFBsdThENUlKcHRUaVAzQ25YMzhIbVVFTUU2MldxZFRmZTRjTmRVMHN4RG0r?=
 =?utf-8?B?UTBRSlF4eWl1NXNVdzN2bTZ2QzBiU3Z3c2cwT1NaRFdaaFZod25WZ3QvVFh0?=
 =?utf-8?B?Y2l1QzlHZGt2ZC9ZVGNwcjcvTS93PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4vsrxctuhZ8/YSNSMJfOKOatptvVyJtlYXE5jMJP1ufGCerJhsJfMMnjykak4DgWr9PeFKafJr9EtDfPOQNuqL6pdSu2oILVJAWnEiYB002+SyRE1UHeGPyQH3sj5KFqqhbejgSTJYuxa2C1dmTyxgSMZRo1D1S1/mMvNeNzT5Y/30RVIutbKJ1Zz8Ss2gvxYUyKbx7+yFV3ub0jhQdzRX2ICJdwHRyNk0LB4Pb5TXM3bVmrGAbBrN/WXPdEQiO/tH2hnySsLqiw44jVyVpOZ4r0BcZSyirQgJ26vZ+49UlElUtSx4J2g9xZOi6DME5kwCuz9dw8cCAoPyfGDRkZtMM/gorgp0RGNW5P5cp2lKCvBMryymxLLa7hdOC21iyDMJ0MeyWXa3YEP666/F5UN0vRVxN/YgRH/K41vIhy6nh0KcrGh7AsW+fTJA56zSTq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:00:02.8235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e2b857-7c24-451f-0c22-08de68c5d544
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8255
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: fix array bounds checks
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,foss.st.com:mid,st.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4996311D7DD
X-Rspamd-Action: no action

Fix index check against array size. If that index is equal
to the array size, we'll access one-past-the-end of the array.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp2/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
index e081dc605b8..a8a6bcf8ab4 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
@@ -148,7 +148,7 @@ static void setup_boot_mode(void)
 		  __func__, boot_ctx, boot_mode, instance, forced_mode);
 	switch (boot_mode & TAMP_BOOT_DEVICE_MASK) {
 	case BOOT_SERIAL_UART:
-		if (instance > ARRAY_SIZE(serial_addr))
+		if (instance >= ARRAY_SIZE(serial_addr))
 			break;
 		/* serial : search associated node in devicetree */
 		sprintf(cmd, "serial@%x", serial_addr[instance]);
@@ -178,7 +178,7 @@ static void setup_boot_mode(void)
 		break;
 	case BOOT_FLASH_SD:
 	case BOOT_FLASH_EMMC:
-		if (instance > ARRAY_SIZE(sdmmc_addr))
+		if (instance >= ARRAY_SIZE(sdmmc_addr))
 			break;
 		/* search associated sdmmc node in devicetree */
 		sprintf(cmd, "mmc@%x", sdmmc_addr[instance]);

---
base-commit: b99da05e1538b8fa153322da82917af2aa27e1d6
change-id: 20260210-upstream_stm32mp2_cpu_fix-bbbd24ba4f99

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
