Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GUOJzWmnWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:01 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3D18793A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EEEFC8F288;
	Tue, 24 Feb 2026 13:23:01 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D30C8F287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9klLZ/bAC4aPaBx0SFA7Dw6zE0gQN9lmZ9/6GphqTmH5ne1ABYJFZYAqqVaYibojZSCNYMR/t9WKodYeuZ6byrjVoOCB9hsaSw8JqVtXqBFXXAuJSvmegkw6tHSu421RRgAKD9dampHFpxi+gPSjxY6xy4AN5FcYwBdb4UL5NIammo+xb7we5Bgmnp4z+w2HKGLcjuNM2gUFnR1ZfZFOeCN+eX2I1/CImEumE7hyBz8puUG5VpF0wHqMquEMF5VSteu7iZvxLuaapbVCmyEyeQXGUTplDGASqOoyQxyVAoZAmx2796ESYFQHT0ybG+5GfFU9aoOMUMaP+37qhctMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pT3XHi/TRrIwHFIqq+q48Uq9scJa3PLWXtQIqGI61E=;
 b=QFM3a3lxIHvSKCZ17FsTWCsmSiwZ4nyXJmA3SpOxe70SeJCSL4nx7Fq1flSJYLhjx7N59IW0mEm+1Yy+WkklaAlDOD/hAtZZam0sP4fPNIMlGcP2uaUGUrqrmHQq3nfmWxfx5arK0Ok7LJWCafGrlNrawYLjo1+uM0Q82VGIbwH9yfVGxSFWZ+zep/fJj9ggL6s2RmnABzomdY7pTgyT3/75r5q8Gps06dyrk1+QpqBuXp/bAt6Yuvgd2EHmZ2r7xXrxTH0KWaSegyHJrAQ3XoOP5yEF24k9WCia0rjMkVVtyF4zH2IDr3wUGXTJapL9TjzI5JNbw+ckMZQgqch/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pT3XHi/TRrIwHFIqq+q48Uq9scJa3PLWXtQIqGI61E=;
 b=UbNFO6xePe+U4c/weo7fDMw8Mxcz5EW/KukB0b6segmLS6MJl78OdwyVIR1IMmBxY1YI/+RxfpKB7aA4933YxKOundES5EOfEItQ7FMYnsAIzGaUu05shjt3btt2I5J0wxjBnfoC/Tu1wS71BwYe41fyO1xXpcMdAy0/qxQu1qoOkM2+eOQ6Rlwheb+obCJqulOC6UTCX0GTqJiDc5JA+gURerIFdUDZBVISLYc7tqd5LhzdW7+7F8xMDWEHw9uOLv450Th6KsFBNWFLPdr0eJkwxa2qCjx9h9I37N+C65vy6h59GKs0QCJSsbc6MH6KagiP0YKZoVEbJzURxhkJag==
Received: from AM0PR02CA0183.eurprd02.prod.outlook.com (2603:10a6:20b:28e::20)
 by VI0PR10MB8789.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 13:22:57 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::7) by AM0PR02CA0183.outlook.office365.com
 (2603:10a6:20b:28e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:22:57 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:25:03 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:22:56 +0100
Message-ID: <22409a39-7d69-4b34-9929-b97d0b1dee23@foss.st.com>
Date: Tue, 24 Feb 2026 14:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
 <20260211-upstream_update_cmd_stboard-v1-2-63fd9b767bcc@foss.st.com>
 <6197f9b7-b168-4630-9665-b11a89078ae2@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6197f9b7-b168-4630-9665-b11a89078ae2@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A797:EE_|VI0PR10MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e039cc-8ecd-491d-2989-08de73a7d32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlBBYlJmU2FhamJ4amhGQlhZTFc1d1dsblhoRXdDdS9acTZ6YzNYUHM0OXNL?=
 =?utf-8?B?MVU0NC9BdittcEY1Rm1uelZwbWRGbWRVMzRpbnJzTTVOdE9MTzNydS9QOFAz?=
 =?utf-8?B?bmpPZnRNMldSRno5K3R3aDFDL2xUeHRvZjFETkpCd1RWbUE4WFNYbmtMLzMy?=
 =?utf-8?B?ajBVUjZXMnZ2YWRtVGJCbFMrb016S1dNemVyK3g3Uy9HZEdMZzh3ZjhoWGZT?=
 =?utf-8?B?S0xzQlJlcFZSZjd1VHUyMXVGUDNaT3c0R3NzSi9oVUNzTERqUTVnTUloNE1l?=
 =?utf-8?B?eVBTYnVJcFY3SkFENjFRQ05DT2lOYkNDczJmS1g0NDFRZ3o5WU4wa3Fhb3Bm?=
 =?utf-8?B?R3EzLy9jODFyNGR5SDZSaU44dUhDYyt0V1ZxSUtIb1doWW9YeWlSd0w0VHN2?=
 =?utf-8?B?SFp1dTFqR0pGWjE5UkFqU0VXem1ZLzdEYnJpV2pPUC80Q0dUTUgyNXVPcm42?=
 =?utf-8?B?dnNnYTNvKzg2Y3FFdjJ1RzlEZ0drRFNIUEY1UjloUytoMFVncTY3VzBLOU1l?=
 =?utf-8?B?UWMrTWtFSlhPZ2lNZWdnbVlvVlEwS2dKUXV1YmNWaVFuQVl2NC91VGpXbzBv?=
 =?utf-8?B?VW5JM0h4VkFSVFU3SElncUNyRlJKSW9hN0IxZUswN25EQThwNEdtRHdtWnY4?=
 =?utf-8?B?UzB4QjlpMW1ZR04xRXpxQm52SHloSW5oV3NDcjFNT2ZOK1c3eG5vMXZMUEtS?=
 =?utf-8?B?cXR4a1oxR0ZnU2xxaXFFL3dSRDdOS2hwMUpRYS93aklScGdVT1pybDRKcCtT?=
 =?utf-8?B?SVBJRTlHZjVLWWJ4M3hvKyt3a3g5MmpvLzliWXNNTWttV2t6MzMyRFF5ZHJU?=
 =?utf-8?B?am9uY05JRmhVWE4vQ2xIYnR1V0NMMExkUktQcy80UzVNeWZkZSt0V1RKd0p4?=
 =?utf-8?B?UnBtVlEvY1FBd21uY3Q3SENJdGVsNDhrT0x0dlo4VmEvdGVSS1RWWnNpRVgr?=
 =?utf-8?B?TkJPQXh2N0U0SitQWlp1R3hXcXJzaWdoa2FNemN0SnMyenROOVBtM0ZQYlRQ?=
 =?utf-8?B?WEZ3M0J1MXhYTVVxVlVydE9hN1FoS1QvYzZMWVRtblkrcGx3UEk0VFZQL2Zz?=
 =?utf-8?B?VDdON0Rld3lpZWtJYWdtMGNkYUFLSjFvdzBqQ2Z2c2VTTXZTUCtpQzJXK2ZH?=
 =?utf-8?B?UmlINzRCcVdTbDhqZ1FDOU1HWEIweDROdnAzb3FiSjBsQmdCbVloVmRsQW5Q?=
 =?utf-8?B?NU9uZEVUV21oajVsdytiTWxWOFpBaTlNa0VCTjl4ZExyN0JsVnhRSS9JaHNu?=
 =?utf-8?B?OHcxUWJXcXVSMTZlcmdYZXlQYzc0cHQySEdCWlFtSHNseW1NemVYWE14ZXE4?=
 =?utf-8?B?S0hkaU5pcjlCM0NTWTludGhkcHRCbnJxTEFxcW9VRWJuT2lWWEExV3dsUnNj?=
 =?utf-8?B?WE9XOU82VGpwNUNWaGFDb2RRb1J0Snhmams1Q3J5VDZDV3BpbmdwMmFkVlR4?=
 =?utf-8?B?aitObS9Ib0hkQUR2ajVUdjhOTmc3eDJvM2NpWHhnalRIek15YTNkL1RBNWw3?=
 =?utf-8?B?QTlXdmdMYTZqTmtFRWpVZkFtQjFHUWpyTzhkZE02NE9wUXUwZzlJZWhUMU5i?=
 =?utf-8?B?U1NXN3Zoa1krc1RveTRmOUpSMVRyb0lINlVNUjQvTTBFemFDRVBvZkZNekJm?=
 =?utf-8?B?blFOeHlrSTlEUHgrdFZVdE12bTgvZGVLbEZITEl6d1JrRjF4UFRQWkdWcHNE?=
 =?utf-8?B?WG4xUm1qOXhubU1UUHBCSnNRM2hEU0pOUGRRZ1Bib2VITUowaU1IWVhnQ0VQ?=
 =?utf-8?B?aDIwS2JYdXk5M3UrdWtmQjFaMllmMGFmZDVGY1pJdHdnTmdHRjU1WXBRK0xp?=
 =?utf-8?B?VThERElFZmFNaUtBcVBGaTUvaHRiZ21LMmZIcW9jMi9zSmd1a0lSVC9UQk1L?=
 =?utf-8?B?N0VKYjEwS091T0hCdkh6R2QxOWh1akkwYlZtWjlwNzdqemFoc2JGemFudUlN?=
 =?utf-8?B?OXBwTFZPMHN3ajR4ZWZLT1RQTDZmd25XZGlRWFVKNGRiWmF4YURhWktKZno5?=
 =?utf-8?B?WC90ZmU4bE9reU02ZmxvaUEvN2ttUUpHaHRCSnNjT0RmempnRXlQSUxhZEhv?=
 =?utf-8?B?NW0xSmNXZ0RZdDVJSkxGcGhxU1Y4c1V5NE9IMkVESEExVDlZSzBEaGxiVWFp?=
 =?utf-8?B?MVBVNENBUGUwZjFUTFgvSHcvT0RVZCtlcEF1eUxGdktadGhta1N1Vk1LbVor?=
 =?utf-8?B?cWM0TXVFS3BQbFFraHRUbjNQMHFtTiswenJJcjNPVFJRaVV0cVhZNGpVN0x0?=
 =?utf-8?B?MDhuTjZMNmMwcm9GL0l5c05CVnNnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sS8UDnSzXV8N6kV/viiVtG6uY2YgGAkbZN+5UtSBANFcLLXUUNvuaCzkskuoLEUoks5zrMTRluMmJoafGQPOOBgS2vsHivdN7viM82WPwjQmX5CVOp1T4j+uRgDLsyDi4OcNWz8TU4UhZTX8EeS05WNOIbLILVPdC37mJ3Ps3WKi5Xw2Ntc52nHbLFXVxUiBNMDE1B0+Bbs4QI4KQjkvUZhfoqxM78tnhxZ/4OLMhgaQLAXM21S03yu+ZPfB8nPv/CIw+z+/b07bK1jXrBdE5Xmac/71tSpMo67ke3IR1kfTY2+obLMLlU8L3/haO724oM036x60qiLDjVGzEZmNTBBEQ9YFy5A6T3h61QZtj5yYd3Y2awGUPslqyEE0wD31TK0r+MS0bXcljQW9gqVymbkyz/gWg0GrBnfpQAIIF1HdS7VMaL200zj5I23YVhBD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:22:57.1944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e039cc-8ecd-491d-2989-08de73a7d32b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8789
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: st: common: add
 uclass_get_device_by_driver()'s return value check
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 49F3D18793A
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDExOjM2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvMTEvMjYgMTU6MzIsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gY2xhc3NfZ2V0X2Rldmlj
ZV9ieV9kcml2ZXIoKSdzIHJldHVybiB2YWx1ZSBpcyBub3QgY2hlY2tlZCwgaW4gY2FzZSBvZiBC
U0VDCj4+IGRyaXZlciBpcyBub3QgcHJvYmVkLCBkZXYgaXMgbm90IHNldCBhbmQgdXNlZCBqdXN0
IGFmdGVyIGFzIHBhcmFtZXRlciBvZgo+PiBtaXNjX3JlYWQoKSB3aGljaCBsZWFkcyB0byBhIFN5
bmNocm9ub3VzIEFib3J0Lgo+Pgo+PiBBZGQgdWNsYXNzX2dldF9kZXZpY2VfYnlfZHJpdmVyKCkn
cyByZXR1cm4gdmFsdWUgY2hlY2sgdG8gZml4IGl0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKgIGJv
YXJkL3N0L2NvbW1vbi9jbWRfc3Rib2FyZC5jIHwgNSArKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9ib2FyZC9zdC9jb21tb24vY21k
X3N0Ym9hcmQuYyBiL2JvYXJkL3N0L2NvbW1vbi9jbWRfc3Rib2FyZC5jCj4+IGluZGV4IGQ3NzA0
NjQ5OWEwLi41OGQ5ZjIwNWI5MiAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvc3QvY29tbW9uL2NtZF9z
dGJvYXJkLmMKPj4gKysrIGIvYm9hcmQvc3QvY29tbW9uL2NtZF9zdGJvYXJkLmMKPj4gQEAgLTky
LDYgKzkyLDExIEBAIHN0YXRpYyBpbnQgZG9fc3Rib2FyZChzdHJ1Y3QgY21kX3RibCAqY21kdHAs
IGludCBmbGFnLCBpbnQgYXJnYywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBETV9EUklWRVJfR0VUKHN0bTMybXBfYnNlYyksCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmRldik7Cj4+IMKgICvCoMKgwqAg
aWYgKHJldCkgewo+PiArwqDCoMKgwqDCoMKgwqAgcHV0cygiQ2FuJ3QgZ2V0IEJTRUMgZGV2aWNl
XG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBDTURfUkVUX0ZBSUxVUkU7Cj4+ICvCoMKg
wqAgfQo+PiArCj4+IMKgwqDCoMKgwqAgcmV0ID0gbWlzY19yZWFkKGRldiwgU1RNMzJfQlNFQ19P
VFAoQlNFQ19PVFBfQk9BUkQpLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmb3RwLCBz
aXplb2Yob3RwKSk7Cj4+IMKgCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkg
PHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IApB
cHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
