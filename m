Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOxmIDX3gmlVfwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:25 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F09CE2BC6
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25E19C87ECE;
	Wed,  4 Feb 2026 07:37:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D216BC87EC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 07:37:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiTGettTIdQe0iI26sl+Og4VZpnWMh/MD2jj2vv8U01XB/aIqpclNyULPuL1YmI5RIXNG9z596LOQubQt/25UAyCRJ2+jMqr1iZURoj+mwLD2V4jxCc1rW0uzPcb54tHLDDlz1goc7o3kAnrfB2+dMmSfS2VN1vVF/gr4WaFuaFf+SYY6joTlL2VtEpiIcx7drSSMaQ2iVMMElTwINH3NJYQ/Sa43r2c2ybrilNCAJ0t+srRn7rXVnNBPG9+CTKgqMIETLc1oQUZ8AE/kEJjgvP63upIWecdBdFjFL+1qRJEpSkgUdKApYFzwhO88Jh5NBBOKxdQTOJ/HcMfjrjGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Oz96AZaoUaHNBnOezgeIAW8MOvzOiEqM/HSZ7SQKKE=;
 b=W47UfBo88ZowfKIddFZ3DMNYfFUT6sdcKg/B4D7F29FYSpu9BR5ISkw7iZmxQmV//fOe09lIWiEIK60K8ml0ZRKI4t7n1ZX1ZztyBFy0K8DASFPjgVeEHnzb/Y7mdLxOiDAnTBBD+meX8uVV0DoOGMb0oAB+xL+NDm/vGYzZexjJFJpc1ove/I0iqJyr7ZZYWAQx0M1pSYAkQwj8PxFgaRtyEIqrCw+M/R4GpzB1Ov6rF3fxjXpNm82SCyt6pcLeFv1uI88Kqh+7E4Gk53qc8yeuNvq3KlQKe3/omsKbDgNqvLrSk0YjOFps6IiPepLau8SlSb4XG6jLT/hq4aEguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=eds-india.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Oz96AZaoUaHNBnOezgeIAW8MOvzOiEqM/HSZ7SQKKE=;
 b=PBEupMewlp/cRndtaysQ7PoVka/k6GywkjvH10WbYmjmd7/fbWPY/KKeE1oRXrKBH4+/Tb/3HCHxqnzhGkJ1rRO4IHnPKWg52jdMXF6XKT0vhJc5U73bYe5JzuWNufB62OVkW3Cspyx1Q/H0XmKzp1uzCmNAjSFb3XKfr89/c+KRoAilRxHWfiu4cyc/0vVEi13f+YGgSVjydLKLuqL8gf/txlSQmP+11xsTF4nuKDzjBhbT2HhQpRfhOFIfCZW4Dznbov3O4UM7GWIBPQSPAIVwsWZbhbGkX4A2vLeL3YqpmyqwCLr2l/Cu9hp4yeoUFrJauI9SHUSgfTqZdExBPg==
Received: from AM6PR10CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::21)
 by PAXPR10MB7632.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:37:19 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com (2603:10a6:209:80::4)
 by AM6PR10CA0044.outlook.office365.com (2603:10a6:209:80::21) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12
 via Frontend Transport; Wed, 4 Feb 2026 07:37:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 07:37:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:39:05 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:37:18 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 08:37:07 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_factorize_and_update_read_idc-v1-1-f41a063c28b9@foss.st.com>
References: <20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9F:EE_|PAXPR10MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 117aae1a-91bf-4642-a8c3-08de63c039ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXRwR1JwZ2NjK29lbnVLZnJXT2ErMmE4WFNqWkVpWDRieE45RTBMczEzTEht?=
 =?utf-8?B?b0hwbEJoN0t1Wlc0N3VIYTlUem1VV2prL0Q1NWtGWUE1NzNqSjFRWlhCRE1W?=
 =?utf-8?B?blJzdElBMzZsZ2VnaU9KWmVqSTBzMmthbDFWTkhPMkphTXdvOVZFelp1bU5W?=
 =?utf-8?B?L1BnLzU2QUoxRG4rRTBtV3N6MWcxWWc1Z0NTRjdCWHFFb1o0MFpjb0VsaDd6?=
 =?utf-8?B?SHlleUlDcG1kNjIwdVJHNncxWnRDREFMZWttZHF5WUFSMFBBQ3RKbVhVczBt?=
 =?utf-8?B?TjBQZ1VHYTg3TGp2aE9HdDdJNW5VS3NUampmbFdrdGpTRERLa3RGUytOUU1s?=
 =?utf-8?B?N1RXb0kxdDVJenBLejQzOVVzYzdvUXM2bUNFaHhPcEhrNldRNGpQcWk3LzMw?=
 =?utf-8?B?RGVCdUF6cVVIdGZ3ZW5GSExVQ0xTWDdiWVUxeGJWVlp3d2pEVGhjb0FCdjFM?=
 =?utf-8?B?cHpxcVlDSGNWSUpqa1NwQnZ4QXZBUjAwNk0wUnVjTnVoalUrVnNWSFVUME5Z?=
 =?utf-8?B?dDZkelVWaC9WbFZwZ1FJSHZLMTIxY0srMUIzdVY4eEF6a3ZDZi9QeXl4QkI2?=
 =?utf-8?B?eEpCWU5ISUJsdkd4LzFxT1ZFSlNNd2I0cFdxMHYvL1pzY0Uvc2huMU14Nmt5?=
 =?utf-8?B?c2xVU3p2N2R3NFd2RlBxY2l1YkdDaDF0eExoNUV4VEZZMVozME9QM05Tb2di?=
 =?utf-8?B?VExlWVVaaTJ3NGUwVWZzMGx2Mm41c3NMa0xUL3JVWUdyTTZNYlRJaUpVRVE2?=
 =?utf-8?B?NFVHYnA4TFo0bVNGeS9PalFvYkkrOFo2ZlNrdE9ncDJ5bm1MSzY3bUNzUERP?=
 =?utf-8?B?SjNvRXFuT0FSNXJzMGVzYUZ2TlEwY0NnQmtRK2hVM1N1OTNDejV6MXFVZlJs?=
 =?utf-8?B?TDJiZG9wZ0QwUm1lMGtXYlprKzZuRzJNMHNjQjJWTEFJYUV4YTk5cW5nTFVN?=
 =?utf-8?B?RDdwR0JaeDlxb0NCK3RVL0IxcG85c3EyNmR5eW1xZUlWLzVnMDMxbWJyZGxw?=
 =?utf-8?B?OFBmK2VWYnNhMk1aYzYvaHJTVUx4Qm1BYlFkaVBZUkQ0Zmhkb3ZNY1Z3N3lH?=
 =?utf-8?B?K2djaGRHZTREVFMzRHB0b2I5dEdCa0RPRjRmR0xOTnRZOURzc0pvN2E5eFVX?=
 =?utf-8?B?YVhLd2J1dHlYajhNUzdZRmhXK0RrbEVnNzhSQWVTc24xVE81bSsvbCtsdEJX?=
 =?utf-8?B?VHdmOFhETmxvaXMrVGtjUUxOS1k3UXlWZ3JiaTNBcEZCd1EwbDNmWHpTQzJn?=
 =?utf-8?B?Mk4wd2ZkUG1KY1poa2RqQ0crZHR5ZjdxdUdUQnVQejJjbElsWXp2dVI3OXpa?=
 =?utf-8?B?MlBWOHdwUE05YmIwKzI0RERZdmhtVFJmemczcCtmN0VidG9tcWVWUENKZjFw?=
 =?utf-8?B?R1dRMzRwc2JCZEdibGVIaUJZRmpFVnFEK2xMbzBLaS9nT1BzZkNhZzl6cHoy?=
 =?utf-8?B?ZElsUUcxWHdHTjFEN09jcmRwd25jNGF6VkZkYURJNG1YZkZ4WWRHK1pEemVw?=
 =?utf-8?B?eStuQjhhV2t5aXdPT0N3YnRmbU84VXRuWVU2RkpRVUpCaEwyMndnZSs2cEIv?=
 =?utf-8?B?amYvSU1wOFBQa3NSOXBhUUVXbVJoMmpDK1VBcDZIelFRTG80V3ZDdUUyL1Nk?=
 =?utf-8?B?UmREVEpERGkvakpRa08wQWZKWjF6aFVnaHV6VVk3Yk9maFBicWw2OU1RQ1ZX?=
 =?utf-8?B?Wll2Wk1hdFdIOUxlRDlEeDFTRktDRGpncEZMUDBKUUxtOG93L0hrT0lDTUk3?=
 =?utf-8?B?OEMxZytOWWliMWpPVXFqOVJjTWNiR2RKSEUvTnVWc2xQTDJwYWxFQ1RmZzMx?=
 =?utf-8?B?S0lxcS8zdHAzZlpMVXhCV1FmNkVoMXd2NGJTWWVPNUFwbnhmTVUyeEV0US8z?=
 =?utf-8?B?THdZZWVvWTQ0cmdyc3J0Y1VwR1hrNmN3aUtNeW45eGdBSk9zVDFsUUZxZWI5?=
 =?utf-8?B?dUhUbWFEUHZCaWhjZ0lEZ3o4MVhXWVgrdkVFaEpHQ3F6ellOd3BoSGJNMkRu?=
 =?utf-8?B?aXFVYndOSGlOejUwdGVnU24reFE0MG52dVJwa0xpRmE4SE5iOW0rS1RsMkZW?=
 =?utf-8?B?aGRCZTlkWTIyWEZ0L2QwYVUwVkpZdFQ2czhDSFhSYW5TbzF4NlF6VVVtazlZ?=
 =?utf-8?B?bmFsUkFzUlA0UGUzL0VkR0U0NEVKU2ZLUS9CeEdFUjJ4QnRDZzNlZGRVQlIv?=
 =?utf-8?B?V2lVcnZtWHFFbCsrS2xrcFRGb09wUXVxWDNOYnVkd2FPdmNFUXpVSDhJTE4x?=
 =?utf-8?B?c2p6a3QreGJvM2lOdTFlWmZJdUNBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wvu65JQnWC36NiIanPhu7Ms9gOUhJh5IZrC3QeSapVjO1S9ZYZJPccSlhQN00eNFeJUfdzSJfCHCYfYZvK90mt70jIp/A5869UAjyC8NWcEcjKzfmRZVKW1aBGBkOKPZKHnjgXJGJN1z0x/iYIZTEAIyRpUVvGQtcfLfozEsOuiU14WXGYmtpAippkmmuBNn3o9zSc41UG4S1FnqYlcU1ytvoBA+ClsaVr/j8OBuj8DRUzQLmhGRKASuhQrJDEC3+VCF7jE6OV66JL0QLBGxQKUVfuJpWlW1NMlm0uCJ4+X9WcUCh7eKu+3BrPYEX6BTpiKe1cIIECLqWjFjQdIs1wLhT/TZARf4ROCNvbuBKnnGJZ4o2cGJdgxcDMH3p4TBQynXGy0IUi1qIH4ZW+U44su1N/cqJ9pmlu6zFK0pQjSM/qJIFwlIzpKCYkcAbPR6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:37:18.8951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117aae1a-91bf-4642-a8c3-08de63c039ea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7632
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Uboot-stm32] [PATCH 1/3] stm322mp2: Migrate duplicated code into
	stm32mp2x.c
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F09CE2BC6
X-Rspamd-Action: no action

Same code is duplicated into stm32mp25x.c, stm32mp23x.c and stm32mp21x.c.

Migrate read_deviceid(), get_cpu_dev(), get_cpu_rev(), get_cpu_type() and
get_cpu_package() into new stm32mp2x.c.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp2/Makefile     |  1 +
 arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c | 44 -----------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c | 44 -----------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c | 46 ------------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c  | 56 +++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+), 134 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/Makefile b/arch/arm/mach-stm32mp/stm32mp2/Makefile
index b25af2e8934..8f2e641dcab 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp2/Makefile
@@ -6,6 +6,7 @@
 obj-y += cpu.o
 obj-y += arm64-mmu.o
 obj-y += rifsc.o
+obj-y += stm32mp2x.o
 obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
 obj-$(CONFIG_STM32MP21X) += stm32mp21x.o
 obj-$(CONFIG_STM32MP23X) += stm32mp23x.o
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c
index 40d0f329496..7b5d79d3497 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c
@@ -11,19 +11,6 @@
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 
-/* SYSCFG register */
-#define SYSCFG_DEVICEID_OFFSET		0x6400
-#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
-#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
-
-/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
-#define REVID_SHIFT	0
-#define REVID_MASK	GENMASK(5, 0)
-
-/* Device Part Number (RPN) = OTP9 */
-#define RPN_SHIFT	0
-#define RPN_MASK	GENMASK(31, 0)
-
 /* Package = bit 0:2 of OTP122 => STM32MP21_PKG defines
  * - 000: Custom package
  * - 001: VFBGA361 => AL = 10x10, 361 balls pith 0.5mm
@@ -32,37 +19,6 @@
  * - 101: TFBGA289 => AM = 14x14, 289 balls pith 0.8mm
  * - others: Reserved
  */
-#define PKG_SHIFT	0
-#define PKG_MASK	GENMASK(2, 0)
-
-static u32 read_deviceid(void)
-{
-	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
-}
-
-u32 get_cpu_dev(void)
-{
-	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
-}
-
-u32 get_cpu_rev(void)
-{
-	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
-}
-
-/* Get Device Part Number (RPN) from OTP */
-u32 get_cpu_type(void)
-{
-	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
-}
-
-/* Get Package options from OTP */
-u32 get_cpu_package(void)
-{
-	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
-}
 
 int get_eth_nb(void)
 {
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
index 022db60811a..e4e5812760c 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
@@ -11,19 +11,6 @@
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 
-/* SYSCFG register */
-#define SYSCFG_DEVICEID_OFFSET		0x6400
-#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
-#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
-
-/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
-#define REVID_SHIFT	0
-#define REVID_MASK	GENMASK(5, 0)
-
-/* Device Part Number (RPN) = OTP9 */
-#define RPN_SHIFT	0
-#define RPN_MASK	GENMASK(31, 0)
-
 /* Package = bit 0:2 of OTP122 => STM32MP23_PKG defines
  * - 000: Custom package
  * - 011: TFBGA361 => AL = 10x10, 361 balls pith 0.5mm
@@ -31,37 +18,6 @@
  * - 101: TFBGA436 => AI = 18x18, 436 balls pith 0.5mm
  * - others: Reserved
  */
-#define PKG_SHIFT	0
-#define PKG_MASK	GENMASK(2, 0)
-
-static u32 read_deviceid(void)
-{
-	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
-}
-
-u32 get_cpu_dev(void)
-{
-	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
-}
-
-u32 get_cpu_rev(void)
-{
-	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
-}
-
-/* Get Device Part Number (RPN) from OTP */
-u32 get_cpu_type(void)
-{
-	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
-}
-
-/* Get Package options from OTP */
-u32 get_cpu_package(void)
-{
-	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
-}
 
 int get_eth_nb(void)
 {
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
index bf1f3d3c5a7..e0d54f4ecc8 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
@@ -6,24 +6,9 @@
 #define LOG_CATEGORY LOGC_ARCH
 
 #include <log.h>
-#include <syscon.h>
 #include <asm/io.h>
-#include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 
-/* SYSCFG register */
-#define SYSCFG_DEVICEID_OFFSET		0x6400
-#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
-#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
-
-/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
-#define REVID_SHIFT	0
-#define REVID_MASK	GENMASK(5, 0)
-
-/* Device Part Number (RPN) = OTP9 */
-#define RPN_SHIFT	0
-#define RPN_MASK	GENMASK(31, 0)
-
 /* Package = bit 0:2 of OTP122 => STM32MP25_PKG defines
  * - 000: Custom package
  * - 001: VFBGA361 => AL = 10x10, 361 balls pith 0.5mm
@@ -31,37 +16,6 @@
  * - 101: TFBGA436 => AI = 18x18, 436 balls pith 0.5mm
  * - others: Reserved
  */
-#define PKG_SHIFT	0
-#define PKG_MASK	GENMASK(2, 0)
-
-static u32 read_deviceid(void)
-{
-	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
-}
-
-u32 get_cpu_dev(void)
-{
-	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
-}
-
-u32 get_cpu_rev(void)
-{
-	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
-}
-
-/* Get Device Part Number (RPN) from OTP */
-u32 get_cpu_type(void)
-{
-	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
-}
-
-/* Get Package options from OTP */
-u32 get_cpu_package(void)
-{
-	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
-}
 
 int get_eth_nb(void)
 {
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
new file mode 100644
index 00000000000..551601a12a9
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY LOGC_ARCH
+
+#include <log.h>
+#include <syscon.h>
+#include <asm/io.h>
+#include <asm/arch/sys_proto.h>
+
+/* SYSCFG register */
+#define SYSCFG_DEVICEID_OFFSET		0x6400
+#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
+#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
+
+/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
+#define REVID_SHIFT	0
+#define REVID_MASK	GENMASK(5, 0)
+
+/* Device Part Number (RPN) = OTP9 */
+#define RPN_SHIFT	0
+#define RPN_MASK	GENMASK(31, 0)
+
+#define PKG_SHIFT	0
+#define PKG_MASK	GENMASK(2, 0)
+
+static u32 read_deviceid(void)
+{
+	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
+
+	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
+}
+
+u32 get_cpu_dev(void)
+{
+	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
+}
+
+u32 get_cpu_rev(void)
+{
+	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
+}
+
+/* Get Device Part Number (RPN) from OTP */
+u32 get_cpu_type(void)
+{
+	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
+}
+
+/* Get Package options from OTP */
+u32 get_cpu_package(void)
+{
+	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
+}

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
