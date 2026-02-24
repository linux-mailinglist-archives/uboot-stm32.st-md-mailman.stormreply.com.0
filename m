Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEcCFqDXnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:53:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDE18A1F2
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:53:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B8ADC8F28A;
	Tue, 24 Feb 2026 16:53:51 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013018.outbound.protection.outlook.com
 [52.101.83.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47B45C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQrHFZ+TS4FM8qZNrAonVA8wjb6oP7Zlde+4oFcNThk576gRXu9Ej/Im60Y7GzUQlbcsQC0NoEuynGbfkFYFjdByy8OwT4S/z+B5eC1d5/aJSU8FoTbBGdpThrFsRX2HCr5VAWCc6heyRHs73UDH3LvI4IpgnMSNwSWh1H2pBfrW/RmWbFLFnlOKoyVWtZck3cey2VEvqBe0k2740LAWMMaa+1J9A6sCz5LVIdTSaXtXHHvwlvZuH2AIc/vA3wyujHV8SPMn0gBW0mchc+Q4NNZ/Y5mpEMu1Ha3ZKZZXLkmE84maii5A8HqR31IzTyFHwZ2r/mAjo/xUwX0cR4UkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs5gBcV94sStFq1tWxz2SHRh8PAp+CjSFfnI1xRqZms=;
 b=CbF2fbuTQRLuAHCi5oBroYp1dii7zCWVxOI5dmAbHLLg09/ytVa36UVitHCcId8U4aMSSGBJjCbSvLflXO8eAfyws3Dq3/V/W6CFD7PbQBOI1N6EIXBIwiMd0GxDBrIURloqPRPPhVd7KzI+Zy8ZaEzfNZHh5tAtDeYNGaZNqYKLhcCeT1ufGAktwBYFkOoP5TnCs/lnC31EylrgjyDX6L//+XthomGNu1FNb5ZfylsYQmQIEVmGeL5B2zH923za7lf3lFSCdPWD9tyfOXX4zpRz2UITWvIx6A6Z/f0GSsNEd219A8UEuP/ij5l/NFnWVeBlkLAYXoB+iFWEK2q4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs5gBcV94sStFq1tWxz2SHRh8PAp+CjSFfnI1xRqZms=;
 b=UuFTet0xN+sh5vJVaJt6wJmYG8vsEV20ACrxBz8udU76JcxJJFAZrZS5GarKEhGsGsj8EUHg2Lv+zRDHB7m5VieecbxJxwJRerklI9GPUIsP756bvOkdprnK17WWc8YeW5bhljqRN9UuD58jV53jKXcXn8dUuDTPstR7sCb8CuM8iBs6L7YE/hUH/jt/LmrMhoINzduUwbPAYVXOGkwQc/RcPjsBq86rzsGyAQUR0gje9t7urtrduJEUXnwA8DSULItrZmy4E5O0SOSHDarCiX/oZz6mdw3ziTabJipeNBflfC6+eLLMCPVOJYMEjw6BOuznrVfSOA60WxcIboT37w==
Received: from DUZPR01CA0239.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::28) by GV1PR10MB8464.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1ca::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:53:46 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::ad) by DUZPR01CA0239.outlook.office365.com
 (2603:10a6:10:4b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 16:53:46 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:55:52 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:53:45 +0100
Message-ID: <70398f37-cd6f-4c59-9376-e2d0b4c83ad3@foss.st.com>
Date: Tue, 24 Feb 2026 17:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
 <20260210-upstream_rifsc_update-v1-4-74c813fa4862@foss.st.com>
 <6c1aa9d2-d869-413f-b51d-99d7ca230b04@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6c1aa9d2-d869-413f-b51d-99d7ca230b04@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|GV1PR10MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2b9574-7ac9-4160-78e8-08de73c54692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTUydm5GK1R4aHJOdEpyNUgwVE5NcUY0eFFVVXljL25veitDSG9OZXJOb1FZ?=
 =?utf-8?B?cFg4WGxrSXVOcWVLK2FCdENhaXQ2WFh4N21aODd3OG1XUVpPR3c3NEtrdHBT?=
 =?utf-8?B?Sm1WeVNJRkh0cE9kQmxJUy9tMzJvYk1wN00wSVo1VlVwNFVMYkpieTRQOGhX?=
 =?utf-8?B?ZXdpZGx3MGVqVlpmV28rS0EwWmJrU3RCNEwvcFQ4OE8rTlo4c3ljWlF2WGND?=
 =?utf-8?B?S1Q4blpqQkQxdHVuU2pGUXN1bzVYOG9xU1paaVZRdCsrczhsRG9ZK1d4K0dJ?=
 =?utf-8?B?L1FkZUdrR21oUzl2TWFVNW5JWWsyRWZaV3gydkhtR3crQ0RQY1N5b2xXQkcr?=
 =?utf-8?B?NXozc09JeXI3Y2xZV0hVS21ONEZ4UllTVEp5RGpmU21IbmxQNlZ4MTRhTUg1?=
 =?utf-8?B?NHFhbUdaUk5jakJKbXlUVUFhU3BObithVzl0UHQyOXFOV20vbXp2SkkydVNj?=
 =?utf-8?B?R2tUcEp3bDhWeEF6Snh5d0lBelhaNFZHMU5pSWlMRllsQ2M1NzNZbFFUZFFZ?=
 =?utf-8?B?b0dka3JERHppdlNRYU9sRlQwKzVhZEZUMHpBZS93N2pkMkRXZUVobEFqcnd4?=
 =?utf-8?B?TVJVUUhpQWFlcHR5U3hFaFlXK3ZJOGI2cVdGMk5qY1htWDRCMklwalU4M1Y1?=
 =?utf-8?B?dXJmTWpwaE1wbTJiREhmczZvQXhSZjJVRUlwWWUvd29Fc2g1Z2JvYy9wS0g0?=
 =?utf-8?B?M2MyaFNnNUZhMG44bEx6UDZvVURtT1JTckpQeFpBUjVIdE96YkdlOWYxOGl4?=
 =?utf-8?B?YnZEWDhycityNFJxU3ZzMzhYNVozYThWWXJtR1J5OTZDdGd1bWhrZWxjSWx3?=
 =?utf-8?B?VWxOQ2JzRDF4UzBZTWRZMVc3TjZrbU9PU2pXY2E2bGdIaDQrWURmWWV0amov?=
 =?utf-8?B?Rlc0ckc5bTdKVSt5YUM0RTJkazdtKzkyMjdjaTBGMDE4YndYeDdqY2hKYXRH?=
 =?utf-8?B?dEVkbFVRdjlZSDZ1cElaZ0x4WTMrQ3dyQjk0d3oxYkx1Y29XOHlibE5Ed3Vw?=
 =?utf-8?B?VWp6aWREdlJ6eXdKc1hXUHhBMmdrK2UwRUlhNGd5NGpXWFA3MUVXc1FkYkpJ?=
 =?utf-8?B?THdOMi9DcU9TVTdEWi9MZlRFWDF1MDhRcG80QzVtWUpxR0tGT0QxekU3cDh5?=
 =?utf-8?B?a043Z0RxMTUvUEt0YUhTQ3BwTmdYL3BzWGQrYzhDRlpRbnQvZHpKdE9nejFh?=
 =?utf-8?B?NmdaUnVHdVhzc1B6VUJxMDczazh1Y1BzUGxSZW5tZUNSc3U4MWI5eWJwZTNj?=
 =?utf-8?B?TnVSZStseDJ3RmpFTitHWmIxeklQWXNQdjBXWGt4eVkydy9GdEw4L1ZMQzQ1?=
 =?utf-8?B?ejJSK2Z5MkRFZ1Q3aDltR0xyNDNuMy9DeEJCc1Nab2s5NitYL3hwUlZtZC9r?=
 =?utf-8?B?akhKWTRwdXFkMlpwWDlIZnA5aC9zSFJwZ0lGZG1sZWRpNXU3WmZ1ZVE4OHdK?=
 =?utf-8?B?eFZmZnYyV3M5Sjl6d3ZzMUxLUUVCeEV3cjRLSUdCZStUL0FkaW9BSzU1VVpo?=
 =?utf-8?B?SmJaM1h5RVBJc2lCbGxrZjAzMldkUWpjanFWbWxCUm90bFN2Q0Z2c0ZvM1Aw?=
 =?utf-8?B?QVdBUDlpZ0NMMngzSDdBMGlGLzdBOEdiK3FyeWEvQU9pandnREFwc3Z2bW5T?=
 =?utf-8?B?Y2k3djlrV0RQT0htbTZkNXRiSno5RXpNZW1zRnBlTzNUSGxtNHMrd3JnUkV5?=
 =?utf-8?B?YnVXMFVlRVdnVGtBeHhxTFFRRkxVbVBWT0gybmdVejJOck1lOXFwdnpWQTBC?=
 =?utf-8?B?a0RQZDJ6cnFjUkxIQ3VOZ285akpFQ3U3VFhiZDlLNkFwOE1WM1hzenM4M1or?=
 =?utf-8?B?bHVYVWpOM1llZ0diK0ZkWHVUMDIwUmpsV0Iwd2hYUk5tbW1WS3RVZGY3ZC84?=
 =?utf-8?B?TzhDTXIwcUNqUmxzUUFoWUhKV2I3TFZGVlE1Zjk5OE5WaVl4TTgxZDJUUlhW?=
 =?utf-8?B?Y0wvZmltSDRUUll4dDF6bW0va1RPcFVBemY5eENTZkJJNmk4R2pOMTh2M2R6?=
 =?utf-8?B?bGtmNjNFU2hneW85a1pzeE4zMUR3SkE0NnlReTFQR21rZThPNnBUTWdJcEo2?=
 =?utf-8?B?MEdSeVIrNjJWOE42TkF1TFozWmpRdmV6NFU2MG9pNmxTK0VQSnlYS2Q4a2FG?=
 =?utf-8?B?WFpocnMxM3ZHeElraXhrZjVJUHIvNTRJVWdseko3bUFqbTNoWjI3Z2ZEcVFk?=
 =?utf-8?B?ZkxWODFocVJyVmF5UWR3cGpCRHBIZ09PV0RCTStVRUYwZVBqRnA2b3BuWFpo?=
 =?utf-8?B?Vit1VXJVWHh5Z1hLUEdSYlpMR1B3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qtEwTgFToBztGWNLdkde7kdZjtdflXfdcS4CCwsckFGCrLSmjEEEG+sx+QBNOkI7m9VHO2IzgfIQuJvaD4DIaSBnpFcr0OxwzpIlnYAbyKoCl/sNA/yCA+2egVoPe0rG3ttpak7LKc1/d62ZO7YQCPrj/Dro04nV6UogSi6hcddklpqxHauQUwvXdCUGrYyYGY37uEvPyvIm/3kKx8gUbXkBXTPtM2LDOTTFHSPhtHi6xUhXLJsscgOPOnmV0vCr80/35OZBdeyGLw3qD/dA9kLxakK6VbL0lSeBz2N5VT1FRKKiUWlV2ng9OWfwTueclPylWDnz9uDoc7COO3Wvom175KA15K8Zq5pUBLBuFKq9spOGKkMIfaCtyg5i96nP5WWOI2bPOTTty7Z+kNQ7mpuJu16qGbGjMap2SQZf8ua3n6FlvHpgWf2kpFMNdIFC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:53:46.1787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2b9574-7ac9-4160-78e8-08de73c54692
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8464
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] ARM: stm32mp: Check secure state first
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
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.238];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9DDE18A1F2
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDExOjMzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvMTAvMjYgMTE6MjYsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogR2F0aWVuIENo
ZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+Pgo+PiBTZWN1cmUgc3Rh
dGUgbXVzdCBiZSBjaGVja2VkIGJlZm9yZSBoYW5kbGluZyBzZW1hcGhvcmVzLAo+PiBvdGhlcndp
c2UgaXQgY2FuIGNhdXNlIGFuIElBQy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZh
bGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKg
IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jIHwgMTIgKysrKysrLS0tLS0t
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvcmlmc2MuYyBi
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jCj4+IGluZGV4IDBlZjA4NmJi
OTU2Li45ZGI4YjllZmM2NCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0
bTMybXAyL3JpZnNjLmMKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL3Jp
ZnNjLmMKPj4gQEAgLTE0MSw2ICsxNDEsMTIgQEAgc3RhdGljIGludCByaWZzY19jaGVja19hY2Nl
c3Modm9pZCAqYmFzZSwgdTMyIGlkKQo+PiDCoMKgwqDCoMKgIGNpZF9yZWdfdmFsdWUgPSByZWFk
bChiYXNlICsgUklGU0NfUklTQ19QRVIwX0NJRENGR1IoaWQpKTsKPj4gwqDCoMKgwqDCoCBzZW1f
cmVnX3ZhbHVlID0gcmVhZGwoYmFzZSArIFJJRlNDX1JJU0NfUEVSMF9TRU1DUihpZCkpOwo+PiDC
oCArwqDCoMKgIC8qIENoZWNrIHNlY3VyaXR5IGNvbmZpZ3VyYXRpb24gKi8KPj4gK8KgwqDCoCBp
ZiAoc2VjX3JlZ192YWx1ZSAmIEJJVChyZWdfb2Zmc2V0KSkgewo+PiArwqDCoMKgwqDCoMKgwqAg
bG9nX2RlYnVnKCJJbnZhbGlkIHNlY3VyaXR5IGNvbmZpZ3VyYXRpb24gZm9yIHBlcmlwaGVyYWwg
JWRcbiIsIGlkKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUFDQ0VTOwo+PiArwqDCoMKg
IH0KPj4gKwo+PiDCoMKgwqDCoMKgIC8qIFNraXAgY2lkIGNoZWNrIGlmIENJRCBmaWx0ZXJpbmcg
aXNuJ3QgZW5hYmxlZCAqLwo+PiDCoMKgwqDCoMKgIGlmICghKGNpZF9yZWdfdmFsdWUgJiBDSURD
RkdSX0NGRU4pKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBza2lwX2NpZF9jaGVjazsKPj4g
QEAgLTE2MiwxMiArMTY4LDYgQEAgc3RhdGljIGludCByaWZzY19jaGVja19hY2Nlc3Modm9pZCAq
YmFzZSwgdTMyIGlkKQo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgwqAgc2tpcF9jaWRfY2hlY2s6Cj4+
IC3CoMKgwqAgLyogQ2hlY2sgc2VjdXJpdHkgY29uZmlndXJhdGlvbiAqLwo+PiAtwqDCoMKgIGlm
IChzZWNfcmVnX3ZhbHVlICYgQklUKHJlZ19vZmZzZXQpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBs
b2dfZGVidWcoIkludmFsaWQgc2VjdXJpdHkgY29uZmlndXJhdGlvbiBmb3IgcGVyaXBoZXJhbCAl
ZFxuIiwgaWQpOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FQUNDRVM7Cj4+IC3CoMKgwqAg
fQo+PiAtCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gwqAKPiAKPiAKPiBSZXZp
ZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
PiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCgoKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVy
CgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
