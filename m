Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDavNDDVnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:43:28 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13D189F36
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:43:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9F0C8F28A;
	Tue, 24 Feb 2026 16:43:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013007.outbound.protection.outlook.com
 [40.107.162.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72930C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:43:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDe7mKEKj9EEBgk8YCBVpQaTHI1LGwdzUJPJK71vu5nj3ZR+ZMsD+ww4kFzSLIdfMa49M9FjwS9OQOh+/vjnyjKdfJFEve+/8fAzsg93ogCm6I8Np1RzKG3MradC2hQcZHFUXxsFBY8FK2tka9uKblQWl54sSrHPDXO5UmJULkSHEHXqYOj6pgjw59MpU2TJF+9Ip58VGby2e9cU7JP9z8O5PK8U+5OycxPrrK1B2bm/tzJvMSmhvqFLlCL2rTuAEBmN4AvRcpxCoQfcs97eLOfPqnKgePCqEvEpiGj0qXzrwIdDFF4UQGxxJIYO+NfM77SGdlCBxOUgIF0EIG4s6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3UhtSIMoOC4QvMYmS25R8NxH3/v51bCCkns7HRyTZ0=;
 b=eggbjqCDxiH5tfXyJDNovm4wgpmcxEIOJo/h2DckaEbmUFzZg7YwK5YyRsiGsSvMhh0mLQrTJzq6KUQYBuoAPDjnkJqDaXHA0/i9k2iv7B4bq6dt+Tuu9JZROfADlBQidkglDStON1Y4M5aH7HqqgW9CuRiAEV4wEyuK121FTv0mkvoQ5tJIDapVQpAroruTOO2Ktr4zQxCMchzHFIi3ue0JcZRZ5vnQXNwkzPifkqbAKCtspwBrg+IKH/+ncYEahc20/zrztCh6wDvbV1nq5daiW6AvH/nsoaMJU3VhtPA44b6KhgvAIvxZFLcrQZ533b9j8DlocMfBmNr8RvsCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3UhtSIMoOC4QvMYmS25R8NxH3/v51bCCkns7HRyTZ0=;
 b=F4wyOZs3Yo9QsygIsx5bwXT9AXSGIxowcYRG1nBrsYf5RctRCpub/XLaSM0jXfFg7TKJYmg9ZY8HXMyBfQzG/EdfbRhAnFQtkfpZvA/3uJecIyQ/kr1qT10A+nKLn5dvsHW0u7TSX2lErHWPZ/QZG99wwf+3AuQJAxMtYgQXv43VoOatNAHTzSpvfqBkQxFcTS+cUf76HOpl32+tPoJU8cKiOFfFOmMdmOLbnTXJOmJ/L6ftNckWVt+hF23WpE8Cgzbtwpw2isjm0JF8EHobyiuEBsNcp9Yz94hyXYOmACdbNoDiiWA/m2VAafgVV8F9LS7+Rsz649l0AjKKbWQp8Q==
Received: from AM6P194CA0068.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::45)
 by VI0PR10MB9577.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:31d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:43:21 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:209:84:cafe::20) by AM6P194CA0068.outlook.office365.com
 (2603:10a6:209:84::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 16:43:21 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:45:11 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:43:03 +0100
Message-ID: <b9dd138c-1361-4ecc-8db1-c62a7fec6861@foss.st.com>
Date: Tue, 24 Feb 2026 17:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|VI0PR10MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac7acd5-be3d-487b-04dc-08de73c3d1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVFWSHNLVmVuQlgwY1JaRkN2YjlubHgxeXZqM3pMbnZBVHByQXVMRzV6TVA0?=
 =?utf-8?B?T0xuWDBTMGIzdVorSWdtS1Fna21OQmN1OGQwNGlwZzB5eEJLb0FlSm1keHg3?=
 =?utf-8?B?OWRhWS9sRWxvTk5TRElKTnJXbkVXcjM2bnF3QVUwckNiUEQxZFMrUG9GTXJq?=
 =?utf-8?B?djBjT2x3dW5UV3RwdXc4aStzTHk2OUR2SXhoT29YREw4SnRFb2oyckNXSDdS?=
 =?utf-8?B?T2hJVjM0ZUh0L1JNdlNVRHRQUWJJempvSjBzOGtTUHhha2FaT29HTzRmWTl6?=
 =?utf-8?B?MzBUSHl0bkUxanRreFhHU2pGR3lHK0VjYjV0aWY0blcwQWl0ZWUrajNZTzBJ?=
 =?utf-8?B?NFpQVUwwaHZ4bXhnU2t2U0NLcUlGb04xdExtU0tMYVUrL1drUEJPbGwwMVBI?=
 =?utf-8?B?OXZnUXRsVkFGV1ZSOUw5OFRhNVJod0crS2M4cWozZ1pwZTRac245dExjV2tL?=
 =?utf-8?B?c014dkNISjEvVXhwUDBML0YrUEpxRURSakVaS1kxWGxJMHpTQ2oxaEVXTWVG?=
 =?utf-8?B?bTdIR2xXUm9oZENFU1hOWmdjcGFOYVZnV2JDaWtKUHltT21VaUpkZ29walU1?=
 =?utf-8?B?M1dBMmRNSnRES2xUaFJQc3VHSjVVU3NFcWNJSGpGWnpqcm1JRTB4UE9kS1VO?=
 =?utf-8?B?MkNwcnRxU1RyVytHVUh3Sk50NVoxUFBJOEppek1pRmN5NnlpSzFza2Jna0Nn?=
 =?utf-8?B?TkpITU9CMTNMcGxFZ1hxZVZtazlZZzUwRk9hVDM2YjN1R3lPS1FtNHdHNVNv?=
 =?utf-8?B?RHdUYVZLeFpNN0x3SVZ6d3pCTUp6MTZ2U3VoZTBLR0hsSXEzamhBVUNVQ3Rk?=
 =?utf-8?B?UUlIK3UzWWFOV29JQlk0aWtQT1pYeS9YdXo4b2puRmgxVUhZVjN1cjJtOCsr?=
 =?utf-8?B?ZmRPRGR5Mm9RZmhqcmkzOEdrSk9yWUxKYkNVdG1FVE1ESy82M2JISTNJWGhT?=
 =?utf-8?B?ZTBYWHZuNSs0cXNhU1VubHoxc1ByWUZLYmorV3VKWWlONXltSEN6WmErRzRI?=
 =?utf-8?B?LzNJb2dyR2dQcnppOStFOFZBUGM0cm1SS2d1R2diUDl2RVc1NGRYemV0dERv?=
 =?utf-8?B?L3BuV0VvUDloRXM2N1k0aUcrQkFzSkhQSXJEUXdYbUt0cVRKTDM3T01yVDcx?=
 =?utf-8?B?MFNWRTV2YjQ3RFJKWlhOQ0hKY21tMStpVW1EeGh4S3VOdHYwSGhaLzZzK0Y5?=
 =?utf-8?B?Mm1iVnNGSmZVQjRETldPSXZjRm9JQmxTWGVucmpwQUtNbkZOUmZlN3Z4bVN2?=
 =?utf-8?B?Ui92b1hnRllaZmUxSzc1VXpsT1VQZ0RjRG9zdmVMMVdLQ1ByZWQ4YUdEOCtK?=
 =?utf-8?B?NWNsdGtIMDhDamxHVXo1TGdDYkNBNklzVlZYdEFjN1JGejV0SDBBQytFYjlh?=
 =?utf-8?B?dFFuZVNlYzEvMzgxSVc5TzNQQ2hZelBGUnErekhIcDZLL2g1T2xvdzhUV3Fp?=
 =?utf-8?B?MUNta0JTUVRmOTQ0Q29BdFRidnlhZ282dGtCUk5DRUkwMEM4aUE2K1NENjQ5?=
 =?utf-8?B?cHY2SXBlTXlBS1Y2MkMrTzVqc2FBY1l2RXg5azdIeXFXR3hLRm51VjhoMCsx?=
 =?utf-8?B?Ri9Ya0xBeHl2UWxiOVprQ010TGJlWENUMlZzdndkNHdjM2hubXBvS0pZVFVn?=
 =?utf-8?B?UUR2RG8vZ0IrZkcycXVyWGdxcUZhcGpkbjNoc2N1Nm03QUhVRVIwQ0o1ZHZD?=
 =?utf-8?B?RjVhaUh6ZGxhMmpMeGJPTjJja2tjWC9HcjQrUlJCWHR3VThMaERhMlNsVU5I?=
 =?utf-8?B?eVdrS2x4SFl1TkkwNHZreFVjNFNPbExTNWZ0V2FYNmpmTkxBTFkzUm9DSEtk?=
 =?utf-8?B?Vkd4MlZTNm5sWW1xQkF6dGZ2UG15ZGNRS0hCVks4R2E5TGV4VFVSNjlSZDlF?=
 =?utf-8?B?a3NOK1ZrZTdsTnNvUWVJM2FXdnNqU1VaRU8ydFRpNXFYemlIMURWWWtIbmZ4?=
 =?utf-8?B?ZlpJbGZuV1F5TU1DcXZnN2l3ZGRyZjE0Z0UzZUs4RWVwWXFvWisyT3N0aEto?=
 =?utf-8?B?WTVDT3owbjM0djhiT21zK0thZ2JYTm1VQW5HTUUvQXBuK2dvVU43TWtjSTVF?=
 =?utf-8?B?Q29Qcm5qU3VBWlpGL3dhRlJWVHJJaHM5bCtkaUE1eFh0VldiVElqQ1gvTG9S?=
 =?utf-8?B?M1k3L1dnVnJWbEJkTnlzTGx5VUZkQXpqaWVNQWJMUlpuN3FBZWlZREkxV1RC?=
 =?utf-8?B?aVNFVWNIVTkxTUs3TnFwcmJGbVdxMHJwLzdSdXlkRUFtQVdFa1hYbjdNY3o1?=
 =?utf-8?B?Uk0xSnZnS3lWQlY2anBSeEtDL0JnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MqyS49lexRleeHnfak+Azo73d53q0nsTHrVICqjkehriR3E48bqPnw4T/OIvbN017Qp2Ejum/f56HaQbBj+4HNsYmYlqCjneDVYzixjXgLTVsQJnUm3BLoGXzUQp+NRN5wraAvdsPqW4XvOmm9gQQtB7Z8pnVvJQRSFAbz1E1RkS+EOzqe71SgTgQrs9dkvicRCZHmnTfhY7cfh5mdqqq5cq1cJLYo6qC88lFq8HeKnl0aFDZDy9ukfEWSFg46QAQq/RqOpQD9x4+wzuu5RF0OzMbKvBIDzauoY7oTK4AuERiXf+pUkN7WKvrgzVK4qazExkWyir0eT+MNfUqkAVYSf1NO90ROtIteKhXJ80ehlUCmnBMapAHMroU9SJfVPE9biIFdKX4j/75AFn4T5PtUtxNpMT/2+JrlyhNp96DYRdfa8pbou0iFyzT4+ed/lJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:43:21.0728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac7acd5-be3d-487b-04dc-08de73c3d1f6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9577
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>, Patrick
 Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 0/7] ARM: stm32mp: Add STM32MP21x support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:patrick.delaunay@foss.st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:url,st.com:email,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.428];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C13D189F36
X-Rspamd-Action: no action

CgpPbiAyLzMvMjYgMTc6NDksIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPiBBZGQgU1RNMzJNUDIx
IHN1cHBvcnQgd2hpY2ggaXMgYW4gYXBwbGljYXRpb24gcHJvY2Vzc29ycwo+IChTVE0zMiBNUFVz
KSBiYXNlZCBvbiBhIHNpbmdsZSBBcm0gQ29ydGV4wq4tQTM1IGNvcmUgcnVubmluZwo+IHVwIHRv
IDEuNSBHSHogYW5kIENvcnRleMKuLU0zMyBjb3JlIHJ1bm5pbmcgYXQgMzAwIE1Iei4KPiAKPiBN
b3JlIGRldGFpbHMgYXZhaWxhYmxlIGF0Ogo+IGh0dHBzOi8vd3d3LnN0LmNvbS9lbi9taWNyb2Nv
bnRyb2xsZXJzLW1pY3JvcHJvY2Vzc29ycy9zdG0zMm1wMi1zZXJpZXMuaHRtbAo+IAo+IFRoaXMg
c2VyaWVzIGFkZHMgU1RNMzJNUDIxeCBtYWNoaW5lLCBjbG9jayBhbmQgcmVzZXQgZHJpdmVycyBh
bmQgdXBkYXRlCj4gY21kX3N0bTMya2V5LCBtbXUsIHJpZnNjLCBzeXNjb24gZm9yIFNUTTMyTVAy
MSBzdXBwb3J0LiAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KPiAtLS0KPiBQYXRyaWNlIENob3RhcmQgKDcpOgo+ICAgICAg
IGNsazogc3RtMzJtcDIxOiBBZGQgY2xvY2sgZHJpdmVyIHN1cHBvcnQKPiAgICAgICByZXNldDog
c3RtMzJtcDIxOiBhZGQgc3RtMzJtcDIxIHJlc2V0IGRyaXZlcgo+ICAgICAgIHN0bTMybXA6IHN5
c2NvbjogQWRkIFNUTTMyTVAyMSBzdXBwb3J0Cj4gICAgICAgc3RtMzJtcDogY21kX3N0bTMya2V5
OiBhZGQgc3VwcG9ydCBvZiBTVE0zMk1QMjF4Cj4gICAgICAgQVJNOiBzdG0zMm1wOiBBZGQgU1RN
MzJNUDIxIHN1cHBvcnQKPiAgICAgICBBUk06IGR0czogc3RtMzI6IEFkZCBzdG0zMm1wMjE1Zi1k
ay11LWJvb3QKPiAgICAgICBBUk06IGR0czogc3RtMzI6IEFkZCBib290cGgtYWxsIGluIHN0bTMy
bXAyMTVmLWRrLXUtYm9vdC5kdHNpCj4gCj4gIGFyY2gvYXJtL2R0cy9zdG0zMm1wMjE1Zi1kay11
LWJvb3QuZHRzaSAgICAgICAgfCAgMTkgKwo+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgIHwgIDI3ICsKPiAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25m
aWcuMjF4ICAgICAgICAgICAgICB8ICAzNyArKwo+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9j
bWRfc3RtMzJrZXkuYyAgICAgICAgICAgfCAgNzAgKy0tCj4gIGFyY2gvYXJtL21hY2gtc3RtMzJt
cC9pbmNsdWRlL21hY2gvc3RtMzIuaCAgICAgfCAgMTIgKy0KPiAgYXJjaC9hcm0vbWFjaC1zdG0z
Mm1wL2luY2x1ZGUvbWFjaC9zeXNfcHJvdG8uaCB8ICAyMiArCj4gIGFyY2gvYXJtL21hY2gtc3Rt
MzJtcC9zdG0zMm1wMi9NYWtlZmlsZSAgICAgICAgfCAgIDEgKwo+ICBhcmNoL2FybS9tYWNoLXN0
bTMybXAvc3RtMzJtcDIvYXJtNjQtbW11LmMgICAgIHwgICAyICsKPiAgYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL3N0bTMybXAyL2NwdS5jICAgICAgICAgICB8ICAgMiArCj4gIGFyY2gvYXJtL21hY2gt
c3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL2FybS9tYWNo
LXN0bTMybXAvc3RtMzJtcDIvc3RtMzJtcDIxeC5jICAgIHwgMTkyICsrKysrKysKPiAgYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL3N5c2Nvbi5jICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGJvYXJk
L3N0L2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgYm9h
cmQvc3Qvc3RtMzJtcDIvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArCj4gIGNv
bmZpZ3Mvc3RtMzJtcDIxX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgNzggKysrCj4g
IGRyaXZlcnMvY2xrL3N0bTMyL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+
ICBkcml2ZXJzL2Nsay9zdG0zMi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsK
PiAgZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyMS5jICAgICAgICAgICAgICB8IDcwOSAr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvcmVzZXQvc3RtMzIvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgfCAgIDcgKwo+ICBkcml2ZXJzL3Jlc2V0L3N0bTMyL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9yZXNldC9zdG0zMi9zdG0zMi1y
ZXNldC1tcDIxLmMgICAgICAgICB8IDEzNiArKysrKwo+ICBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJt
cDIxX2NvbW1vbi5oICAgICAgICAgICAgIHwgMTI2ICsrKysrCj4gIGluY2x1ZGUvY29uZmlncy9z
dG0zMm1wMjFfc3RfY29tbW9uLmggICAgICAgICAgfCAgNTEgKysKPiAgaW5jbHVkZS9zdG0zMm1w
MjFfcmNjLmggICAgICAgICAgICAgICAgICAgICAgICB8IDY1MSArKysrKysrKysrKysrKysrKysr
KysrKwo+ICAyNSBmaWxlcyBjaGFuZ2VkLCAyMTM1IGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9u
cygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiA2Njg5MWZmYjE0OTIwZTM1YWJmYWZjYWU3OTVjZjQ2
MDRkZTY2ODJmCj4gY2hhbmdlLWlkOiAyMDI2MDIwMy11cHN0cmVhbV9hZGRfc3RtMzJtcDIxX3N1
cHBvcnQtMGIwZWQwNzRkZGE5Cj4gCj4gQmVzdCByZWdhcmRzLAoKCkZvciB0aGUgd2hvbGUgc2Vy
aWVzIHdpdGggZml4IG9uIHBhdGNoIDU6CgoKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVy
CgpUaGFua3MKUGF0cmljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
