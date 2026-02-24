Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB9oJuN+nWk/QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:35:15 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F6185766
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:35:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0662C8F286;
	Tue, 24 Feb 2026 10:35:14 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 000ECC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 10:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbCNBhgexP1UxcweBuND7WhRefvJGcqs3hFKydqDYmA/eCTYC8N1pJIvJ+bZQigSO47RafmnIhHjsC1dblGpS0X8KQoBCnXSDPbkzE6c1vW4YF2WP9mvc7Pi/uVcKjLNJYdql5YbYOmRT842nTrBNYHiUxxOoCcbQD0KaZ12VRoUCNhFzuJ/4O2zaGJ5YKYS3kHI581lzcfT6ME6FT4aIl3iZrgaK7QrEe2LvOowAPvydOI9ydrn7wnpeW4ASlg8dj3nwKohv8IuD79/TZTtm8kEKA9k9KqLzokdZBmElrdF67xM/n7UvEJCCcutiz/o6SHR8Mfd86pHRaksNXUz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thl12U6fQgFwGCvDVFT+xLrsbNjzeZQPYcVaetJFn+I=;
 b=S/TRTS86KMVBhEiporupxEEgbJvKjGSknBNUaRce+19IAdEfCOtR8G0E9OrI1mHV3kQT6+7MMxlO2B3Sz4O7nazCDflDfyGWZTD6QFY8IU11vkCjYeUHCwgw/Szumw6u9veu3Y4GIe3nVeIf5AqbNmuM7Dh+mjVolsW8XoJe2m3e9Nn39cm3TTuf7/7PMSVYJfrsjVT2vInsK+JBsnw4e215DETfsE680TGJJEuOdIbBHNa8XGf4/SfYTBDl9i2W21fJyqrBF7FK/CAv9Vep5nJ8jDU6ciRLxqDvNrc9k3HJVJfRPdY+Vm6Co2Uc33COAYbYmMZvmxcqPR3z7i8VOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thl12U6fQgFwGCvDVFT+xLrsbNjzeZQPYcVaetJFn+I=;
 b=ONJPAiuJ5wmT/MA3EeB2Gc2tjeDZlF5xPQ2quypMmMxN+yQVaKxpqyoCtF/lRe513ymgL/B/0m2a6LQqdPD4K+xDXp0fFWvrxsq4srFo1fUWpqOcIoIGzmlj7FMTiUNQhODQ7ChDj7QsAfuZ7aposRvv0JqxKvAzDjIXTpUj8sXn270sIe4noxo9nJio1ekAk7z0PPDmIyEXaFRA19Xk64VAvBA71j/mH4ER0D/3hXG3cB47v/yUv+2qTWp27PnKLuzTo19SBY+qQtAyVlExDnzYUJ3xREi4ZwrcItqz0VXNFH5AyHUFBXu/w2CGCP9q1iL3jxNMWI+dZDrxZvXUWw==
Received: from DUZPR01CA0353.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::16) by PA1PR10MB9151.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:443::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 10:35:10 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::16) by DUZPR01CA0353.outlook.office365.com
 (2603:10a6:10:4b8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 10:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 10:35:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:37:03 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:34:55 +0100
Message-ID: <8890c780-53d8-4e43-a267-8215998f8b9b@foss.st.com>
Date: Tue, 24 Feb 2026 11:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
 <20260211-upstream_update_cmd_stboard-v1-1-63fd9b767bcc@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260211-upstream_update_cmd_stboard-v1-1-63fd9b767bcc@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|PA1PR10MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: d908be57-f090-4331-97d2-08de73906317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVU5Q3p3R1ZLTUYxYm83ZnBmRllzZTZSaitkSnRaSTNDSTkrYjYzT3J3dU90?=
 =?utf-8?B?azFRblpnSXJZaCtuV0NTdlpGRUZQMy8xeWs1a2xacis5RDZkamttTXBGRWd5?=
 =?utf-8?B?M29zUnd4SEFZNklKaUlQcVZuaTAzcVprMkNUaURlb0RXRUs5cytqeTdOc2dH?=
 =?utf-8?B?dEJVRk1UT0NtZVdjd3ZzdUNXdnh0UXREa2wrM3lMRUJXaDlqSEp4V0dMYWVB?=
 =?utf-8?B?NjdqVDRsMW1ES2tTWE56dVdZcThSVjNBR3ZZaDJnMGtvbGZFNVhRbzlBYVdJ?=
 =?utf-8?B?aWo2cHZLVVBEK0FjTGtCTUhTS0ZZSWlicUhGMVZEWkdCTjhWQm5BbUNkWk9H?=
 =?utf-8?B?bjZoTGwwbVFsSU1KUUEvdGVaaHFTaGVpRkZ2WlpVQlBuYktKVzlWNXU5aHlS?=
 =?utf-8?B?Z0tienE5VzNUdGhCL0FIc2hxVE0ySmxVdjdiRllwV1B4V3NHRFdwRE9HK2Vw?=
 =?utf-8?B?bDhWTjI4bXdJSDM1dlR1TWJkZWJ6L3YwQk1IeHpmVHlJSGpBWkJTS1Yyai9B?=
 =?utf-8?B?NytsN0lvY0lmLytodFVzVlVUdEpJMGdVY2FEeXJYS2ZFQUtwODFrUm8xWlo5?=
 =?utf-8?B?bDZCS04zYzR4US94VnNWRkN2Q2RoKzJ4Q1lwb29Yb2EvcUJCblZ1VVJTY29K?=
 =?utf-8?B?Y0d6VWJSclFPMVZMaU00Tzh3WWRsWjJxWERreTFCNXBSbkV1eGVKUjNGQXNG?=
 =?utf-8?B?MW9JM0Z2akJnTDNrWTZRSCtENllYQ1NwRDFkck1IaFdOVkhydWJkcmZrdkZy?=
 =?utf-8?B?dU9MOE5SZWVXN1hLV0ZJYVcvSE5kS2FhM3pYNldMVHBKZGdKSU5EazdpTDdv?=
 =?utf-8?B?NFBSN3JZUXdrek8rN2FMR3J0bmdkQTZoVkdQVnRjNjZUOERDd0liRldIR1h1?=
 =?utf-8?B?ZEpGVmlYT1lzMS9nUkZpcjBLUWtWaTI1SDZyNkFHelFzOXB4eXo2bFVoV01M?=
 =?utf-8?B?Z0NpQTEzZ0hZbTQzU0JIVWNENXhQdGFUa1lGbVFJNmZieCt0UjlXb3R1RlZT?=
 =?utf-8?B?OVRvS29OY2hZNE5iTjhEbFpNWVl2NXcwU29yZkJVUWxZZW5VTld4WUZWbVFw?=
 =?utf-8?B?RjhQa2puRWs4aFJGbGNtdWRsSnBXVmNEUDF1VEh3bU9Hbkowd1JpcUVxeEJm?=
 =?utf-8?B?a3NFWlhDTHBRblY0c2krK1dQbWhRcnI5R2QzNnJXVWtlUVdpNE03Z3I0RGpT?=
 =?utf-8?B?VUNMOXRaYXhkU3h1VWtKTXZNU1pRSEF3YXBHbHBTOGxtbU1ISTh6cmdZQWw0?=
 =?utf-8?B?bkhIYkd5Mm9nVVNOV0wxNExBNXhmc3QzUytSQjhiQXdMY3FPS2p3RGJnNGpK?=
 =?utf-8?B?K1FreXJNTytjMjNHRmVNUFFzallGcmMvcmZ1RjM1YSs2bEkrTTdWTnA5YW0x?=
 =?utf-8?B?ZXE0SkNmTlF3bGV4L1lWUzVuMVRYTkg0TkducFRmS0FyVlRGRlN3K3pnNVdy?=
 =?utf-8?B?bTV3VEQ3RWIzRHpmaXd4OFptOGFKMmxOSzF5ODloTjJqWmp5b2Jhc1pVK3Nh?=
 =?utf-8?B?cGtScHRFRVRLZWp2VEpYWkk1Z0RBK05xdHBWZGV5clV6UWNrSDNWREM5L3Ja?=
 =?utf-8?B?bUFIVm1STTE4bHYzVnU4dmcyaUpaOUZpVnRRWDNBR3RKK3YvQ1g0cFFIVFJU?=
 =?utf-8?B?ZWdobmkyeVIvRTlwWmdrVUJORTV1UC9Md0IwRzhLMUhUMGJxUUczVFcydTND?=
 =?utf-8?B?YVVkWlVyY2I3ckZWMjdZUzliQzN3WDQvTEkyS2hJVk1CL3hQWXhGeUNuVzl2?=
 =?utf-8?B?dTFrbVhGY0RVZE94b2ZoQkIrbEJwT3BMeUFCeDJRYkpLcUtsQmxwTDJLWE5w?=
 =?utf-8?B?YmdDN0Ntc21RTE53b1FmRXBBUlMyTThXZVMyanlyK3k3S1NpTlNyTlUxMDRy?=
 =?utf-8?B?R2NLSkM3UStlYU5NRTUzd1hOazd5OWxNMDRSb0c1OGRsbTBlTWZURFVGWFd1?=
 =?utf-8?B?WS9GRUhyeGVUV2tUQlZpVnREMVd6a0xSQk1YV2FYa2ZVWm9lMkVOKysvZENz?=
 =?utf-8?B?YXd6clBLQmdzVmJpbHNCT2U0OHc1blhFMGhNMFo0UlhvcU1UdzkzOEdjZ3I3?=
 =?utf-8?B?ZkE5RUI0SmExTGo1V2ZWQTdkTkl4Yk92cWNiaTc0Z0U5MmVnbXkzWHNSdG45?=
 =?utf-8?B?UEVkc2J1Z1d3RTh1OFdGRXZxSWJjSWwrWVgxS3A1OFlSdSszelczMm96cm1z?=
 =?utf-8?B?alNDNEpCUkdDbW1la2lFSWhNTktYSGlYWkpNazVzYVVIYnZKL0xPK0Y5S0hE?=
 =?utf-8?B?UGtkRzNTUUxSSFhsUkJ1eE5Eemx3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N2qdp717cb58dsckVYn8GIgyn4/LvINtLO4oqGW6QzC2DseguIar5sEPDkM7k2MWcucP8Ag7FYnfTDL73tv+rzspHQh6oNMwdIEGKcWjgUZAFyngT9TxcFT5ZD53tXekJx7q0QdYn1OYE9uTXHxsx2NaiaiDpOh10sZJlKDaDz0/Glr+/iNTuMBziM6sAkYBE+cRKlkN3ciXLfBBq0/JuVlhXpgtTxwXaidncX8rkRq36hsKPxHqV1ooxIPrcVd9YW6sKTvKuAj3F5qQfdWihdazc+4P3JChsCF24Y+ZVOJgZmdw6Ru7foOBs0elD6pfRjyiJwUtTOOur7xjvWTjLMd9mgEcsRlo+b4Xe+Xt/oG1yajF9CtMi8KMmxPhTmz3GQNrD5tJLD/Wywzb8VmQDCIZ8ZHmiU4sJpfJgNC27f0r+dZUbfxFGLA9c3blpmte
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:35:10.6989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d908be57-f090-4331-97d2-08de73906317
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9151
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: st: common: Add support of
 stm32mp21xx-dk board
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_HAM(-0.00)[-0.851];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 596F6185766
X-Rspamd-Action: no action

Hi,

On 2/11/26 15:32, Patrice Chotard wrote:
> Add board identifier for STM32MP21 discovery board = MB2059.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   board/st/common/cmd_stboard.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index b9d0abdba7d..d77046499a0 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -51,6 +51,7 @@ static bool check_stboard(u16 board)
>   		0x1605, /* stm32mp25xx-dk */
>   		0x1635,
>   		0x1936, /* stm32mp25xx-ev1 */
> +		0x2059, /* stm32mp21xx-dk */
>   	};
>   
>   	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
