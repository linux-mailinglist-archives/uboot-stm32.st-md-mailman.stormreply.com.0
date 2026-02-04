Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ4XJocdg2nehwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:55 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569DE4668
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DCA9C87ECE;
	Wed,  4 Feb 2026 10:20:55 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 111F7C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WS7YL/vbhiJzOdpLfz4PPnus+HHOAyhh0ziKuPSS2d6E8r02uXV9vE4uX4KlbaL1ShETeL7l+p3cYAa7khDz6PHTEWWaVtvEMOPrtwTg22/9d/M4zhC+a9/0Azdw0HIQt8H9yHiA2WdLhWzsI71FI9RXDUKYBFHz0vuF8dZcSH/BcDyqAqAJazdJCFALQ/41Ctx1/GXTr6YdPJh1mnpxebs9wGM8mLb/aLyQrzUyx9PdivFmfE0jRQBf6mab0uM5Vaat7Gyp20pOu1rMS3jjmYLizsaxpeFr9dXrRHpqqkeOzrp0K3z5x6dGU2Pxm3tP+yOcl/D/RlN7nrFw1pH6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMFteW4Yg/9eZ6BgZBPx+yDGDeCnj/BbsM+RctOWAKI=;
 b=cC3nCw/4BuOWLH9p/65DaTPQy1XyZX5kqST+4qdw9aE702gRj39oZDgSsf/b7KbYC7c1ZZ7d5UmQTVDNkot8m6Ic8XgXSokqLo9XQcIo8UydxblHSY624F4MQOCM6OtAMUqp7cEi02+GOAUhiZ8Ys2c9609KB2Pc/7pLiOhm5sc5WXOQjjupXbWYwJ7FbtpDP18Nh674Wg1Q2wfEl8J7IjZVufgRZiwQzuKxiHZtXmZcC3eoVQlXOVutVY1aIg3RTEJD+KB6GY7bCvxhlj+ru8XJfw1LfDhlwF7A47AJim/up3Urtb/NxWiuz3fbobt0AIwtXzm0NuMM4+Z4roWdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMFteW4Yg/9eZ6BgZBPx+yDGDeCnj/BbsM+RctOWAKI=;
 b=CA4MiA9yiDiPiVdzJBy/4djgqcJ+VOmFF+YPbM1usIMcRRTMcfGH9eo6q7wQPa1Z6TXqRRvgk5MwzFsmkovFzFDgsEq+Eqf95KuYNbrGFpUkm2LsAwBJwAwZrWulcQh2KbLdKbu0lF3fg5L5xpl4QLr0eiohrYLYg46h/ZFRN9TGwXjLTHR8Qjs2XsEFknUV82F9R2tHMLJVm7rvRdX7LR6YW5fU6v4SgzePqs1fBZ1Qp2MkPMMwcx+/BNaTLWdD/WMzZ+Hgd880OpnDRLMrkdxL9g1JB8RbcX3EiCDhtmfRVxTXzpIatJGy7RTYxGGH85kzEGXaM57y3o2RVOSGnA==
Received: from DU2PR04CA0089.eurprd04.prod.outlook.com (2603:10a6:10:232::34)
 by AM0PR10MB9647.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:743::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 4 Feb
 2026 10:20:51 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::34) by DU2PR04CA0089.outlook.office365.com
 (2603:10a6:10:232::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 10:20:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:20:51 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:22:36 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:20:49 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:20:47 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_update_stm32_cmdkey-c-v1-2-d95374395840@foss.st.com>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|AM0PR10MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 573f38b1-4737-476b-b182-08de63d7128f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUZiVWllRXByb0FabHFzSVpES2F3N0hJbVc4dTRwUWRVaG9NT3ZFN3JLd1ZJ?=
 =?utf-8?B?dkRwK0s1dUt3cElIckQ3YjBCZXc1ZzFYeFBFQVFCWW5vVnpMMlRjNGY1SGJy?=
 =?utf-8?B?eUhYUjZBODlRYTBIZnJkMG9ZcFhYd1ZSbFRhZ3dsUVJqZm5jYzc3dWN3N0F4?=
 =?utf-8?B?OVZzK3JGaisxV29WYjVzdkEwK1czdGF5eU9JVTlKQ1BDSkFra2FsRGR5N3lD?=
 =?utf-8?B?VGVUeDJoOFp2QWI4UmV5N0RIZENaYTdHblpmd1E1eE9leHhPTnA2dWdhNXhX?=
 =?utf-8?B?d3Z6bHlWMUNKK1gzK1Rib0hzZ210NTJaeWhuUE5GNkZzWmJ4QlcxTklQRmpJ?=
 =?utf-8?B?UUMwL0RxKzNwSmQ5VDdLZ2I0cUhmQ3lMWmFPSGwwaDVmMmIrMTE4VEVDK2s1?=
 =?utf-8?B?endUdVg5aFlOMlB5eHpuZHB0SFZBRlVuVUVUWHZEczAvSTdFNWtzZXd1RUJi?=
 =?utf-8?B?OVVWYXFGcFA0WFREb0N5QWFNaCtOQi84OENhV3JFdkVqTll4YUs4Q1NGNjR0?=
 =?utf-8?B?NlU5TEI1YXRSdVJZZjJsMUcxSXJtdVdrb0RESWU0bHA5aG9FR2d0QWdweTcr?=
 =?utf-8?B?MlFKcFJaeTVpQy91UUs1dW50UTNJK1Rzc2VKbUxZbzlndkltSVVhT0l5b0oy?=
 =?utf-8?B?dFVLeXJuaDZrN1ZvSXZXSUFiTjMvdFhZUW9ZTkF2aXhqclZFdTFwNVB3cEJH?=
 =?utf-8?B?bDVKNnFwc3BaYWp5bEJKOG51Qmh6UXVwQ1hJTVowT2JhTUhlclg3TExsdGhi?=
 =?utf-8?B?Mk9YWUw4TGJvVUxrQWU5WVN6dUdKTmNJYmFvcEMrNmVuR1dqL0E5WlhIUWpp?=
 =?utf-8?B?R2pxQllpR0ZSSCtHSTI2K1BXeGlLSU9rWlJxbytZUE41VnJ3RXZONGhJVHAx?=
 =?utf-8?B?cThVT01Ud3IwTUJiU0JaVU5DUnBoTGduMnNsSWNCaVFua3pGWVhvTWVPay9S?=
 =?utf-8?B?RG9zUnZJYVFoWThWM29ORzdlNTZRUDYwSnRDWlBRejVtV21mKzBYSklUc1Ev?=
 =?utf-8?B?SnBNZm4xUmRib0F3SWM1SVpSbUhmUUlwbSs3bHYrZmxxc1dXclpXcWY4MURq?=
 =?utf-8?B?Z2VnZlIrR243bFByQUtNSE93SGZzZjZpYmdzRm5seDZ6cW5KSVh1NzlKbUxS?=
 =?utf-8?B?d3pjZVcrU1FpYW9jeFJ2NTQ5U1A5a0YvcDBXU1lOeGx5WDlYeEliSStuaDQ2?=
 =?utf-8?B?WDBjQk5RcnliMTJFbEY3MHgwNWVmNzZGM3g5RW9WWktYS0t5SlJhMjNSckJ3?=
 =?utf-8?B?aUJCVlVjSDVaYmp5YUVCUkdodU9pL0RhRjF5K3A2NE51YTJTUCsrVWV3S2pp?=
 =?utf-8?B?aHgrRGdwdXBUcFcvRFJJYU16UmsrdWpaVVFWRmhKRmZUdEdrdjltdU1iaW9q?=
 =?utf-8?B?SFNEZFZpWTVGVndydmczaWI0ejZNa0Z6N3pwRlY4MUtMYmNncWlJaDJ1cVVJ?=
 =?utf-8?B?OHRqWi8rVmhuZFB1NGpmNVhITHFVaThYbFU3VjRlbEc1b2NkOWVRRFo1Nndm?=
 =?utf-8?B?N25Sd0hIbkRHT2N3M2lPN3phU3dwUFo0Rk94MlQrMVB6MG8wT0dCVm1vR3lV?=
 =?utf-8?B?TXFweDV1ZTd1by9UTElGbWN0emhLOSt4QzhPc2t2WUdpd0pvMWdjZDlqNnc2?=
 =?utf-8?B?eWg1c1E3c3BtWmNCNHlOM1NUdnU0QXJDeHVLRHR6Ty80MnppcENhTjRhaytB?=
 =?utf-8?B?SUd2MDNXalRRdm1jcndvY0d3TEZqTnZUcU5TSFl5MkN0cVJvMWxka0cvOUxp?=
 =?utf-8?B?emtGZm5aaVNuTStkelJISk1QbkJmRG9ZWERWU3d5MkhUdS9TYlAyblJVeHRk?=
 =?utf-8?B?UmhlTDNUWUorck9KZDRkc2ZzSysyL3lrTDBOaFpLWWpxRmF1cGtZV1RQaG1M?=
 =?utf-8?B?dFVCaENCMUxrU1I1eUJUWTNpTnJxNDdhdFpQdmFWaDIzUXo4YTNZRVdwZ3VT?=
 =?utf-8?B?bTAyQi9Gdk53TjdvOUJOcjR2OExNVllzanBtSXNUV2p1U1pndTMzcEp3SjFO?=
 =?utf-8?B?VkV5MXU5OHlHN2Z2RlUzUWc1RTUxS3dva0RXM29sNXJTa2Rzek5ycTlFZ3Mv?=
 =?utf-8?B?WnhsU1pYSjFsTUpwMit2R2JtUmtsdW9qN0lSTEVPVlpVSnRiRjNwd29vQzV4?=
 =?utf-8?B?Q3VPNzRVZkFEZnZUWUVKQUlZQW1ZSVlvQTNONk5FYnhYRnVtRXI2d2RUWTFT?=
 =?utf-8?B?K2lQdUJnd1ZldHFzcVRQanVwZ0swdXZkNWE4ak96RHQvNEE5eEJaNm9SWk1Y?=
 =?utf-8?B?UnVhY0R2WFZFT241SmV4Ty9pTTBnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l/qW8P/qToAHyxOCChQQFR0gLefBVOYMJKoUhJ2ae/P8ks+n9MfNAclczr67d5lc78fyvF464qzaF1l85LN4A5+AZCCEBkbmG0AxCUCAJ1gYZTDZ60cNCrxgu+eSKrEi0zHOoj42HmmPypHYywEQg7sQs4IgPbFs/hss5jhb7F86WJqQIKTAPuZvZ3WQHxD129xf0vStJvVDJWt+UA4PC0elCCmTnJrOGtOZM69luRZvzNO9mkzUJPFtMOF/BpmAHceuwdYdcKKYQuACSNZ+KfLPZOjv7ST7fNoyu7gx1bEa3bpWoQvMfBcwqxpLwaoX3lm2tlaPOazyopBMQIsui6GvKuARAJaIooHjklr8VixW4fVixvKAvOX9+CA00yg+ksHHfH4Wv7vIPVioL0iDaeFspewGGUA9I9vKCsZ4o8iBj/bYdDDv1OiJ7Vxs2ix1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:20:51.2597 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 573f38b1-4737-476b-b182-08de63d7128f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9647
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/6] stm32mp: cmd_stm32key: add support of OTP
	key format 2
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8569DE4668
X-Rspamd-Action: no action

From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>

Add support of OTP key format 2 used by OP-TEE.
Key formats are describes in the STM32MPUs references manuals
section OTP mapping.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/cmd_stm32key.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 1ceb640e6b2..cd539a626d1 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -41,6 +41,7 @@ struct stm32key {
 	u16 start;
 	u8 size;
 	int (*post_process)(struct udevice *dev, const struct stm32key *key);
+	u32 (*key_format)(u32 value);
 };
 
 const struct stm32key stm32mp13_list[] = {
@@ -69,6 +70,8 @@ const struct stm32key stm32mp15_list[] = {
 
 static int post_process_oem_key2(struct udevice *dev, const struct stm32key *key);
 static int post_process_edmk_128b(struct udevice *dev, const struct stm32key *key);
+static u32 format1(u32 value);
+static u32 format2(u32 value);
 
 const struct stm32key stm32mp21_list[] = {
 	[STM32KEY_PKH] = {
@@ -268,6 +271,24 @@ static const struct otp_close *get_otp_close_state(u8 index)
 		return &stm32mp2x_close_state_otp[index];
 }
 
+/*
+ * Define format wrappers based on reference manual formats
+ * ex for key from NIST vector AES_ECB_256b_test0:
+ * key (bytes)     : f9 e8 38 9f ... ef 94 4b e0
+ * format 1 (le32) : 0xf9e8389f  ... 0xef944be0
+ * format 2 (le32) : 0x9f38e8f9  ... 0xe04b94ef
+ */
+
+static u32 format1(u32 value)
+{
+	return __be32_to_cpu(value);
+}
+
+static u32 __maybe_unused format2(u32 value)
+{
+	return __le32_to_cpu(value);
+}
+
 static int get_misc_dev(struct udevice **dev)
 {
 	int ret;
@@ -282,10 +303,15 @@ static int get_misc_dev(struct udevice **dev)
 static void read_key_value(const struct stm32key *key, unsigned long addr)
 {
 	int i;
+	u32 (*format)(u32) = format1;
+
+	/* Use key_format function pointer if defined */
+	if (key->key_format)
+		format = key->key_format;
 
 	for (i = 0; i < key->size; i++) {
 		printf("%s OTP %i: [%08x] %08x\n", key->name, key->start + i,
-		       (u32)addr, __be32_to_cpu(*(u32 *)addr));
+		       (u32)addr, format(*(u32 *)addr));
 		addr += 4;
 	}
 }
@@ -456,9 +482,14 @@ static int fuse_key_value(struct udevice *dev, const struct stm32key *key, unsig
 {
 	u32 word, val;
 	int i, ret;
+	u32 (*format)(u32) = format1;
+
+	/* Use key_format function pointer if defined */
+	if (key->key_format)
+		format = key->key_format;
 
 	for (i = 0, word = key->start; i < key->size; i++, word++, addr += 4) {
-		val = __be32_to_cpu(*(u32 *)addr);
+		val = format(*(u32 *)addr);
 		if (print)
 			printf("Fuse %s OTP %i : %08x\n", key->name, word, val);
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
