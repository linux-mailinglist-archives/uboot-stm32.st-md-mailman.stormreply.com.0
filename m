Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODcSATX3gmlVfwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:25 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4CE2BB9
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE049C87ECA;
	Wed,  4 Feb 2026 07:37:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011011.outbound.protection.outlook.com
 [40.107.130.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F30BC87EC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 07:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxz25X0Wtv/czC/L1kYO5Luu/1uOcFcDryUiBEKwee07HfZNbK/eB9hMPL/3F2D6E5Rm9y9f0QWC3adq455HXOxCBw6X7sLmZDb2F+y7gSUZG3X+w4q/GV9SbnqkW+i7Ny1oaECPcUcDjjA2xthnAdh05YvIPbJklNFaDn/bo66lE+H7jomhz9Q7UWY0dfKg6xU4XO8acrznjSvveVgDDBETlcXHkUhVnXMV2m5EB4LI+NjuwT/UegoRFnwqR46nA0tS5YhDd1/0BGDqI1DyWgEZUHUQYoPwSJjD7XcSH1iFUfX5aa8PsTEBJfTR8Vm3jS72rah1aRN1ByhWge5+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc0Wohsu6N1h1MBrfkqMu12nCjSpJ8PdXUyyT0Cj3XI=;
 b=epEOAxSgf0y02HtKOSj56mYwMjDAomIdofRLAwJdBIEYXMi/kNZGpyNOLPfmDGfUfDvlG3Ja/a6Wxzy4bVtZgdqlIhjsbn0UT+AH1y1Siyk2FTzinhGMMqgybkYbkuXcESEUrFotfiKmQLqyTmSxoEjE7yJjXOXQZ4Cyk1B2Oz7fNkJm6un9MOluJTIQ+XTiFGYT07VKteLzdKseO3xeoW949nWOf6a4NxUoNTxUJ9hGc0VQliJ8MCAUaW8/Z2JNH4KtddbJeZ6onN+JmtlI1dOSR1xIXmkwXo/dKFvzeLIbnHCb1sBEl/K+wS9J+2rG6QLEwc+X7AJmq5qfAJh84Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=eds-india.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc0Wohsu6N1h1MBrfkqMu12nCjSpJ8PdXUyyT0Cj3XI=;
 b=ZSOYflgNjpMH/06ztid6l7yAdWlGgUPAEbNXTeqSx1Y2aTY3fbTfV0kc3oBoQy5xbSi71x3vrFgzGOvPcTzMldZ3svMDrPloiFvPnMXDfLMa5/OxTDrs5FPoQ4u6kz6bF9Ht95MJZOxl78OFxRErcmAXyqGlKe41Rzce3riPbeQElsMrE4B8sfWDYjEWOtDVgqWzY5z4x5ENEVUFs6NFbiZRO6HNjthveGYQq7tOinLC4GOw+PS3nGm/mazAp2Hv4gZWTedosI+MpB99kc8NhFCYQQqqETHwoBdOuoJs/DIlzindggwUorq21EqiYF4NCLGDvfNWdF49DHTcRwO5Hg==
Received: from AS4P190CA0056.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::27)
 by PAWPR10MB6758.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:332::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:37:19 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::22) by AS4P190CA0056.outlook.office365.com
 (2603:10a6:20b:656::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 07:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 07:37:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:38:56 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:37:17 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 08:37:06 +0100
Message-ID: <20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACL3gmkC/2XNwW7DIAyA4VeJOA8JCElDXmWqkMGm40DCgFTTq
 r77WHvoocfftvzdWKUSqbJ1uLFC11jjvvWQHwPzX7BdiEfszZRQs1Bi5EeurRAkG8C3vcRfsrC
 hPTJCI9s3aCN67oWf9OInJ83C+rNcKMSfB/R5fnah76N77Tl8cevwjgGirS2NKmUlbT1y3kvjw
 glCcdKIYNar/HccVOJ+Tym2dZjnxcgQnNRGCRoncAGCBzqZyQc9C43UT1Rg5/v9D6BP5eIKAQA
 A
X-Change-ID: 20260203-upstream_factorize_and_update_read_idc-c0c548c5b198
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|PAWPR10MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb63176-c80a-4259-f903-08de63c039ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzBQWXdBeWIyUmdINGZxSUtRcDhaaDRka2FSMFFBMU4wMmZKem9MSzQzV0tG?=
 =?utf-8?B?UitJbzR5b0IwVHRQNGdlYUJCK1paelRPZFJxbzAzbUd6ZGtqZGxRa2JCamJk?=
 =?utf-8?B?a1d3NzBQQVhQamJreGgyeTZhQjY1TUFoQ1dUR1VRTjZ2WVdJOEdldjIvTlhn?=
 =?utf-8?B?Zm4rQWxxWmxTOTY0QitadHpDejhHUi9Zd2pteUtuYU9qOHlKL0pCWUpnbU96?=
 =?utf-8?B?cUw2WDU2UEJuT2ZmLzhBWDVhUVk1TENCQnY3M3gzbFhHZmo1UHY3Q3h6d3lQ?=
 =?utf-8?B?ZlNHS3c3andEUi91WjRiSkxwSVU0cm5kdmFTQUZCVncveVp1dUVubkwwa1J1?=
 =?utf-8?B?SHJvMjAzZS9jT0hNYmYwSUVaMjdsTHJnMXoxRmFWRUdRSVI1eFJDaTc4Q3VG?=
 =?utf-8?B?QlpDNWlYNW5qc2FlaDI3VDVBcW1LekZWcDNRb1JxT3Q4TDVicnVLRGpmYWlL?=
 =?utf-8?B?eDJ6enhYWUR3cnRKbll0SzkwbVlKWGY3VUZBeDcvbUpyWjh2UXg2Ny8rRlZO?=
 =?utf-8?B?N3pRM002aTNyRFMyRm9yYklyYzkzdU9nblBnamllZjZjRjByRmxZdytQUHVI?=
 =?utf-8?B?ZVFOVzgwT25GRjJ6b2N5QkVUWnJnOHRVb0pPdi9UZDZYWXZxSzJHME5HM24v?=
 =?utf-8?B?UjRKV0VTRmRrUlQ0b1BuZml1U1NXTnFDMUN4QUZjSUFnZXVDN0pHUnI0R3JB?=
 =?utf-8?B?eGhJQ0J1cmNNeUkvM0ZCeXBtUkQwTU9Eczh2TkRUQ053QWU2Nnc4MWFwTGJi?=
 =?utf-8?B?OC9kUXlvV1JoWW5NWVNIbG5WbkRUWGtJcFVJdjJhOUhDdURnamdVMUVUREhQ?=
 =?utf-8?B?UXlDQUNrclFGb3VhQm1pbW9adzB1V0NDckJSbG5ndCtVaXF3NFlyRVd6VitS?=
 =?utf-8?B?VDhnbmEraVcrUWVENG1hTXA4aHBwb3B6djFLa2hoRzBIYlRGRHJkVUJtZnp3?=
 =?utf-8?B?TjlPNVpxVER2cnBlVExRclluUWpyNXJudkZsZ0RjN2NjdkNkcDBNRWVCYVRs?=
 =?utf-8?B?N2VtVjRkbWZ4U1VZeXE1V0pON203VWZvRFh0S3FEMy93cWJhcG96dFBpZk9p?=
 =?utf-8?B?dVhzVDdOUkJPTUMxNGU4TkRpSm54RC9GTVBwWkhWdHVDbTdMSW1KMXpiSDFZ?=
 =?utf-8?B?MGhWcEVzN2RLKzVJYXJJdmVnWEkwQlZlTE5CZzEwNkdvR3JNWDI5R3NIZW5W?=
 =?utf-8?B?S3pmRlNZMmxrMVh4Q1VGVnVncktldjhJK1A2bE9yeDQrOUJwcmFKNElVRWNn?=
 =?utf-8?B?SEhrU1AwUmh3L1dFQ2ZOSDNsdVVxU0xkcmdaRWFxK3l0Qm9qMzJwbVdlYTVJ?=
 =?utf-8?B?cjdMN0tuc1hKYXpaZGkra1A5bHFaa2dGa0F4WGc5VkNkUHp2SG5KQitGREpv?=
 =?utf-8?B?ZDRncWxrenRlbnlySzFMY1lFYXRsWi8rNi9QQjZuTHh3emZ5ZzdxWllUYUti?=
 =?utf-8?B?ajFScmZYWkdYN2dtakRkUUhIaVpjbE8yUGRnKzJrdGh0YlFUbzRHMDA5OW5k?=
 =?utf-8?B?Ym8xY1RMRVBRWE12YVVMSHIxT1RjbU9jazJjamtBZmtKYzgzMHVOcGZxWGlZ?=
 =?utf-8?B?bFdXZ1EwWHp1ZTAzTWsyTWt3d29QWWpvNWRGRUFBKy95bGRZdVRmczZaalRL?=
 =?utf-8?B?NUdIaXZ1SDE0ZUh5TWk0R3Q1YXVVdEdkUElNVjRTYUs1VmNMN2ZIaWdDcytJ?=
 =?utf-8?B?TUlYUDUwZklOVStsQUFSU084UGRhRVAybUlKaldyOEF4aTBYZDZZOGtiT2tE?=
 =?utf-8?B?S0VxWFlCZFEvR0ZoZTRoeUdlRUpvMnMyL2JpYUg0YzRuYjB6ZktXbG8vZTR1?=
 =?utf-8?B?UTJoWm5ON1J0QWxpNWJsZDM1RlFwZzlyL2x4amxTdDhDOTg3QUo3TTNyZnJs?=
 =?utf-8?B?aFpJZTNxa3E2NFlEOWJIakZlNDRmbEtsdTdqUkN0cUg1UUFsZ0lYZURoaGxH?=
 =?utf-8?B?d1VrYnBSL2lqajBTVDh4QWJpVk82WGFXTHk5Z1JudUNTWjhuL0NGRk5UdFNj?=
 =?utf-8?B?TnpacEY1ZjNUVGlOekRXa2FiOG1LZy9OS2xSUGVucnB6QUg5eWsvcnlUWkJt?=
 =?utf-8?B?WXVwUEdCMEhId1J2eWgycGgxSnRuUE5xdnZDNnMreUsxQlVOdzA4UzhtaU51?=
 =?utf-8?B?Q1ZGWFFyNVQ2ZlBLMUZaOXZkaHN3UFRzQUdTRmptSUtTMDA4ZWpFbmFjNkht?=
 =?utf-8?B?TXlEM2tFMUQyMy9jb3d3OEpzdzRKUlk1azdkbHc1K3FCck9DenhyUzhEZXNV?=
 =?utf-8?B?bHA5SkJqT1ArT2NKaE1BR0tzV3BBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GusbHwRsPDqGndCjYWX66EiJBIZdWgPNeMye+1v4hy9BF20/ebTtqkcxIWxTHGZ1Jg0tx8hQCpap8PZFdAyppqn2EXfxV3SmNauZdBloanMi2urNOu4XxdC3shdk4JhKLtSkFBgDYwtvnhoYqLwLgbqZVllfmo01K5VSZ5PtYG+0gOZ9oVn4FMT9J1s7NL47akOCMGKQBnLrmJe4Rs4qpkreUsVoBOK97YTRAkYWgNIcoIYxKja4nKfRd7iONT50cj6j+7GbVDnX42NfYRKRMIOblBBYetmhZ/W3s4/m5Z78x0WuEeTrjLMQR59E2l7neeuXzyC4fsoV6q9+Bibsu9zRhWs5HzHtlDURC/QulJMkQXUopbXiBTYfYlGLC23FLRTTsMTkucbjX8XBWLRkbxe9PRYGEOlXA6JzqvvbsOeXl9MYX9HgjGOQroVin9iV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:37:18.9109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb63176-c80a-4259-f903-08de63c039ee
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6758
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Uboot-stm32] [PATCH 0/3] ARM: stm32mp: Factorize code for STM32MP2x
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67B4CE2BB9
X-Rspamd-Action: no action

Functions read_deviceid(), get_cpu_dev(), get_cpu_rev(), get_cpu_type()
and get_cpu_package() code are duplicated between stm32mp25x.c, 
stm32mp23x.c and stm32mp21x.c.

Migrate these functions into new stm32mp2x.c file.

Adds also a fix in read_deviceid() for STM32MP13 and STM32MP2x to avoid
a Synchronous abort.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (3):
      stm322mp2: Migrate duplicated code into stm32mp2x.c
      stm32mp2: Add check on syscon_get_first_range() return value
      stm32mp1: Add check on syscon_get_first_range() return value

 arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c |  7 ++++
 arch/arm/mach-stm32mp/stm32mp2/Makefile     |  1 +
 arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c | 44 --------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c | 44 --------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c | 46 ---------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c  | 63 +++++++++++++++++++++++++++++
 6 files changed, 71 insertions(+), 134 deletions(-)
---
base-commit: 66891ffb14920e35abfafcae795cf4604de6682f
change-id: 20260203-upstream_factorize_and_update_read_idc-c0c548c5b198
prerequisite-change-id: 20260203-upstream_add_stm32mp21_support-0b0ed074dda9:v1
prerequisite-patch-id: 74f65301011fc90379e04dd25eebdf3cb2a24fe2
prerequisite-patch-id: cd2da5c9e5f556ca492c91ff76ee91cf939d126e
prerequisite-patch-id: 2f2d9574cac61f21c1caedf11601b3b79806e5ea
prerequisite-patch-id: ee473859e76b2783f858e603f0956ed7644192b1
prerequisite-patch-id: 79f85d5f5eccc0a773f973c2234939916bb84ef1
prerequisite-patch-id: fe65a2b4f620e362d1a963b00c8c9cda5c4a85f3
prerequisite-patch-id: 37714354f2763227c1ee72d57626c36687d03fb4

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
