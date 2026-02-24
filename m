Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNgWFsqfnWlrQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 13:55:38 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF62187465
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 13:55:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67EEAC8F286;
	Tue, 24 Feb 2026 12:55:37 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98B3EC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 12:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8Dlf6qdJ9Iug6TyDOy2RkpObcwN3sWdXRhNoCLFWieG40V5sa6w7SaK6UjrXWukkxZmOYdXCaDcUZ4+sotF52Wm9e357OuoZ2/gIYMGjb+OH+Bp6zREyfXf85KJbTMDCBOdfAPjDREtQYFxMlpAtph+g3wN5jZtu6kOCJ2eAyoqNBmTIQn2pnoGJFrEzFVSE4GMWkJxxdTBda0eulVgk4XEk6YGN0rOYFC+joVLJHAy0c85Q+iHpdXS+afK3EiBNcHIdrUxsQoHW8qQwhCXAmvf9q7mOnLNerhuvhC4t1D++fITR+mjBgb8LkaooTMgHKppJyuhUHVBy/ANwUiguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVZjPc8uQdpJK/iw9zBUHEICIlo0l1zDrKz2qdI/dAI=;
 b=wmYvj2LLgIiOT4rZ3On2228857/ZrG0jFgGfeBhjzwh4t5k4U7GQFcOgtj3Aorc3uQOZbjA5Ma9z1zv16NIZKAKByv4ptunSe6HTlSKlQVVLXLICFjUM8C9izeQZmCIWie/SYDqFcF+/vcpdLO32s2ZaeryBytuP4a09qnwXs7VZTyZsmMP332L/k+eIY4KQvfW37RAD1SjOPZc++FPgplM84VlEUbwu5lU0g/L0u9k50hPzJ7ZsUuqd1eQDruoA98HFmHkwS3hv0t1gJNqvBhtDKwlP/W4nstzkLATYRFyqQRIcvTduXgshsDZluxVLqOvNl02rxTVQoo1PBXT+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVZjPc8uQdpJK/iw9zBUHEICIlo0l1zDrKz2qdI/dAI=;
 b=V3NidPTMXR5BKxIEpPfUaEarD0l1uJEpgkREJvLwleOGynMTc0Y8BsFg/Qv4RdCJnHZKXLBQYZGSVfbzQQ954YGEdBRAszpD7QJmcJxBFC9Ap4g7ZPfgW5orqpEcfFKrgnWOwOLxU45Ez6EmrvPqe6B6z/cQKy5BmNFab7XGm02YGSYx8UFekDG/BTs3HTsDjXNk8Dx/XLbx+WsxD6Ri2TCjcfbL0BspQ+pJ5V51yQc4i7Qdf1Qf13EnZM+7NJ+oxKfCAFLXNF57WPco2IsIi1pdE+cH7GVvJxq6Hk4cftwQbDT4e063zTakOAvh1u+57gAjZbc6wc8bDfvN03qW9g==
Received: from DUZPR01CA0339.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::17) by DU0PR10MB5171.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:343::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 12:55:32 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::ab) by DUZPR01CA0339.outlook.office365.com
 (2603:10a6:10:4b8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 12:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 12:55:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 13:57:48 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 13:55:31 +0100
Message-ID: <06745e64-828e-4dee-817b-fed654448f0a@foss.st.com>
Date: Tue, 24 Feb 2026 13:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
 <20260204-upstream_factorize_and_update_read_idc-v2-1-7f0baa41d2f1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v2-1-7f0baa41d2f1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DU0PR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: ab90571a-faf1-4af8-a2c9-08de73a3fea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGpIYXdlWWl6cm1ybHlXWlZDQkxFOHdkVERCb3BmaU9XUU9tcERQMDFhQWhE?=
 =?utf-8?B?K3BpbCt4b3dtdXdCTU1tRkczclBQdDhrNDE2V3h4Ri9iU1o3L1VQc3hmNHVR?=
 =?utf-8?B?Zm1TT2xEUXkvWlhhb2lMVVF5WE9RQytJRmdWSG5IQWZKVTF3bEE5NTAwcGtI?=
 =?utf-8?B?UnJzUElNMlBPQkZKbWZ0Z2VHWUJ4a1hWMWFXeGZrWW5IL2NPMksyaUNrcXdX?=
 =?utf-8?B?aGthUWV6ZDFIbU9ZbjVaSCtQOFhtbFhmb28wekc5YlRhQmE2NXo2NFY2Z24z?=
 =?utf-8?B?ZjFxMnV4TDVzamc1OURJOElJNit2UVNuc05BR2xHSGZ2d1FTVGFpejMzRHJw?=
 =?utf-8?B?bVRwQXRJa28veXh6NkFDSmV1bW1aN2ZxTWM2bGlaM2twUDNhTU10bW04NzEw?=
 =?utf-8?B?Mjl0bTRvWVQvQXJHeURTeEI1dGs3M0d4Q1VmZFRETzcrNEJld1hac3pNaTI3?=
 =?utf-8?B?dVphQ2RaSWxnUGFHYlhtT2xtdFRWWUM4MmFKY2VkSERsV1FKMkJaOWk0Q3hp?=
 =?utf-8?B?VGppS0ZNRm9vTkw0eXJTRE0wS1ZGdWlVUXQrVHNwaVBYbStsdXhJNkVyQU9P?=
 =?utf-8?B?YUQwTDBrNEJKNWdzdVEyWlRnbnAwdTdXdjF2a2tXZXV5OENJQjk2QkhCT0tN?=
 =?utf-8?B?aHVYd255QzRHajlTSnl3OTJ1UEpMTUJxdjl3d01wVnBTSGlpTjJjK0dJU2dH?=
 =?utf-8?B?YWhsV2UyZXhuS3dvS0RaZTIwUGFML1YzdGxNcFh3bTRFZm54RGMvbmlWaW5h?=
 =?utf-8?B?dWQwQXIwTkRoYnlSU1RLZHF4OUJ4clFEamRZQUZBWWsyTCszeGRvLytyM2Vo?=
 =?utf-8?B?OHFjektDRjdKSXJjM3BiUHg2UGFjUmdnN3REdExNOVBQdndCblpxU0ZTZmx1?=
 =?utf-8?B?bDZuSlQvZnhHOHlIcG9Ua3ozQjExUGtpUUQ0YlJnWG41YWMwRVZOcHltZHo0?=
 =?utf-8?B?UWUvNEpmb0ZrSmVzMmlYMVBhTGY0VDhwU3pMd2ZaY1N2VUtCN0tkYWcxeXhI?=
 =?utf-8?B?Tnd0TEFWZ2txSXUreTRUYi9VS1dXL296VTFMZmhCYUcwRlZvM1hRUVZMK0t5?=
 =?utf-8?B?QVN0Z1V1RU9Lb3ZxazFzYzZuYXdCM0xHUUltVkp4eHdhSFZUbXVMdFlMY0hG?=
 =?utf-8?B?TWZTd21YUU11SmFVemJWUXRTL1ZicTRPajFGemhlRXVQY29UaXMxOGZNWEtB?=
 =?utf-8?B?SGhjaXZSUU1QUisxaC83RlJYRkJYOWloM1htNlE5UnVISERzSXBpb1dzS0xD?=
 =?utf-8?B?TDJURHBEWjBIZzErd0RLa2RPSnVDTk1CYmNTcEFVZk1uVnNJN2s5d3JmTEJI?=
 =?utf-8?B?MCtUZ2pKN1NadjdEYmI2dG5Ob25zRmR6M25qd1hNcUY3b0RzYnIrYjdDWFNY?=
 =?utf-8?B?TlZ2L3BVUnRqVmJTenZ2bk1FcU8ra1hzUlhwdGp4dVl0SnVNZXQvbTZlSUdM?=
 =?utf-8?B?MGJpb1BmZUZEbmQzRHdVMHBkbUE3YUYwUGNGb1JTU3VHcnZ2ZUw0U0llLzhC?=
 =?utf-8?B?dlJpQlM5Ynd4Y3VIZVJBY0EyOTVPVGdvUW5zZm1ldXdkdTcvNWowS0wxVzFW?=
 =?utf-8?B?L2tvWUlDT29zSzY2Q2VtS1BMMEhvVHBveHJEUVQrZ3Fnclo0QkZuUTloMkNY?=
 =?utf-8?B?NHgxanZyUy90U2haMVZ2MVVjWVNaSndVUnB1bkNkb2M1YmhORWordkV3R0d6?=
 =?utf-8?B?QXRvU3RlaVZRZW9WVm1YNVhUc0FBOHlIa2ZDVU1yN2FOVWo2NGE3cWpoTWo3?=
 =?utf-8?B?NmJCSjY1dEFFeVlsbUlaeUZZRGhjVXZXUGFid0N4bGFHSXNrUkdZeWJ6cWg2?=
 =?utf-8?B?YjIvckE4ZDZ6bTkwK0dYaGpzZlRHMnVEbzFOVVUzdzNoSGhZSWpIS2pkQncy?=
 =?utf-8?B?VTFTblYrZHc4Z0UvUkcrUGpXaC9xT0RhdkViSTI0ODZ4QmU3NzBGeUhvVTFq?=
 =?utf-8?B?NndIb2ZjZ1M2aHlmNGJTN04rZmdHT0ZuNFQ3S2EvNWdEQ2VMR0NEaXpTRXFz?=
 =?utf-8?B?NFBIVVZuS2ZlZE96ZlNtVnM3NHBzN2Vub3ErNkRGOWFaODZ3TWJORklrUTBN?=
 =?utf-8?B?SHdFT1pXNVVvMzU4by96VU9FWDlSQk1rNldTWStJOWZPaktMT2ozVkt6UjVL?=
 =?utf-8?B?RXRlb2ZPdk85bmhwZU5TREJmWTZxcUlOK3A2R3ZWeTFSaXpKQm9LTWZFY3U3?=
 =?utf-8?B?RW03RHhGRFFZbFB0dGxNdVYzN2l5SXZQTWFva24zS0VmSzY0amJGVjd1djFO?=
 =?utf-8?B?QWNySkEyK2VuWUtjQXRpUXdOZWVBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6xOG0xChBD0qYCRYKIhghT4o+f1TV0e6qvY05xiaq/tSkm5bjk36/CvVpJVe2CnIGZwSGxxpp2mdN79CaT0a73o25b68oEz4Jh+iutcbIXBJtgV9N+ex+KtWXZnbQLKN3Shd5WulzzaL2H0vsLArf3neyMU46QYg0QOy3YizufMf7hTT2KIqUdRqVOt3CcnLyyr7hwqgKzLfJw3NNoMSRQHDrFn8H/fW4Yqu/IRahY5nEWz8Ph3WIH7MzBgRg0xy16R+O7Nww1uQW3pLMXQASzgWRZgYbvMQFBR0VMrmdlTIEhvOWRfaEvy+gIzBwF1iNSxbxjbVW23uKYAFj3fAAPl9gYKgNszttF9fJt5RzV/gJ2r8gvOEH7yYjYRyWMQRQwwC7jonj96wHGHx5iCgsTHa4dgJKDY8iccQMNZFRCXWuh1RiQSxlj6czJzx//0r
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:55:32.1124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab90571a-faf1-4af8-a2c9-08de73a3fea4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5171
Cc: Marek Vasut <marek.vasut@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] stm32mp2: Migrate duplicated code
	into stm32mp2x.c
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:marek.vasut@mailbox.org,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,m:md.asadullah@eds-india.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-0.851];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEF62187465
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:16, Patrice Chotard wrote:
> Same code is duplicated into stm32mp25x.c, stm32mp23x.c and stm32mp21x.c.
>
> Migrate read_deviceid(), get_cpu_dev(), get_cpu_rev(), get_cpu_type() and
> get_cpu_package() into new stm32mp2x.c.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/stm32mp2/Makefile     |  1 +
>   arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c | 44 -----------------------
>   arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c | 44 -----------------------
>   arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c | 46 ------------------------
>   arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c  | 56 +++++++++++++++++++++++++++++
>   5 files changed, 57 insertions(+), 134 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
