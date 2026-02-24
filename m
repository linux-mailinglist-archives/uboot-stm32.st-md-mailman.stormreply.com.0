Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAtVMbRrnWnhPwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:13:24 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 631B0184571
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:13:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA447C8F285;
	Tue, 24 Feb 2026 09:13:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0D31C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtWOqnOzebYbIXQUiCgSR67qD6gU8Thgv6DaQ24ssKCZvunpjqCah+uhlWZLufzRNaYmH/d+x/gCmYeadLfA2VopM/qxJprnk0C0pO7j8CBElH9B2ytrk2xnuTRZMyxVeWUA9SOUvfNPTI5j9lFWVy+OkHG5nADFFSubfnq7J00/kBLOp1sGKysVa3aq0s8fH455RTK3OL1AWIr1FTukokljfmFRRHi8ZJ5SVFMhkmEMVdyLLBUHTajKSGU7GzB+s7RG6VcUkr25i4InJEo8ChYyZfOTNtbw5pkCTrz08PrfepVLMB7Cgdb8+waZekqCRBd2peof4UIFRUJzhjmHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GHXd1JsQltbfET9NdEomt7Uhvl2yyDpGeLO47psHUo=;
 b=EGLcUG1ic71LleqfmSzFfyGaYb4Qsz8okB3MS7koKNPNifmnyG7NoHyj3OTcKXZcyQF5v3hC3QKGBcmakIqoV5yHMGI+BV5Izg8kAAyxrmB6LBcz5587vB6P0bWKyC+T8UIDoP7CcAglGbICuxTl7v5l64iKG4UPBrfaDnzBLMABSH2q9zgJg91qluPcTs6QuVSaEQPoMBWJKTedhFXGnApGxqOaXh6U8/1+w4aGDLDT180YvOZJsPL9+mjPOxgWxTIxcZAzcjE+d8gh8PbbHtQ80Gg5RGAnk0LyZsnvsSrTMrINarx5aX2KfkhLqD6+snM2omk6UeU6fY+Qqri/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GHXd1JsQltbfET9NdEomt7Uhvl2yyDpGeLO47psHUo=;
 b=Yq/amlSQf4irHBfeeBYNy5G8Qu2uOZJQiuTpMc6lyAGsFWLUwrRWSRPdzsQobKKKObkFOcHFQAJWDKlIh+KNZGlQqZIeUBjRBtR6iyIkF6NyVlVFj8g6XsoMCcVNCf/Ino0NDvgPMtdGUg/m5cV7+dONGsyOswoN3Dwc5Zv9AxfUOZJY3ewL13rr3Cz7ZcGZUBzfQyKq5mNQbvqzmUuCrDzUsiYBACeguiKxJVhB7w6GwD6YXBT1p+JrSzV4lLNZm7QdxrK9tokn6qLsw5T4nZwxQxqjKgwA4RcRwLUsUTDzRxx2G4C/D9aEStvyfiwYipJqpKzct++XNhhex9yqrw==
Received: from DUZPR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::17) by VI1PR10MB8086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:1da::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:13:19 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::b6) by DUZPR01CA0023.outlook.office365.com
 (2603:10a6:10:46b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:13:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:15:25 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:13:17 +0100
Message-ID: <3018e618-a28d-459f-b77e-4a0f37d369d3@foss.st.com>
Date: Tue, 24 Feb 2026 10:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-2-d95374395840@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-2-d95374395840@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|VI1PR10MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5cf3eb-6eee-4e95-2f1d-08de7384f387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d05PaFNWWndDeFZROHpKZGxSOUQ5Ykk1aFhLMHBHL0JvNUxBT0I2Vkg2VXpn?=
 =?utf-8?B?Z0ZIWDhzVXFYMXNGZnVETzQ1MEsxQXFjRjZKRmJqQlR1ZUlVUmhqR1o2MXhR?=
 =?utf-8?B?WEcvaFRCQmhvMWlicEdTOHlYc2VEOUZBV1ZUWTV1UzJnYjNXNXYzUnR4Rkhq?=
 =?utf-8?B?bVp6aWluQmM1dUN0T2ErUUpyYXBUSE1LRHN2Rk9VbWRvMUx6NG9HQW53RXNs?=
 =?utf-8?B?VVdYMmordmFNN1ZCdlFDNzl0YkJ0YS94QUFxK1R6VnFwTmRKaDhxT1p2UUcx?=
 =?utf-8?B?WHdQR3ZMd1VsL0tzcHQ4QzlIWDVxNUJJQ2diYmU3UXd0Z2RxbTdjSDVZa2ZE?=
 =?utf-8?B?eXo4c3hPL2hzYVNHWm13T0FEcyt2NzVJc0xBV1RLM3JRQW9pc3BacEtzaGhL?=
 =?utf-8?B?K3dlbnlOeCsrb3Z0cW1zNWorTE1INC9EWnB4VW5PcW5CZHE0RDY2SEFZZ2Zi?=
 =?utf-8?B?aDJ5dmR4ZmtiOFJZem9FSk1wb0ZsZWdmalhjT1dvM2dpcWlVd1l0UGcvdEFX?=
 =?utf-8?B?eU53SnU3N08wMjlzbUZyRWluMU9wK0diemlSWm94M0dDTklRNVNxRWxaNXAx?=
 =?utf-8?B?c21ZWjFEenJhYkEvNFdEOHhpSS9PamVXd3NWbzJlNXVLbFo1NGNKVTZaUnl1?=
 =?utf-8?B?Y1BhcUpKeXJlbU50b3J5eGo1VEhvcmR0ZmRaSnN4WHluOG53RGcvZ0ZOVUZj?=
 =?utf-8?B?dFZDS1ZGSGUxRHpCZXVFN09ETnVrQ2tnOTk4QTNlRTIxd0ZOby9jb3RkbWsv?=
 =?utf-8?B?M0tKcllVQi9jelpHNVRyYlI5SlBwTkxSakhmV2w0ZzhHa2hHejlHeUQ5TWRS?=
 =?utf-8?B?YkNJdjl1Nnp5amdJcW1wTVg1UUljNzdsbW5iSnFCVDE1SURZNEZReE9KSmRZ?=
 =?utf-8?B?Q1I5QzU1NDdwWmxvbTk5MFlWZnNUdTd5eVgrZVhHMTY4cEtUOE41ZC9wZTRz?=
 =?utf-8?B?NmpiVDBJOEt3VlNCRWRhUy85dFdwU2YxQXE2SmpiMitqZW54QjRzZDdPeTVi?=
 =?utf-8?B?MVFuNDRpMyt1SEoxeStCZUtwY0Vxd3dhRmVMVE9VMDV4TXFvOVNvSGc1R21n?=
 =?utf-8?B?RkVZWWVMbHdDQUw2VHQ2VVJEcGphT3V2VUxZeUVCWTl2bkRQUjdZenVzT1ZB?=
 =?utf-8?B?QTlCWjBRNzBUUjB2aXRIbnBoRXc5M21ZaDdCcnBJNFBFY1BJeFRLVnAyR3lM?=
 =?utf-8?B?ZU5NVzBZUS8xWGpNa1M3Tkpyb01ibzJLZTJ1SFdIUXRpa2laYmlPOGVqbHo4?=
 =?utf-8?B?TzVjWEEwYlF4ZElNMEdaSXdhTWRrOVcwSlRyUExlWUw4ZVVpL294NmhVeHYw?=
 =?utf-8?B?VlppSkJWcXVQeURqS1phb0RUVkZmSzNkQTl6RlNmaDNPcXdGNlppRCt3N1Z3?=
 =?utf-8?B?ekRrYzRsUTV0aVorUU1VVDZ1cGZPSUxiNjZRRkZJbTZ1dThENThpUWVYZ2t6?=
 =?utf-8?B?Y0hMdWNheVp5bWJsdmh2VjBrdFNwT0JmMWF4WG11UXprSEV5d3AyaFZSczNs?=
 =?utf-8?B?OXJEcHRFajV1cmJVYmxsd2J1MXA4ZldCbkl4SCtZV0lrVWZlZk1Nbm55TFdK?=
 =?utf-8?B?aGEzS2cwdFZBeDZ5MXBpOWczWXAwMjdLR3VHZ1NNRnJqRU5RaXl6dDN6WHJU?=
 =?utf-8?B?SmZZdmcxQ2gxU2tXQ1ZvTDRoN1R3eE9GYUVjL09XRXNjVkp1NVB1Wmx0d2dO?=
 =?utf-8?B?emVxS3VJcTIwdGUxVDJqNTJRYjZOOExZK3MzYy9tcUpHOUJQQnpTdjNSMGpt?=
 =?utf-8?B?MXlMYnpYVGprV29pdHpBeDBYcUw0a0NsS0NOUVQ1WEk1M1I0YjJuM0dsMDNF?=
 =?utf-8?B?OVdwN092N215NU5uRGx0YTE0Y1IzS3FOZmtoaDc0T2VpVWRJYllXMnZFWFA3?=
 =?utf-8?B?TmFHbmIyZHQ5eHd4akJtejJ4eVNHRUZlTmdENzdUZXdJb05abUJyQ24wWFBV?=
 =?utf-8?B?RUMrcEhPOFRiT3ZrRmxPdTVITVFQeVUxbHkveWRodVZxTk83KzZWVFhZWENq?=
 =?utf-8?B?amJXVlVEWDJqVk5keWhlK2RrNDNxdHNYNkV4ZVI4dVZZbVZDWE4xUDd3ZjJy?=
 =?utf-8?B?ZXpZVEtya2E1aUVzWlBnNThZOXIxUFNENS9zVW90ZEUxdEtLSDhCQjJuc1RH?=
 =?utf-8?B?RGRrQWFwNERGNFhlTSs4cHcvam04MFNRK0pRelVZbEZBV1pSd3JEb1B4MnY4?=
 =?utf-8?B?S2g1ajJRQmRoK0xkRHNzS3AzbERnaVBsYU0zRkNjNitnaTdZc212cjBnRzI5?=
 =?utf-8?B?bDhxNUhFc3p6MlZKOTVvZkpMNE1RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SDs2uKDA1Xf90avz9BYpua3/Yt8GEaSVYKgP83l6hrORmCAx//0d2/ljt1bYoNuZDUL5KZHuwMKHVd7jh+2BqyJ8+bYKc5S9eowmNaQGioelsZ5pOGmA+HVHSLVgDv9zBwTu3mzIDfvnTvY0J7qEb7m5onhXyPHf+ZlFok4HMtj7ePQ2yxArnHf4AYFxLEldDueWUNGF5SId4a/B2E9bvGe42za+CQIdb9vbwAGKHo5MDsEww/rFlN+hr3l9FdzdgprId8k+t8GX0YIebIBGJZxNofQts47T4bseNI2UnCCmoIQmgSp7krXzLaTo37W4CDciu4zM00LM2T9nJQVF+9kvFJ3Png6JFwWTZb5EJuvcBVLoL7iSF0vm34SFPBOOnjU02uXn1PFymmUmXGYIrYTmsgBy30Yqd70i9ElZfDxK32WbIzQpl+k2qxg3oNc3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:13:19.0627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5cf3eb-6eee-4e95-2f1d-08de7384f387
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8086
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] stm32mp: cmd_stm32key: add support of
 OTP key format 2
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:gwenael.treuveur@foss.st.com,m:nicolas.le.bayon@st.com,m:cheick.traore@foss.st.com,m:lionel.debieve@foss.st.com,m:yannick.fertre@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,st.com:email,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 631B0184571
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:20, Patrice Chotard wrote:
> From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
>
> Add support of OTP key format 2 used by OP-TEE.
> Key formats are describes in the STM32MPUs references manuals
> section OTP mapping.
>
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 35 +++++++++++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
