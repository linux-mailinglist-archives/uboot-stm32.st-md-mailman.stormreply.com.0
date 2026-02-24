Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O9TOGSmnWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:48 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FC187989
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 427EBC8F288;
	Tue, 24 Feb 2026 13:23:48 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34982C8F287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbT6KAgwrxJaJkh06BUWQAtp0QcoG4j+QfjX1L3QXpQQvRZ9Zr03WkoRyeJOLnawx3ZJjrhvu6SfEz0449WKbEZXjTxV5JO/pzwDEc4H92RnUNNFaslx+Z/PcjBT+rDroLh27Fgh7wPJcFzGq/lL7Gy6AVYLpqrtuSFm+8bSn1aeev+VX7V3SjQI+1t/oCiU8hLudOJieQ9PGNxAXxJPYKBzRuY1r+kKjYPIu9ElC5Rg1IIXkN2IdmSUC19pxozcGYl+Pd529ays1jr/BvgHjsMlrkQlf1DufTrYxLC3Y8tzFL5AjrDrsJpom18fO5bqSTKZKrobgnHCx3rk6G3tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZL8ay2QYsZOxHDD5y62KQ1xioorNgMABMthMUsIZko=;
 b=fyDTP5i8HbjAASsTeNMT0mCpxDvOprC9FYyj1DDhJWmNUEXRh9yaYtNFeYAWoDSoaGdc8ZVdoMTObxtvX/AxcvKvgyy3zZEtVv5dFFoFV5xpVQCYH6DkMJhUicjy2DxWLNso/3gvksw4UHBKvOUxob1u+kEqzJVF13FBr2OwpWxLtXyE2Uc1d/s5n4SO5E9svP1f4Qizv65ChxM1DJKJeCYr2s+iziWzlnT4mCwc/Z0mQRw0i96Dlj/7cqTXmb+0yNmtasx3oW2ap+cYyGXD9jZOktLu0T1RM1wQ8b7XdaiRpDik560oT0mdhwA65D7UxhsvQ92RbRrbOcqcWxAKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZL8ay2QYsZOxHDD5y62KQ1xioorNgMABMthMUsIZko=;
 b=e7m4gYhrGzh7sQCKTUgihJkyV9OS/mjdZZUmtBRHFYDv8391y1zcK846kSx9g5RS+NMlEQABuKtxvfAo9W5I+j7BirIJo/3gavFHb5s7uzjBIWJovrCfmTBvxz2fDMbUeCbWH215kn+jDvztWb19jRb23+Sbt7MGtLvjqb74fOEqt7wdkcyBjBgwe4txzLYX3LxkTolcZZwEN5yWrN9T2/nMXUBGph9q2BP0SjWs7SLDgdd0yoDa/6ek2JI+cpZlLhLn9zOklqpH7ZUykk0/JBPuS2NDgklnAezrHX2eH2x3kgHgPv53SNT0kX7A3ILaxj393FH2mLiimuoGcAAzCQ==
Received: from CWLP265CA0390.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::23)
 by AM8PR10MB4081.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ca::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:23:44 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::7a) by CWLP265CA0390.outlook.office365.com
 (2603:10a6:400:1d6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:23:43 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:25:58 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:23:41 +0100
Message-ID: <d2197387-dd8f-4b87-8580-32d1df19c0de@foss.st.com>
Date: Tue, 24 Feb 2026 14:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260205-upstream_ddr_entry_update_in_mmu-v1-1-5495326f7446@foss.st.com>
 <f1fc7d31-ed9a-4af0-b73f-ebe10f8c7447@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <f1fc7d31-ed9a-4af0-b73f-ebe10f8c7447@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|AM8PR10MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 04151830-3682-4d6c-0d84-08de73a7eeca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmViTmFEeEw2Tlh0T3kvRWU5bjl6ZGt3WmxMNWpYOXNBRzVOemZMVFJackl6?=
 =?utf-8?B?d0ZTOUExRUdBT2NOSVVnZVVsRUExczlpSUJDczlSUlp2WGthdkRjNm9QR1Fa?=
 =?utf-8?B?ZUpKVi9DYVFFdjBzUWIyTmwyN3NLRkl0Mll4ZTJVNG1OSUJGM2RZc25oVnlv?=
 =?utf-8?B?d1RldGEyM3QzcmRZZTVNSW5BQmd3aWpETnhpR2YrZzBkU042QTdxZU9NT0Vr?=
 =?utf-8?B?UjhlQUtEb0dobzBxZzhCRXhKWGw5YUhadS9ZazBaVlJCVFQyNkducHhHZ1dX?=
 =?utf-8?B?a3kyTTJ4Wmg5QlN5WmZMMkhNekI0TXRSd054UDNYSFhYMDhKcFZGaVFOVVlq?=
 =?utf-8?B?bmtTSW5jaVpnZkVXVDJQam16UllHWWlWaE9zWS9aOVZjVFR0c2VoYk9Bbk1P?=
 =?utf-8?B?YTZzb2paYzkzbTdJcUxtWHB2RzBsUDE5Z3JtVytIbjc4eXlFeHJBZlg3c0tZ?=
 =?utf-8?B?ZkozbU5rMlRNdGcwYXFuOEltNnZSVjlTK1prWmNMTG1wZDlLaVV4L24vRFg5?=
 =?utf-8?B?SDJEeFFCS2I3T2U4ajNWN2dLaDFoemVjTHAzUjhJYnFhN0t4RDgxT2FzSVZX?=
 =?utf-8?B?TGNVMG5reXVLcHJ1OWhKOU1zZmlXTlpHUExPVUpGb1o3ejJvT3RFeSt1ajFU?=
 =?utf-8?B?RExlRmJNZC8vc21NZUNBTnliMzlnczhabzVSMVVoWTFDYUdQK3BQVlVXM212?=
 =?utf-8?B?OWEvQi9zVHBBSkN5cU13WGFSWFd1R0dNaW40bUtCVEFYeHRhUWJFMDhUZ2Vz?=
 =?utf-8?B?VjFzaXFvZWUvM3prTXAxRkJSd0RQdkV0RE93U3lIYTg3eEFqanNCcCthNzgy?=
 =?utf-8?B?SktQYk1aYUVaNU0xdGljZXJLSmxJbU4vL1ZReURjWmQyc0hOQ1pXejYzNTdw?=
 =?utf-8?B?ZGdDbFZSdUFCZnltU2N3UHdpbjAzZHgxT2YxNHZrRkFzdm9kTzdqRGgyaFBZ?=
 =?utf-8?B?WVJ3SnRocHk3T0tpNWNvM0h2cE4zbURoZ0ZvNUd2UFRCMGFGVnJYdE9BeW1T?=
 =?utf-8?B?MlBTSHZlbHhYeXVFTTgrZHc3UzYxTEZNTjN0STRuNHducjd4MVRpb2tmNEdp?=
 =?utf-8?B?RFRDVS9aS3k2SVdsU01HNjNOZ1FTRDVTaStGbkFHQlkwdFpwQm8vUnRhM1Jo?=
 =?utf-8?B?Q08xWllKWGF6emZRNzM4b1dGbnBvRkJQYzVFaWVldzZDQy8zaEs3SjczVGRV?=
 =?utf-8?B?ajMxZUNNQ2g4b0xaQU53dERyUmxpZmtQU0JGbkxCK20zc1UvZ0NtVk1NVm1p?=
 =?utf-8?B?RDNLNE1jc2RyeFBNRzM1VjlpdnV2QytHM0ZQSHhkQk10TWkzcFk0M3RrQmVu?=
 =?utf-8?B?aFlJR21meFhOS3UycUIwOEpPL1V5eEF3TFdKQTQ4OFJVNnQzdmx1TmMrbXUx?=
 =?utf-8?B?VEJQTXljRXVuT3JJN3FkejJ6OHQvYisyNEhTczVuTHc2Sm1UY2dJUzgxbVZn?=
 =?utf-8?B?dWNZRFJyRlVjZVJhUWt3bWQ4ZzNic1hoUlpSTVBpQTNXN2RTZXpDd1RBZDRI?=
 =?utf-8?B?a24rZEZzcEdyeG1XaGMvVVhEMG5WL1VzL21UeGtrNENMR1FlYzlyMGFrMHlV?=
 =?utf-8?B?M0xqYStZMDNOUmdxanRXMmRWQzN5N0x1YjF6YVVDT1duamJ0NlJJa1ZPS2RN?=
 =?utf-8?B?SGpRRGlpZ205Ykx5aThjTUpWNjdWL2tVaW8zUVVtY3kySXA3K0l1eFhQc3Js?=
 =?utf-8?B?RnB2L3J1NCtsNXJnNFdEV0JCcXJQYjRNaldiYnB3RitEeERyVkxJODhaN0ta?=
 =?utf-8?B?L3I2OTBRazRsVkFRYjZzOWxnRmhNREtUTlJpWjBUdlIwdnVHejhYTnJEYS80?=
 =?utf-8?B?VjZOVE5IVUM1OHZiL2NsYm92M0N5MkRoOUlqdDZ3c0FRdVBKUE12NG9Jc0F4?=
 =?utf-8?B?eE1pNFVHUjB5SEdQREdMdXZVeGJ2NnpLcGIxY0hyUUp4aDViT2NyWXEwMVJv?=
 =?utf-8?B?Rldic0U0c3N3VWhtM3loRTdtTmhoRFNmL09tSklRcXNZZjB1d2QvMTdHKy9F?=
 =?utf-8?B?aGRPRlhPYS9yR3NUeEoxZDVqTHRuaVdrSGFtRjh1RFlyMzEzZG05b2hQSXRY?=
 =?utf-8?B?bis1ZDhYL3JSVzN2TXJ3OVlpaVFaTmZ2ZWFYTFd6NklSYXY4SHVwY0V6Y21S?=
 =?utf-8?B?Qk54RGlCU1lTMDRQSmtoVHM3K1BycTloblNxVlNXdFcrNEpSbTZ1YlAxT2ti?=
 =?utf-8?B?NGFTaWo2N1Z6S29UL2NiZVJpWkg5dk9tSTkwQWt1VUVCVGtuZkhxOGVUVG5s?=
 =?utf-8?B?M2NYM3IxdVNDd3FKQm5JSGRUN1lnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: I+ygkSLJT9ZZOeQ1FEaz5CSe1N5PcS0vN0kg0GneJSdrdRmKoiOHchbAVb+RX1o+qBG1c02s8l0gL1B3/Zer5tworv5831e43/wTS9o7mroFFeUETUTtzTcFBVkUE3Uf/xTR1XJnL6PWDqZJkNKuyk41nJqQYUw7h2Ux3QdwN7cK2QjgGdywrHMlpgvSNbpc7qdESnV4zMFMFITKRSCTvkXNvL9zEDhvaN77V+Wy01oIsjigT3MzE8CNcovfbGu6nOO/iXhr+LFOTTOXWRF3stugxFOemhfi4biSKbA4jf00bg4nE0zSwoIwrVLKtGreklXJlWE6fCH8EttqjnQDciCcMPCCrVC3obp/RZHfv2dlj9/ibbxf09uzrdrbnjJtA4+vb0i5JGJ8bN/bKXZLWaas9+ArcJzV8dYkvUJ12CGCxoTEYD7IQhDf0IG5TsTt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:23:43.5387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04151830-3682-4d6c-0d84-08de73a7eeca
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4081
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp2: Update size of DDR entry in MMU
	table
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,420d0000:email];
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
	NEURAL_HAM(-0.00)[-0.372];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E0FC187989
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDExOjI2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNS8yNiAxNzoyMCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBPbiAxR0IgYm9hcmQsIGlu
IHBhcnRpY3VsYXIgY2FzZXMsIGEgcHJlZmV0Y2ggb3BlcmF0aW9uIGlzIGRvbmUganVzdCBhYm92
ZQo+PiB0aGUgMUdCIGJvdW5kYXJ5LiBUaGUgRERSIHNpemUgaXMgMUdCICgweDgwMDAwMDAwIHRv
IDB4YzAwMDAwMDApLCB0aGVyZSBpcwo+PiBhbiBhY2Nlc3Mgb24gMHhjMDAwMTdjMCAoaWUgMHg4
MDAwMTdjMCkuCj4+Cj4+IEFzIGJlZ2lubmluZyBvZiBERFIgaXMgcHJvdGVjdGVkIGJ5IE1NVSB1
bnRpbCBDT05GSUdfVEVYVF9CQVNFCj4+ICgweDgwMDAwMDAwIHRvIDB4ODQwMDAwMDApLCBpdCB0
cmlnZ2VycyB0aGUgZm9sbG93aW5nIElBQzoKPj4KPj4gRS9UQzowwqDCoCBzdG0zMl9pYWNfaXRy
OjE5MiBJQUMgZXhjZXB0aW9ucyBbMTU5OjEyOF06IDB4MjAwCj4+IEUvVEM6MMKgwqAgc3RtMzJf
aWFjX2l0cjoxOTcgSUFDIGV4Y2VwdGlvbiBJRDogMTM3Cj4+IEkvVEM6Cj4+Cj4+IERVTVBJTkcg
REFUQSBGT1IgcmlzYWZANDIwZDAwMDAKPj4gSS9UQzogPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gSS9UQzogU3RhdHVzIHJlZ2lzdGVyIChJ
QUVTUjApOiAweDExCj4+IEkvVEM6IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4+IEkvVEM6IEZhdWx0eSBhZGRyZXNzIChJQUREUjApOiAweGMw
MDAxN2MwCj4+IEkvVEM6ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+IEUvVEM6MMKgwqAgUGFuaWMgYXQgL3Vzci9zcmMvZGVidWcvb3B0ZWUt
b3Mtc3RtMzJtcC80LjAuMC1naXR2YWxpZC44Pgo+PiBFL1RDOjDCoMKgIFRFRSBsb2FkIGFkZHJl
c3MgQCAweDgyMDAwMDAwCj4+IEUvVEM6MMKgwqAgQ2FsbCBzdGFjazoKPj4gRS9UQzowwqDCoMKg
IDB4ODIwMDdmMzAKPj4gRS9UQzowwqDCoMKgIDB4ODIwNDQ0YjQKPj4gRS9UQzowwqDCoMKgIDB4
ODIwMmRjNTQKPj4gRS9UQzowwqDCoMKgIDB4ODIwNDFmZTAKPj4gRS9UQzowwqDCoMKgIDB4ODIw
MTQzYjgKPj4KPj4gQnkgZGVmYXVsdCwgaW4gTU1VIHRhYmxlLCB0aGUgRERSIHNpemUgaXMgc2V0
IHRvIDRHQiwgYnV0IG5vdCBhbGwKPj4gU1RNMzJNUDIgYmFzZWQgYm9hcmQgZW1iZWRzIDRHQiwg
c29tZSBoYXMgb25seSAxIG9yIDJHQiBvZiBERFIuCj4+Cj4+IFRoZSBNTVUgdGFibGUgZW50cnkg
ZGVkaWNhdGVkIHRvIEREUiBuZWVkIHRvIGJlIHVwZGF0ZWQgd2l0aCB0aGUgcmVhbAo+PiBERFIg
c2l6ZSBwcmV2aW91c2x5IHJlYWQgZnJvbSBEVC4KPj4gQWZ0ZXIgcmVsb2NhdGlvbiwgaW4gZW5h
YmxlX2NhY2hlcygpLCB1cGRhdGUgdGhlIE1NVSB0YWJsZSBiZXR3ZWVuIHRoZQo+PiBkY2FjaGVf
ZGlzYWJsZSgpIC8gZGNhY2hlX2VuYWJsZSgpIHdpdGggdGhlIHJlYWwgRERSIHNpemUuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3Qu
Y29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2NwdS5jIHwg
MTQgKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykK
Pj4KPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290
LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
