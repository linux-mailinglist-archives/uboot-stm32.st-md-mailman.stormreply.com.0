Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N9kOCd/nWk/QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:36:23 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56672185794
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:36:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10B88C8F286;
	Tue, 24 Feb 2026 10:36:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57AFBC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 10:36:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu17Lr07JDQUD5nUswillB/Vkdewi6CLWOZi1TbFJYqMl8lmgI4vLQdoFoAkVQgM1YLAhcDkaoeo/2Jx+AVrT947Nq+PAewc9vJpTjXy1JJEZBdUlcBamPXLx5fJCXlI2yCooStNTT7SkbFXa4Oqif/5ugsFOvfd2UKJRYKO9VGsMeLx+D0IEqdrzhBOi2kzG/cpCajSnnJ4pEFKwUTKXmr4iJ4dQIGvD1D4igNm8Ww/4cJQlAmgiRn+OhPOqjvxfYikdkGfWSENtqwmi+Xt/iWmHlu8oLqgckmCrDs+7gYR9IjhWWt1rfsC0sCjzJhiWYsB5gWp5Uq5xBg/f0AyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WM7Nihfbbna0u1v+5L4YcoRpODQGzK6UZxygtW/KuSI=;
 b=TPpY5SvhP9bjmHeNqauhAK2roRl6v38QgvNXdIXttiEu5bUz9QY1gBCpBMBh3KOJjljpZB7WAR/3cD8hcCn0fUbWU8WG4pX4iBsYyzQ5X0i0sUlAMRaoDF77yoChE61DG6TcSsr5vS/QokImn9TVKof7KlHAcTyt3Q4IgF1MfBGIn7XPRFvLbwbzlcHBJaRXqNYUOJXoZ8IIXqtYFEHHYvrNOGAIqlzXXykvc3Wi44yo4xB5kpyD0Wkvnm2seYJcUtC8mvskayFuWb7Ouih2UmDw32jmKyZ/wsyVGg8l65E2DAvSlw1DLeIX758q1fSAj8cpmFjh0AwUQxOoSZC1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WM7Nihfbbna0u1v+5L4YcoRpODQGzK6UZxygtW/KuSI=;
 b=odF0zfK0dUC/092AhmnXW+hflNqHglt+6L7udt81wMXa7Da8BOJqAwzdsBBd4ozUDn4HJPZMLWOH9vMT95tDHQXBdPDD6vMvWudQq13Yu51EummpUGbprJGT1L/J+EbLGHgLDT6yQBg6KKw4JIVSwlhgYQ+hhuddMePU7QGUV5ytmz25CHpPFddkHfrdJYqmwsONFuMagpYuXFAqSJ9eTSYKXMch5LKHMWCl817Ix++9MSucyfBR1lUBH68NC8owrhzfhXnKSMIl10i8G6onD2LfclebV4QnyP7GxlSvIGyXZiFxuVAhvHs6Lj7CUHI5FxPcRQfwEt7tRCaJOqikkw==
Received: from DUZPR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::12) by AS1PR10MB5508.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:473::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 10:36:17 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::22) by DUZPR01CA0022.outlook.office365.com
 (2603:10a6:10:46b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 10:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 10:36:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:38:23 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:36:16 +0100
Message-ID: <6197f9b7-b168-4630-9665-b11a89078ae2@foss.st.com>
Date: Tue, 24 Feb 2026 11:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
 <20260211-upstream_update_cmd_stboard-v1-2-63fd9b767bcc@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260211-upstream_update_cmd_stboard-v1-2-63fd9b767bcc@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|AS1PR10MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: cea05b8c-4caa-46c8-7efc-08de73908adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXg0MU5hNEpVWTk0RDdxTkRhRTc3eUNWMzhWV2kweUcwaWp6UkticFU1YWJt?=
 =?utf-8?B?MW5CRkVIYlRHTlA2RFRyVVpibUhPUWU2RlNBbkJ1MTBQZmQ1Q1pURkZLTldL?=
 =?utf-8?B?ek5uK0FwdkwxTUNhL2hmY2RSa1BjWEtqcmRRNXlpWTZNVTNidmtVeUtDbTRZ?=
 =?utf-8?B?OTQ0SjB2ZFA2ZGF5c3RxRHRkeHZOWVlhaGVueXpISko5bXRFa25RL09iT2Zk?=
 =?utf-8?B?ODFMb2U2d242aTFrTzBnQUpOQ0ZINjJUbE9HdFBkenowSTM2cGthNWdnYUwy?=
 =?utf-8?B?TThlM3BTUXg3WTl3RlBhZytzQzhKRmJ1R3hzdktveUxjcWhMRnBjVFpJWU1C?=
 =?utf-8?B?SzRYazZ0MXB2bzJGdHZsRlZWOUtPQWNxNU1iMysyaU5WQjNEUmhLZUhwQkZC?=
 =?utf-8?B?bytUeW1JL0liWmVza2lwdGRiSGczT1RaTThEbDRsUmxYclVPOFE0N0F1RHcv?=
 =?utf-8?B?Wi9SS0Z6UC9oNlJJbnVkRGplMTB1RUpCNDIzZ2dtR1pYb1FKM2hRM0dQRTBV?=
 =?utf-8?B?bkJJNzgvb2s2SVZBREZDVG9wbjE0aEVsbXFRbktXZ2w2Q0Z4aWFCWTFCNW9q?=
 =?utf-8?B?Ui9sRWxtK3FZZUlnaGlpNGZERHM4bWQwaDE4SkxESzZwSjJsZG96K09jY3pP?=
 =?utf-8?B?cTNJbXJmdDArSUhMeHlGR0lxbVRjeVNtMjR3RVFLVWYvc0x4ZzFPUVNaRStV?=
 =?utf-8?B?cktRb21ia3RRNHpwb0M0aWlDVkU2aENjTVFXbm9xanJoUVQrYmkyRXVyTWUx?=
 =?utf-8?B?VHNub004K0xFZ3NlT1hSUW1UTkpaNlhQcnBTTUlKWC9sMlVVbDhRdjhPTW4v?=
 =?utf-8?B?bU1JQ3dsblE3NlYvVDZMbCtaUWlsNFNjSHlmME5RTS9RWXhlbmZBb1ZrNFpH?=
 =?utf-8?B?SGdmLzdNdHFDOHVRbVFpYjhyZHFZelRqNWJVblEwUXdLUkppT3p5SGtDTXhH?=
 =?utf-8?B?N1NwS1hTRHlFZHMydVU0SCswNWpLamZDZUN2R3gwU0RPM2o0amNxUjdicnp0?=
 =?utf-8?B?U3ZNeEREeDVWRTk4cWphVnVvU1FaWTUzK1Q5d2taZ2hyRHFDeWNmNk9HTUR2?=
 =?utf-8?B?Q3I4Q3Z0T2VzZkhhK0plWHBaKzZDdW1ZanFZT1VYMnd3TjV3NkdQdTY3SHlS?=
 =?utf-8?B?Zk9QZ29PR2lTL05ya0ZDMzNEcGZkeXhRRFV1d2RYU0RTTTJkNGgwbXpLZW55?=
 =?utf-8?B?VGQwT0paVWxFdmF3czdwQWNZV1pRVzU1Z3RrRjJMUTZJNzN0TnYrWktpcmpi?=
 =?utf-8?B?c2ZTRHgyWmdqeFBoYXZFSDhLMXMzczE0WTdUSzNYRTB5Mms1ck9vQ3FMSjk1?=
 =?utf-8?B?VUJnS0Y4RjQwRTYvcmlyUHJDYnBDdHU4UmJwclI2TmFtMExvaGNITnE3TkJU?=
 =?utf-8?B?enpDRnV5VGdkSjJCUSt3Y2pMaFpBb2dnVjYybUMreFE4S3p2dFkwbHFuTkpm?=
 =?utf-8?B?WnI3bU1NOEhXMjdrbjN4SDRHalBrMFU2VmhYV0ZCeTVwekxEcmVCc2hRM2ls?=
 =?utf-8?B?OEVaOVdDU2w4T3dXUjY2UVlXcW0yQ09TTExBQ055cTQ3b0o2Y1o4ZzJIWVlR?=
 =?utf-8?B?R2ViUHp6SUZiNVhRODJEVnNnamRqd3RTZHpDTmEyNExLazhEenQzZk5DY0xS?=
 =?utf-8?B?UElFWHduT01JMWZWTVRObE11Vk1RbTQya2lZbCtqb3FHS0tGK3k4Q0g1MXZK?=
 =?utf-8?B?RG5vTTJIT29XN0hJeHlGZ0kxcU1HdGRLNWNWNVJDUGNWRHM0QkUzTVpoblRW?=
 =?utf-8?B?SDNaWW9VekxFd01Kc0FVY2lkamQzMjdJeis5Q1dUUkt0NDJYcGxPQ0VZK1Jm?=
 =?utf-8?B?SWs4ajBTVG9rZFJCa2MzMVpYYXZPcmk3bWV4a1JVQlpUblhwVG5pVUNPbGNC?=
 =?utf-8?B?MWNqMXVyWGhxazhXSkMwYjBieXFuN0QwQ2oyQmpkQ0ZtelhCcWIwMmZ0eGp1?=
 =?utf-8?B?MkdBNndtQ3hlOEZjc05STUJFNnN5a0hNZERHQnJvWlZYY05zYkFnbHlwMnl4?=
 =?utf-8?B?enR1VFRDUXBLSjRDV1pPY1BocnNDYklFV01oWWNIZ3AvazZnMGdSRktYMUNN?=
 =?utf-8?B?QTVuM1ZVelNhMXRsTkVrQWxpV2xKZUZnTEJjdWR2cTc5UUNIZlh0elkvcmYy?=
 =?utf-8?B?WkRucGY0MkZ4RWVDQVZkSUxMVzFLR2E0Zk0yc29lRnlPb3JHZkpRbVY2Y01i?=
 =?utf-8?B?QTZNTk1tSHAydncxU0pZcWFONmFMVHlNc2lQMzVuR3QxSUVFdTRvOVlpVGJO?=
 =?utf-8?B?NDFZRDM3LzJ2dGdMRC9wY2ErN09BPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3Q9Ma/oYzeamX0Ec9uEHimBp7S4PWriyHOYnhcfzb2IHfvDJec8c65GyE71s8ph/A4ga1ArmVZdUPpQnnzcwo47s8SiVov3TY6SwZlQF+cgSCpQ4VRT9X3wBg8hd5PL7lSb8ohgWyzseVAgf0suo1qQnHCfh1z5eJisMlXFHlUFe+7Qb+OFjknEKjbVHIiP1qdJ0Sqc6DuJ17uPAL+cauVwIAKejRvoUCF6gdxrc8jiyuvdduCmqW8HR38DWTaTW4suYs0t8d5A24L5Vy5L+YGPO0psT0YHdBwbCx+zrRHSvJQFTcG9MR8YgHnyQBQ5P+WWpxJtSbfoJjP0lnanH6L+l0+mfePs54n0+MLBZayCdZoySF25a6zVdUuEz7oqksGP+Wq+YRCa2rNUWRaUa3x/iEpSctWBzEpdZeOSav5Br6E/+S7m4uP+Tf/cH36NV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:36:17.4277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea05b8c-4caa-46c8-7efc-08de73908adc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5508
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.811];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56672185794
X-Rspamd-Action: no action

Hi,

On 2/11/26 15:32, Patrice Chotard wrote:
> class_get_device_by_driver()'s return value is not checked, in case of BSEC
> driver is not probed, dev is not set and used just after as parameter of
> misc_read() which leads to a Synchronous Abort.
>
> Add uclass_get_device_by_driver()'s return value check to fix it.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   board/st/common/cmd_stboard.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index d77046499a0..58d9f205b92 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -92,6 +92,11 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>   					  DM_DRIVER_GET(stm32mp_bsec),
>   					  &dev);
>   
> +	if (ret) {
> +		puts("Can't get BSEC device\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
>   	ret = misc_read(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
>   			&otp, sizeof(otp));
>   
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
