Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKkYH3Acg2l/hwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:16:16 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630AE45AC
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:16:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F115C87ECA;
	Wed,  4 Feb 2026 10:16:15 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013037.outbound.protection.outlook.com
 [40.107.162.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C9E9C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7IBYQihMOFcaqwiNE0BQfdZN7iLICWqwFzaCYkNpBZzPbLHNf6uzm5NTEJ7Poh405lRGSrUX438fDH0H7sb7+mU63IMmGtYUBNwGMGxR/7orUf9lvFVbU/zFHfKOPKIEPQG61HtwlFyPmAWkeSejbQzOixbO7jTxeGcp+CKfsbxyMgSfiV6xM41ty2InVUL8ORHvGL0A+zR5pwQI+kg9GmLRp8Ys91qLQ7Dv76kXw7kAAsfs1PZ+va7khFTN+ITEWnTPd+TKULXKuxil0AS56+vJZ28UmEQh0yiw7HtSdACP7ALfnbeFIQ0bLqp8rG4s8/GYpbYxdxhRF9rvepPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/pY38Dn3An13b6RRsx2yFRffbyzDHhRE7996k4w8ok=;
 b=oLEWK9Y7jmi1STPu53XJI7Mvy1o0r5v33mIkf4QEkZR72V1zhHuN1+cXhNwobmmK0h5p71pG25ohDX7CkiGrBlDHonGUT/BonzZBPFtLNgZzuQ4JkGBl9oIoa8vpbEXFzd76swInPGdtW6kQO/EQPFTB8AYdsFlvptGJrAb+rYzR7oZz7eC6k/X1d/H5al6Gb88nsKD7H82ZGYVZg8t3S41K21EeVMSeQHxsSE5NR9CX2pnHyiekX8nQqdRnxT45IvQgQfg6ry1daI02O3aY/gIu7GOQHHXG55jk618Rnp+t+SO5Yx3XKeUDVv0xvQ+xy9mhEEfZ25fPCHj3QutglQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/pY38Dn3An13b6RRsx2yFRffbyzDHhRE7996k4w8ok=;
 b=KLnJ8A8MZdVTgRlD2SFYNf6WuW+AbvB6LzbzYLfZDwk8ZMpJ78KsjAu8KvpJAzwWzRZI9KTSm8IFWrllWvKLNN4PWqlvc6RzFdANEqPBZikhkVChWRDfEWunJ2muP3LFCSpOkT7zZ3lhH/kbzpB1+qCq5F7FHMrQfC5+DukMm2AItPv/MydHQMrTHfinSy20d0q7b1esmcwQMrT0XbkAbkACoTeUP+so7q7Keav9cJbLdgSjpGrDlftGVh1exs0Ei9muJXDfLh60TUfZLIEPg+Bx/ywga3d774XDk9Sw57X9Mju+cpLEY8XU6SB6+6Bqz75kSIuGxAW8BK2jPm7skg==
Received: from DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) by DB9PR10MB7362.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:462::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:16:11 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::90) by DUZPR01CA0191.outlook.office365.com
 (2603:10a6:10:4b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 10:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:16:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:17:57 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:16:09 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:16:08 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_factorize_and_update_read_idc-v2-3-7f0baa41d2f1@foss.st.com>
References: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|DB9PR10MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbf61ab-f21d-4e3f-4cd3-08de63d66ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkZrRGYzMXdDM3IvRTRtcDZyUjJ6alFFOS83Qmk2ZmRUVS8xWVdadXRrQ1Mr?=
 =?utf-8?B?c01mY29lelFWa2ZQVkdRWFdMMmRLNTZHUnpCTjVrcy93R1gwU2RUSFNDM2U5?=
 =?utf-8?B?NzFaUlpIVzVJREFyTE9vNGlySVVaV2kwd2UwMWlyb0VHcFdIVGpDOGZ3NkNX?=
 =?utf-8?B?SlVHV3hqOURNenhrMHpiUTdZRWlNcGhJWnk5WFJMaCsrNEFnMVZDNXkwVGor?=
 =?utf-8?B?b3UvR1A2UmV6MUNQRC9iYVBneTFYU3NPVkFuSUhPcDMvV2lCRmVCc0NnUmU3?=
 =?utf-8?B?b0d2WmRqeHBrb216T2M3RzFmcGRUSHRiUDlRVWJuS2c4ejVUT3RPajZTbVpC?=
 =?utf-8?B?RTdBL3p2NTFyUWFZd1pNWnBTbnBoKzZhOExpQXA2RkEyVFJ6a1ltYzNlbFpB?=
 =?utf-8?B?aUZxaVZyZFZsbmk1Wk0xTEp4NDcyK1RpSXF5VFlQbWgwSzhyaG1IRlg0SUFv?=
 =?utf-8?B?REZhbUhCamhKclkzRDNIMjlkQi9FNy9IVEtVcUo4cDVFQWI2aiszM3NORTJq?=
 =?utf-8?B?bUlRTmY5bHhTRll4ZFpaUU45Q3NJR20zVGFMRCtzcFZaWmZWL2JhZDB3L2hn?=
 =?utf-8?B?Y25yNFJtejNFNlZKL2tJRmlValp1NG0vd2k3VUR2eFBCeE1ucGtCTzFscmRP?=
 =?utf-8?B?OWdmcEVsOHZDZmxyWEFBSzNDQ0JxYmJUNFUrRDR6ZmpWSVRPY1dUd25kcngy?=
 =?utf-8?B?M0VVejQzZ2x3SXpQWUhIMVlRYmpGSy9DZWlZNThTdWRjcEZpNU1zRUN6eWZp?=
 =?utf-8?B?TzF5TnV4dlZDMFpleHpZbTF0ZlMwQXphamRLNmE2dUd0UTRDZWhpS1dQZlMx?=
 =?utf-8?B?eWMwUjRqTkJuR1A0UTFxY0FWN3ZhYkZuZTBBc3JUaEJSQlNHYWFRSVkzUmVx?=
 =?utf-8?B?TDhjbllGa1EyL2VLZER3Ri9nQXFYVG44dlh6RjFHMlBycHgxVm1KREVnZWtw?=
 =?utf-8?B?eStVL21CcGJGdXFpZ3BwQk5zdmQ0RlNLNE5SOFdBWDYyUUFNeG92dFBXakcv?=
 =?utf-8?B?Rk92OXg1Z3NPdm56UkxJUGk2R2FGZjJyb244NktPaDNjczVTbFEvTmZLalZm?=
 =?utf-8?B?MTg3YjJldU0vWWZ4SU1lTWJxcVNGYWdTZDRQL0RnQVNvQ2lYVW12VnMzSHpP?=
 =?utf-8?B?Q0Nuc091c253bjB1d2dkb0MweFdMT3l3cGlWZjJWeU8xUWJDTUVCa1B5OTlh?=
 =?utf-8?B?RCtyL2lyU2lTaFZ1cWhJRW1JMVdiTzZBTTlNMUw5clNGYW8xY0g1dnhLYVZO?=
 =?utf-8?B?dFo3UG5ud2FvZmNHR0FMUXIzV2d2elMzeW9HRzVnTnNYT0pjZFdaVlVvbXor?=
 =?utf-8?B?QjZFME55UTJPeVMxUXNrdVFQSW1xUDZnaHROdkR1VGo0akZGMHNLZWlWSnBS?=
 =?utf-8?B?QmNsUFdqWWdXcGtIUjhScTBIT08vMUdCbHpXWVI5WHpieUdKbGhVQUpHckFj?=
 =?utf-8?B?cEVnS21pMDRxdldXSkhjczFBa1pEbHRtTDhBbzJmcUFpbGpaNVk2c3YwTFRO?=
 =?utf-8?B?dVlMQWk3Mm1jdXAwUlFOUW8zSmIyWFJVOU5ZemNaY0d2eUJUV21KRTV2MlN4?=
 =?utf-8?B?aE5YeFR6dHhMUCtzRzNpeWYya1FVS1ZvbWozbitkMy9mQnRDcWppeEJZL01L?=
 =?utf-8?B?NG5GZ2lwQUJOd0ZTWmR0RzFkS3lRMWlqWXJlVzNXYmphUWlocVJLWDltR2ln?=
 =?utf-8?B?VnlCdFFqT3VuVWh5TFJiUEZQdXdpY3ZhUUZ3V0JvQkVheE15ak1tVHJnVFhD?=
 =?utf-8?B?VGxDQ1ZLRFZ2ZUJnSitiY09DUExNNVB2eUxBc0t1SlViK3FmNHFsVmZmZ2Yy?=
 =?utf-8?B?c1J2QmQ4WFVNQW1nWTFuN0ZiZEJxd3FNOGIvMU1jZXhKNHRnK1oxSHFsbXVG?=
 =?utf-8?B?OUhBekNyWDFFRDRDQ1dsMDBvRjVrQWlYUWl6VzdUdklZL2VvSE5FV3JBbDV6?=
 =?utf-8?B?MnVOdUdoY3ZNSXJ4L0ZwN0RaUDJDRHM3dG5LTUU3ZHlmYmtncExtUjR5MkVN?=
 =?utf-8?B?WlhPMVhUUVVpY21sUXdyNllPckxzTG1uYmlXK2ovakZpbkZ4eVVZUGJxU2pZ?=
 =?utf-8?B?V2QwV0F3Y0ZwN0FRdXU1YWZxeUNrOXVxMnpFRXJKeUZteEphRmpyZzNvM1A5?=
 =?utf-8?B?R2QxS3lwb09DWlJoN0plcDNVNkZWK1UwWUFFZXI5UVVIQ3plVFM4cmx4TjY2?=
 =?utf-8?B?MjNFWGZpSE84KzlEOExveVVUY2N1K0FEcUZVOTFtV1JQOTR0MjNuMGZ3TWV0?=
 =?utf-8?B?eXQvTjhYeGpNczJtN3pSQ3FycWZnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /V8S+h1hpYi9UYUDK15nKCiFC1VXAsR9Rzg8Jp/VB+jgpuKIUUXFgkZZ5PIlmXVT9ieLwD4ud3R1horbxF0eimcHObgi6OxFLfw4SzgAMPLjIa7v/JSg5kFcGLj2pne6WDWPJgQtH8usZ7MnXTAaQs2jZV3NUJsfOE0nyaeCaP6PpuVV9740wkusQeLomSWJMjBIS0cdRG0f+NxlRGtn8U9Iv93wmYlQvj9iR2XZCHs1ZoKot2TA3OgEUOGRyavbH1R1evDLsi3WCMCFMBV57/gzxCkdn4k9cTz0PUyPa3RxYUX1N28MFamMNjuGYIgSs9c4rTWQ0z98Xiwvp0UjNASIGYJFH8Eni4h/e4OfAK6+Csl2UNvYZMUnqAS/1sdJqh9TeYyRoZoAbxTTOSZY6jbVeozHB+914JkSqz/kZ2yNVKcVW2n/Bwc78g2rMpGV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:16:11.2200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbf61ab-f21d-4e3f-4cd3-08de63d66ba6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7362
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] stm32mp1: Add check on
 syscon_get_first_range() return value
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0630AE45AC
X-Rspamd-Action: no action

syscon_get_first_range()'s return value is used as base address to perform
a read, without any checks.
In case stmp32mp_syscon is not binded, syscon_get_first_range() returns
-ENODEV which leads to a "Synchronous abort".

Add syscon_get_first_range() check on return value.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
index 79b2f2d0bba..6d2d69f3442 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
@@ -17,6 +17,7 @@
 #include <dm/device.h>
 #include <dm/uclass.h>
 #include <linux/bitfield.h>
+#include <linux/err.h>
 #include <malloc.h>
 
 /* RCC register */
@@ -231,6 +232,12 @@ static u32 read_idc(void)
 {
 	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
 
+	if (IS_ERR(syscfg)) {
+		pr_err("Error, can't get SYSCON range (%ld)\n", PTR_ERR(syscfg));
+
+		return PTR_ERR(syscfg);
+	}
+
 	return readl(syscfg + SYSCFG_IDC_OFFSET);
 }
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
