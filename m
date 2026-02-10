Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLPVG8kHi2kdPQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Feb 2026 11:26:17 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C366119A47
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Feb 2026 11:26:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1808AC87EC4;
	Tue, 10 Feb 2026 10:26:17 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98040C1A97F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 10:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhkKCxvS0EMbSFxh2vkIfC+Pf31FRxtNulHXV0THWEWluAIC4FOcTuc+LU/nwbRCu7V+7+0u15+T/1gQ9i3yc0/ygXvi7hSMj14a0NGkoCPajmcuMbg2eQh8DUgwuYOHOaMu8t0gjHsrCMrx5U4+reA7I171erPTrsyB4LoP1PHRf/BxAz2mqs54efHppfZjJ+Gs54xeraKENeHGHt11te2IaYjmWh6A86mp4w47iuqxx36DPLoWZ5iJbL5m3Kj58kQ6wjVC4Rvl1Lv2QjJw4DRD7PQlV5KK6TWg8d1QVGOOAQB7thMYQNXqwP67gbm8VmdkJ3CPRWxoUq/jp9Bpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T7Oiv6JL5OBBOJBB31b7L+XM2KijMc1AVRz2CRFeyw=;
 b=N+d50/s+Oa0sVQEJnYkMBi5EvVQzWQmqFOfzlcATst56dE3ZiwMEeeNRDNiPCcXmU0sw+DSuqRVQwlS/jxbtJ+xIK2QgaF5c+RafjnBfhs3r9d3nsr1LIFpdyqQUnhaiuLs/NIaDBLgIdLsgpmBg2N2uFgRwfbZup05HV2Nn706Sz6QPEhXjYLffuDYBb1N5SHPc1dgcSE2zyrWrdjqdLHa2FVv6FmxJ+Tj2e2WToaSqYFltBX8egaL5iaTGcozkvSe/W7xP35V1RZunntDax5nwe/T6lJp2eI//IOWncD7xDMxFzs1+M/F/J5WIsFUb1+y/UTaRcyoVCFxqt3Qmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T7Oiv6JL5OBBOJBB31b7L+XM2KijMc1AVRz2CRFeyw=;
 b=oOl/EDyEbvY9FN+hnyKgmXtTnI/tQ/JtL/vGSpND+wF4YhCnqPh4ucizgXalHZUIKHxHQsfJ05lK08U3T6qJ7VTK/I3LzweO4MZOrisPLmNVEjObpUWXmt95nUTcSOMqMAC08WjOLRVaQHZnDU/zmvNvlukz2XVGYFWolxz99cEzX0mZ7AQXQX7BdaBlc464PMTg+h5oloisU9wtx5Uz2qelHzHqyc4j1qLwIGChdIrHDH9sII3FuZjziXbFYc30TfQUvnDbeaXAngWkmzukqxqNQ1PWmI41ySEvqDhLqiFhsKlJw9HAKgmooB/Q9ybAVNKjoIQYQL0ydoMcPeAS0Q==
Received: from DU7PR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::11) by VI1PR10MB7691.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:1c7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 10:26:12 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::88) by DU7PR01CA0033.outlook.office365.com
 (2603:10a6:10:50e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:26:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:26:12 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:27:53 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:26:11 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 10 Feb 2026 11:26:04 +0100
MIME-Version: 1.0
Message-ID: <20260210-upstream_rifsc_update-v1-3-74c813fa4862@foss.st.com>
References: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
In-Reply-To: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|VI1PR10MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f9aed9-c65d-460c-bca1-08de688ed05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTNRWTR5eXlvT0pSVXNjbkp1d0pJSlpaS1FkcXNValIraVpWc21BOHNTOUVD?=
 =?utf-8?B?VUpMTlBoZkdacEgzTFc4eFF1TjJDeDBEb1JIUldpM21qVjB4YThoYUZMSE5w?=
 =?utf-8?B?WVlvc0tiWXg2RmdpM1luZm5wK0dmNm5tazRDSW1URUJYdWpvT0dlSmViYWk5?=
 =?utf-8?B?QXlzaWl6eitpVmpFM2dXMmVHU2hRdWQ0dHRsM2ZxWEcvNmdOMExMZ254VHFK?=
 =?utf-8?B?NWhuUGRiMVZjaUIvS3ZYYUdUd0RlcmZPWHpHbUtWVy9INnRCY2NnL0Q4WFM2?=
 =?utf-8?B?NmRMcUphejB4UDFVcEtZenVaeDZYZGVzYjl0M0E4QnhhTDJ0WFNTdkg1UjdU?=
 =?utf-8?B?YjlyallyUGtCanZHZyt5NDRyOHhEVWlRMEFHZllSSkFSWkRKK3Vacmk2ZWh5?=
 =?utf-8?B?NFF0VzhhUHlIRjJMWnU3c0dnVmFLb1Z3VkJ2MW5lTmFuanlFZ1VXQnBYYzQ0?=
 =?utf-8?B?TVM3MXY4Mm1ibGZZZVA3a09YREtPYUlaMzRFSmJPL0dQUGdPdzBHVTBnT204?=
 =?utf-8?B?RXdmbVlDbzF5WDB3VHVWbXpLV1drNkdvc0RxT3hwNEl5NmppM0o4L3RGN05Z?=
 =?utf-8?B?UW13UmJWczFUdmpmaGlMUXZJSDVyQkhJQ1ZkVlQ1WkxlOGdxTXpGWWMrS003?=
 =?utf-8?B?cjZQR21kSmk5TWE0UHAwUTRrNWVLcXk5dEpKMWRTNkdKV3VZMHJ3bE0wQ2sr?=
 =?utf-8?B?ZHVYNjhTL3d4NjdrbTFpMnJ0UWdSZ0Nqa1k4OEpiTWtSSnJBR1IzcGVuSnp5?=
 =?utf-8?B?OTl6dmtSUlFBTlhSdyswTzVlaHRLQkgvMVFYSFVHYnBwaG82dHhJMUZWSURL?=
 =?utf-8?B?S1o0YmpYMXIzNjhmLzlUOHdINldUQ3hnWWZsQ2RDdGc2ME56YVNTUG14azZS?=
 =?utf-8?B?bGF5aXhZQVBWbiszZTJBYXlvNE5WMUFYamRYL21wNGEvNWtuNlUvSy81ckdW?=
 =?utf-8?B?cVpkNXVVMTBLRzdLQkFOOTNxQVFXbmlFMTJibmMrb3l3ZEQvd0Ixb0M1Mndo?=
 =?utf-8?B?MHJRaUVPQ0tEV1lzTjEzeWhjdEQvRlViUWJtc01sZlVyS1hCTWZUcmdyZlBs?=
 =?utf-8?B?NEJNeVdFbm0yTzNvdUZiTHVGaWFUMWpSbVc2TzNmQ1AzVEdNRkdhMXVMbzVZ?=
 =?utf-8?B?REZMd3A4dVgrWVZiZlllS3h2dWFJb1ljSVFNcVJBTXFLTzJqNWtWbC9jVlVP?=
 =?utf-8?B?WS9teHRlS0ZRQlAvSHFkNUM4eU1zZnMwSVBkN3dacW4vSkkybmdrTldnblYy?=
 =?utf-8?B?M1E3aHRza3E1eUdjT3ZPRWs2QUJjWmk4d3Y4MTJiMTFub2V6T0o5NDg5eUtp?=
 =?utf-8?B?SVZJcUp6QkxEa2NBMFhzZFlRV0dVODJOcUk5K2VxM1dNTGpnNVlZbmxibUg1?=
 =?utf-8?B?NG5jOThTN1BWLzZYbHY3OG1vbXdQMWg0cFpWVUNIcEgrczdrSVlrNkhTRGJu?=
 =?utf-8?B?TzBML09EdS8rd1E3NjJpOGJUVW1ZVVZXRHhpSHR6TUlrMzI5aTdxajRDK2xt?=
 =?utf-8?B?bnkxRGdPOFNrQ2ZrUHVleGV0M1hJSjFvWXFWM21CVDVIK0VwbnZKSzI1MUw1?=
 =?utf-8?B?YTVJZ1RmRE5oRWEvOW01US80emNOZFlSOUV2Y3p6bHdpTnN5S2Mzc3k5YnlH?=
 =?utf-8?B?TWhzSnBpMkdORWFVcUlPT2EyZXNiUFpaYklSU2lTVVpVWkgvcmsya0ZXOHVX?=
 =?utf-8?B?Y3ZjUHZMdFdlaWtvZFEvekE5Vkw4S01qZjFQWXM5eWVNQnBTNVZieEx1Umh2?=
 =?utf-8?B?RVFZejI4QUtkWkx0S3BySG56dVZkS0J0NnZhOGJoNWtiaTdZM0xkbVJuSkVL?=
 =?utf-8?B?NFNJYVo5bHZOY3U0RnVLNldUYWxDb0lEd3czWTNKd2svbUJzRFB1ZWJLVlFm?=
 =?utf-8?B?SnI1aGREVWNEOTBLN1BHWjR0Nno4MzQzZnlNMGg5ZnMzZERTc0lHTTMrOFh3?=
 =?utf-8?B?bmNnaEMzUDdINzNJQnpvRFlsRTU5ZmhDRHlxK25LZTI1QSthbXhkeW9COE1m?=
 =?utf-8?B?SlNwcjNpVWhHeGJYd1l3NXJ1WUpaeWJMYW1BNDdhcFZnRmZhQ0FJcjdnQjNJ?=
 =?utf-8?B?TklSeUlLdUM4aG5zTURWcEo2UjhuRWNuZkYxRkhWTGlmYTdEbWExa1R6emlq?=
 =?utf-8?B?Y2ZWdGRBWTVqRUJWWE8yY0dzK2FMcjlyUVZreWNDR0daenM2R0d0UW9SajYv?=
 =?utf-8?B?em9qeWluay9qdUt4YUVkR0xGVmVZVS9GV1BpUkMwMDBRUHFHWEdGWitQK0tq?=
 =?utf-8?B?bXlRMEZ4RkFqdGFLMXQ2a1JnSmdnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TvErTDEFsqe7w6EH3wHGmKxHq5sgdGxulFE/skEbQ2mcTV/Vqq/4rRwQ+P2vBxUYoYr19BiVfdoJ6I98svN8rU0BK5hpEw48M9Jru0/Q3ZD64jRtrYLXvn7lmmq2MmZGHtIFPt26j6DjHY21Td9IbHTFiOLdinrub8jwNTTZ8aDEp7j7QVeRWN6EH1HJPE44dRUDocSHPfh2q5FqbETknXCmQNKus2lHhMnyQvOOOBWTH/LMYqDH2UMxcFd/kGKMKbGe5VMkJJ4mbBkWZ4Bt4qnHXeCRP6yYsNEo1KeMtQFCfaZgs88bUyH2pJWKfBi+dUd/G7rcUzmugRf5//XQL8bfcVMpaeBWiNzoMQIF3gSd0rIlYEYMa/8cttsc3PtfMl41syteMu+BsMs1iEwP8drj9tjMWli/y4GdToCg96rj6Ax60cFoZvROWGwXR4NI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:26:12.2661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f9aed9-c65d-460c-bca1-08de688ed05f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7691
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 3/4] ARM: stm32mp: Fix CID and semaphore check
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
X-Rspamd-Queue-Id: 5C366119A47
X-Rspamd-Action: no action

From: Gatien Chevallier <gatien.chevallier@foss.st.com>

Peripheral holding CID0 cannot be accessed, remove this completely
incorrect check. While there, fix and simplify the semaphore checking
that should be performed when the CID filtering is enabled.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp2/rifsc.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
index 01ffc9f2798..0ef086bb956 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
@@ -141,27 +141,10 @@ static int rifsc_check_access(void *base, u32 id)
 	cid_reg_value = readl(base + RIFSC_RISC_PER0_CIDCFGR(id));
 	sem_reg_value = readl(base + RIFSC_RISC_PER0_SEMCR(id));
 
-	/*
-	 * First check conditions for semaphore mode, which doesn't take into
-	 * account static CID.
-	 */
-	if (cid_reg_value & CIDCFGR_SEMEN)
-		goto skip_cid_check;
-
-	/*
-	 * Skip cid check if CID filtering isn't enabled or filtering is enabled on CID0, which
-	 * corresponds to whatever CID.
-	 */
-	if (!(cid_reg_value & CIDCFGR_CFEN) ||
-	    FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) == RIF_CID0)
+	/* Skip cid check if CID filtering isn't enabled */
+	if (!(cid_reg_value & CIDCFGR_CFEN))
 		goto skip_cid_check;
 
-	/* Coherency check with the CID configuration */
-	if (FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) != RIF_CID1) {
-		log_debug("Invalid CID configuration for peripheral %d\n", id);
-		return -EACCES;
-	}
-
 	/* Check semaphore accesses */
 	if (cid_reg_value & CIDCFGR_SEMEN) {
 		if (!(FIELD_GET(RIFSC_RISC_SEMWL_MASK, cid_reg_value) & BIT(RIF_CID1))) {
@@ -173,6 +156,9 @@ static int rifsc_check_access(void *base, u32 id)
 			log_debug("Semaphore unavailable for peripheral %d\n", id);
 			return -EACCES;
 		}
+	} else if (FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) != RIF_CID1) {
+		log_debug("Invalid CID configuration for peripheral %d\n", id);
+		return -EACCES;
 	}
 
 skip_cid_check:

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
