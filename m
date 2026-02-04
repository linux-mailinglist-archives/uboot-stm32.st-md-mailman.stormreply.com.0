Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IrrHAzX3gml2fwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:25 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A0DE2BBB
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0238CC87ECC;
	Wed,  4 Feb 2026 07:37:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A56DCC87EC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 07:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAejmboj5X2/JfwSGOOYuvF1lttNEW1Dk8/tF3avULp0iKfRPHDZvkxSyWNQFC6ylvk1vagiwXFgT0YEHkaawvoEswZhyjdI96feDNFpjVxBMLkbNDvhbUbUyYPjuX4iObYzuoMCKx+GdJcu+/Db2sOxSYL0+KNLFREqg7LIGmGT4WiMHDXh8cmzp66/d6rm090Ye8v3UkrALtnr5c+WQ71LfZh5W2UEBP0kzf882izlbX3V/6GiN9pM0sWTttLHaCnJC+LWp+lGhkBxQaUa1etzjUKxPAA+FaU8lFYcdFtZ46bShsvDmcXRaIkS9KcM+8+cWlMVMZFwEj6Qjqmc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xik5PlG2RAFwx7lt28rcXL804EY0t5evfTapgzGppGs=;
 b=hlJXxrJe1xkQa+vd4KFGW4Jo3KEgubIqX1/559pO4qZ0WwbMbOVIExtJPrTUaT7fPSLxonA3bfJK6R55x/lYxBS5NlHcgLolOO54aSBN9o5MfXQU5Nx5AgyZKLSM7jBKpENgKKT3g/Xq4LJDd+eOqOgNLebwPtP32a0wjsPbrx9mWpxOYJpLqsyPKRsshu36Sndgu0yOyRD0WUZcBVUr+8HbT200CHHTfpiEoRQwaK74ocahQd3dQRlq/Sz2AMD5yIz3OdEjPpZ07xz8Jf06r7b8BeI7i3FebfgL2nyJgCX6ap1sZv/uhqeF7jZicdaTpaT7JywdgO/S4fVTkNVVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=eds-india.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xik5PlG2RAFwx7lt28rcXL804EY0t5evfTapgzGppGs=;
 b=mAI+vqP08ib3p+IVkPtwBLu/ykzEoi3+Iv9aBBod3VqoPQQO5qn2Wj+edHmA8+CCjniyds5Cwgrn06rjZtV9mpgdDFqW5Qjo2gr8ZB5kzxGAxmU8kqJuiSmdBOMB++NFSVI+gr7omFa/X1MW86YdaLe0UewZ7VjoGFN5VpC88AS/6nnYhEAw+Jib4Yj/4UwV1CAU9wMFHJ8CN37eA6k4cSu1AHKI+I/PnAq+uJrppKf54wqnlLc+KMp3P5y5QIEUsbsE1tukfHlS9vnfxKeA8GJZ3dZwEicOQsxcJMsKUXEBXRMiYUoersmpaeSqH3Qp9HDABefbUYYP1vcfGMNDCw==
Received: from AS4P190CA0066.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::9)
 by PA2PR10MB9077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:37:20 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::c6) by AS4P190CA0066.outlook.office365.com
 (2603:10a6:20b:656::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 07:37:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 07:37:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:38:58 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:37:18 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 08:37:08 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_factorize_and_update_read_idc-v1-2-f41a063c28b9@foss.st.com>
References: <20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|PA2PR10MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: f1079e7a-23fd-4409-a4d0-08de63c03ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHB4UWY4RDRjMkwzQzNuNElYaisrb3phWkNrTVI1emFxZzhidjMrWWhkOUh1?=
 =?utf-8?B?Rnk5VmxiZU9LYVg0MGx2NG9ybnFqQXJaR0FzbzJCcWppaWkrdGVmQWV2RHFt?=
 =?utf-8?B?YnhsNW5yL0NKbGpiS0UzZEtKV1lGZE1uMzBrSkladGd4ZFVBVXEySS9ZY3E5?=
 =?utf-8?B?MlJTM05uZkhVa3hqbzl2V1BNK3ZLcTNUdjcwdVpENS9taWpXSklrbUxRS2pj?=
 =?utf-8?B?MXY0bXZIRDZ3ekZMT3dsOFV1L2JwNmNQSzhlSjcxTk5hOTJvZzZkTHdSeHIr?=
 =?utf-8?B?cXFyblh1SW5lRjVheFNZOXd2NTRhUGdzUWJUVkcwVjZ6VWxrQXA0WmN2bU53?=
 =?utf-8?B?Rkh3NWw5a2s5citud3pnOEk5TDdUQ1JsYVZUakIwRmRScDQwbHQxaExhRU9P?=
 =?utf-8?B?U0FRNkoyTGpZK3B6NXkvdnVCb2Zva21iZ1IwK2pUODArQ1lXaDc1QjRmTG1j?=
 =?utf-8?B?QnNRMlVjU1liRG11eXd4Tlo3Q0RoblJGTGZUUnpvSGQrYXFNS21sU1lkYjUr?=
 =?utf-8?B?YXFrRXJodDJLR2JyLzE4MkVOOXUwWGZia1BiSmx5QlVhRGZya0d5cVpGNjNY?=
 =?utf-8?B?TjdRRXRiZTJOMWZGVnFsY2J1WVZDVFptUGtuL3lzd2N1b2xpQXJER1EzdUcw?=
 =?utf-8?B?MXJYdWF4T1VOQWlDY1k4TVM0UDFUamJkVDhaTXJBU2tiU2FWQzh2bnBIZE9V?=
 =?utf-8?B?Sjdjckk2T25hM0g3Z2h3c3E2dld1S0FjOTFHa3ZMMWNETHBtem8venBPdE01?=
 =?utf-8?B?Qi9PR093OWZOQ2owdURua2ZQMSsvTVNQdDFhTXRzT2dMMnlXNlJtS25LYWVs?=
 =?utf-8?B?NDZTNkpkL1V3QXBUM1hyMkZGcytseFZ4MXd1VVlPM2lwQU1wV1BvWGVZSjVK?=
 =?utf-8?B?QzVvVTZSdktRM1FWTEZFWEZMSWpQOGdGVDZGV25ZRE1wU0lpcDVGZTZpTmVK?=
 =?utf-8?B?RXdJZjFjR0ZOVjl3ZjVHQ3hCbkxGUG1nT0NoVXZ6c1dMcytHUE4rMnlWZHQv?=
 =?utf-8?B?dEg5VSt3YnZ5b04rOXdFdzhkV3pJM2NaaDlzb1Fyb0VsUWFNdmIvUWpvSE1u?=
 =?utf-8?B?Q1c5RVA1VzN4THdoYklZMTVTdzFCak1XWjFWVlMwR2Z6VHp3dTJnLzNzdklO?=
 =?utf-8?B?VkNrSEJWWG82Wkh3T1MxdlR4Z2tMbXFtRnNLS2hUbDBkKytlblpEbms1UFB3?=
 =?utf-8?B?TUh2cmZCWTlDUitLNWczbTVIRDU2Y1N2LzkvQ2RtcWNJWlVwa2FuL1pvQjdr?=
 =?utf-8?B?M0lvQ3IxNXNZSk4vQjg3OGRuZnc5WFJZQmFFZ3MxeTJnd0RjNVlZOVJia0hF?=
 =?utf-8?B?WlpNelZySE1GL2paMzVQVDQ5Q1I3R2s4UVRrb1hTMjVyYzBvUGdKNHNrTTVY?=
 =?utf-8?B?MnFubmlpVmFYZFBoZHNBRjgzMmo5N0hoSGFUemI2TWFXeisyK3AzaUtxSEQ1?=
 =?utf-8?B?OUZoVWMxbzJFZWhqWGkzR3dSOVJZUjlBNzJXTW50dnJOeVI0N2ZQZEtjQ0FC?=
 =?utf-8?B?QlpXNFBDRUdKcm5FanlXUUg2OCsxRnNCNTQ1RGFqYTh1Z3FDaVd5dk9JQzFC?=
 =?utf-8?B?TVV6Qzk2anlDTVN5VWVUYlpjSXFvclNXMldDd2tjdWJKcUovTW1QRCtEN3BF?=
 =?utf-8?B?MHdsWGJqTFhIMGk4Q09uNml0RjFVZmppQjJ6YVF6Y3kwRDd1ZWRuMHB5VWNL?=
 =?utf-8?B?eWtlYXVFSmhUTnEzYjhHalM3OWU5d0UxZWtuclVuaEFQakluUVVsd1NINGdv?=
 =?utf-8?B?VHRWL1c2TmJRZVh2RnJnUW9PWHg2TFVzQXpPL2Iwc0txOVNBb0ZOdXpIb2Fk?=
 =?utf-8?B?cWt2YTREaCtETXB6N0s5QTFrOEV0Y3JZNDV1TjM0dkw0MUNhR3ljZzdxOG5P?=
 =?utf-8?B?NjBjTkFuMjI4NjRrRGNFc1NIc0pJK2lyRzlsdzRaTHFSZE1nb1JMSTVNYjlK?=
 =?utf-8?B?UVJNYzQ2RGd6R1UwQjNoaDQ4UTU1dHdBNGRvMGdnTElqZ2lWL3oyck8zUU5O?=
 =?utf-8?B?TjZvKzFxcDRWeEZWSUs2QVdhaUZwR2Frcms3QWhZM1VNZTJYcko4WW5Gb1pX?=
 =?utf-8?B?QmRrMytWV3YwTktXZkM0V2FTaDJNRFhqZFcvTlo2WVl0YTJpb1A0aGlibHVw?=
 =?utf-8?B?dVEzVGpCTzZCZWp3Z01jOElhS1VzM1dpbUVCWkgweG4rWEhIRCtlbG14RHJP?=
 =?utf-8?B?UTNWUW43Zm9uM1UwMXljaEUwQm01eHh0OUdDWVJMTytYaklQaXdjV0UyMnoz?=
 =?utf-8?B?VTlHR2lkRlVJbks4WVJoS1R1MEZBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oW72nn6e36GXxc+aqYuzEU7dpBBwNCVXnXS+VoZ7jGXEzmS9wgnAiCzbTvWmULcZ+IR12OXpYjYYRM+299s6tTGDVDos1GPTk7VdDXEnpfBkpJcEP8+/vT+080IFztNjF2v9MO49JPltYoE+FDBso5fFplLsPVXmv6lIlqsSZ4d8YirNI0wdYjaSFrXInwcjrN/5fXGCzagfYEOzFqhVHBmKiJ1qeEzsx/yhtkPp/EsmpXRAX96nLHsmVlPFsY5K5vZjlmqE5+idF8t0QVjZ9iPkSIaETM7vhNwaZCLukiGtQejuK2S1s37L7+7ep7yhyj6YDFamq6IJOzw3hQ31fNBOG4PmZGGCRr6/Bu86T1sn9n5p8Mo405tx0jLYjHx3JR3bJ0NsOIJ0laALflVNlIHiQzYt0dwWPAFrcbsKn5KF0mDWe9nnCKbU4EN4KdB6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:37:20.2127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1079e7a-23fd-4409-a4d0-08de63c03ab4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9077
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Uboot-stm32] [PATCH 2/3] stm32mp2: Add check on
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77A0DE2BBB
X-Rspamd-Action: no action

syscon_get_first_range()'s return value is used as base address to perform
a read, without any checks.
In case stmp32mp_syscon is not binded, syscon_get_first_range() returns
-ENODEV which leads to a "Synchronous abort".

Add syscon_get_first_range() check on return value.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
index 551601a12a9..40fceac402c 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/io.h>
 #include <asm/arch/sys_proto.h>
+#include <linux/err.h>
 
 /* SYSCFG register */
 #define SYSCFG_DEVICEID_OFFSET		0x6400
@@ -30,6 +31,12 @@ static u32 read_deviceid(void)
 {
 	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
 
+	if (IS_ERR(syscfg)) {
+		pr_err("Error, can't get SYSCON range (%ld)\n", PTR_ERR(syscfg));
+
+		return PTR_ERR(syscfg);
+	}
+
 	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
 }
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
