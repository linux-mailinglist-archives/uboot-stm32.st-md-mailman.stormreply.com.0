Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL3OE4FtnWkkQAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:21:05 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4918474B
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:21:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5C82C8F285;
	Tue, 24 Feb 2026 09:21:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEBBBC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:21:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2JzuBfdSSrSSKSrJugY52sgFJvhNqRWAJXDvEFjkiR7upPXZshzoiV7RkXef8v/fYZAj4T7tHtxTk40XN7V0nCTnlbAf8vBBcf1dBWvWBqSSpMvvj5mXoMYK1jWMYjSPAKVAs5NRiWd20jAoXFPMiU1J0IGtVXBWfiBkBTtZmApCSHAdSiQE0S/PYjneTICAaoHxBB4YZvfrmCDHQTjKnx4V+DZaYs4+Olo/VBUzppKJBGTexbcPX5AOTP1v7XrsiT+4Ot0ykGx72xuxqaT7Oi/s3KOIYcCc4hV/e+I/wJQc5qvnrwOmD6xTmHjvE3tClItMG1XjuhCPPc7Slovjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck4TLEBiuNaT+Eibp1drsp9xmPt8Jg2NiYGxdS2VFVQ=;
 b=t8Kalm4Sl4JKB/4+vIGRxArIouLtsgz4/5a+zri5WPzIXZDgVVKSJYmPHbZozgkNaDOryKjrCL8Q0mUZ9nQTjlvwJdU/EciAEY1XIhvJaF4hvsD4MAK1q8qXTgF4/yA6Oi6VoNMwmZHe32/Ir4jlaiO2JFPumtclWCx0ouApb9PCGkr2uGVz2pR3Z4xfjekLbxgeoRHGXd/7WF4B00tYIhAmwWPt1vo+vh8WAqJ23CbYXRSwrYXDlaiQADO/sscSyeNuxvSkZr+0Mcr1ivjyPyulaLb+GVUohmdnE1Sk9cFQLudoOdFMHbU1tr2bOaSi7+A/FAm/8mbleu/bDGu+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck4TLEBiuNaT+Eibp1drsp9xmPt8Jg2NiYGxdS2VFVQ=;
 b=V3aiR/K7ydewzy4RTLt4N8aHPPHBursiDDIAYDChoELqRhRxWRZNGAH/gwyVqbruTx2bIji/GYoxqkQFRtxnrwLQf9nILY5oSSnwsjTPN6DX+wd5m6J6fIPSBycY2JPJxqUXsHncopZE3s8gQKmJdZBvDA0hO4s/96oQ5mlo4gn8GeQVEsJmIGo4YaVsh3jh53vlcp/sP0PDBhlzT5+9RqCV+5Nq57xkNwXZrIv4uJjaNq+pvPaUOTqslgs+AoM1dA6SyzrH7xHtgFRIYnlkyWZgLQEcHpojcSFRsyQVO1VVTGfVG7xpdka1GLLhl3eCeCl+ES4DT0izs4qjQTER+w==
Received: from AS4PR09CA0027.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::17)
 by VI0PR10MB9012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 09:21:00 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::81) by AS4PR09CA0027.outlook.office365.com
 (2603:10a6:20b:5d4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:21:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:23:06 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:20:59 +0100
Message-ID: <1d0c08d8-4c5a-483f-b4f2-c58849f1113c@foss.st.com>
Date: Tue, 24 Feb 2026 10:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
 <20260205-upstream_pinctrl_stm32_update-v1-1-3a3797af498d@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260205-upstream_pinctrl_stm32_update-v1-1-3a3797af498d@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|VI0PR10MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 80021a9f-93d5-4c2c-facf-08de73860693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjlwelUvL3ZVWGl0QmpSMWloZitrRDlEYTJEdTNPVllqaWhVUHU2Q2FwSkI0?=
 =?utf-8?B?YTIyL2d5U1BFMGtZQmdINklXU2FXRExmY0tTTmZUVnYxeHdZZkE5cTA2UGFT?=
 =?utf-8?B?ZmJDR3VnQlpoSE90ckFHU08rSHVNVXplaEJmVHBpTndvMExFUFpRNDFtSVBv?=
 =?utf-8?B?NWNZUmZRN2VUYUxyT1MzZDIyWkdFKytNZjhyQWFBcDA1eXhlMnVFY3ZHdHMv?=
 =?utf-8?B?c0VJcmRGSlR5djFwOTk3eVB4NXVkRkg0K1JPc2F3eHpPdGVxVVFVTXN1OGFm?=
 =?utf-8?B?eDMwdFMwWCs2QkNTRG52d29PRXF3dGl5aERUK1RSQmZNenBDWTZYQ1B4TEZh?=
 =?utf-8?B?YVlTWGxwYkt4R080YXBHakhrWlR2d0plc0NuQlh3NEhiMXFqWkt3dzA1ZWxG?=
 =?utf-8?B?bFZVRXFrSGFqbmQwRXd5U1VIKzhhYisvME9wR3Z5OW5mNEVsdVdZa0JCRXV2?=
 =?utf-8?B?R1RCMG94dm1JeklzazV0RXI2cHJBVHRmL0ljY3lkYjUzQnF4cWhMSmNKaUMw?=
 =?utf-8?B?UlBlYWNtcDlFTU5aQmxOL1lKVWpyQm9WRk9FY2pJSjRhSWg5SlpCSmd2Yjl2?=
 =?utf-8?B?ZmRERTFGbzJMQW1SbVJ6RXJIU3FpYlA0cldhcG5IR2Z0NU1kQThHblJLY243?=
 =?utf-8?B?aXlhM2JiejFkYkZiWCttbEx1MTFKL0JQVjVTWlVmVzV5Rk1hUnhYRitLYktu?=
 =?utf-8?B?a3gwTFEwVGluS0FPbzhSSXdNRVNpOTVMT3I0aWhPcDVGekRYdytYdzd2b1Fo?=
 =?utf-8?B?S3ozdHJqVGZvelFRaGpZMTFSbEdhMXNNZGdrRE9tQUlLcktFWjR2RkRVejBO?=
 =?utf-8?B?WGt4dVVTYVVNUGlmT04vV1Ard1NBSmJLZjFETFZoVXc1Y2NZR2N1b0RKdmFV?=
 =?utf-8?B?aTJQQnhnYXJLUytHYnFHbHF3WFJHajB1WG5sdWN6alRSTUJpNkJ4UGtqQStB?=
 =?utf-8?B?blRjQ3FaWkRhcFl4RVlObTVmS1N3dWx6eW5lbzB3aDN3QWpuK21JakJrUzJ1?=
 =?utf-8?B?dGM1dWhENUNiV2tHWk9OdXlKZDZpbjl6b1NuY2E3czR2Z0xyY0h6OEFKSVBX?=
 =?utf-8?B?YkZwemlvMmZ0Q29iTWQzQ2NuRlNTb0pzR2c1SDlHUktGWWEzTWVLaGJpQkpJ?=
 =?utf-8?B?UXVLQ1RkT2tCU2ZMWDZoeVVzMVc1U1ozdWlmN2xVbEdIdEU3a0x3aEVlSjB4?=
 =?utf-8?B?akhBdmN1KzRpRnl2N2FXMFRIbFN5ZUVVVmJVU2h6MVFVVnpCVjM1NE1Gczg1?=
 =?utf-8?B?MnVCWHowUHlCRjVvY3Y1KzVhVkVqdUVhY0VSYnlKS0ljWkJwL01GcTBxbmd0?=
 =?utf-8?B?ZVhESWJac3pEM251aXhFdlA4dzF4blNWaUdVcUIxY2R6MC9sZ0dtRTZiT2RD?=
 =?utf-8?B?dlZEVW00aUNPU2pvdFdSOEhranRCUGVjeFh0T0VhR2srKzNDUEVKenUxMlE0?=
 =?utf-8?B?RTRJeDJraTNkOGFIUmREb1piQU01MEh4czZrTFVTYW1lNkNnbzFhMTRka2Yr?=
 =?utf-8?B?aXVyUVp6SmtNWGJiY3hsZUQ3bHhMSWkxN1VoQXg4NmJ5NjRUWUpNMmFUa1FM?=
 =?utf-8?B?SlBGalpDbU5aa2tYYkYyam1KU3dGU1hjZnBrSEk2cldXcGhySStrLzBmbS9r?=
 =?utf-8?B?Y2pOblJDUHRZajBlaHZrQ3FBWU91M0RCRzNoYWFVTlhUTXlWYmRYWEhxaXVm?=
 =?utf-8?B?d3ZFQzdPMzIyaWwrcldPYy9CTjJrWU93MVU1a3RIMUkrSFhOdlJ2M2ZhQXFl?=
 =?utf-8?B?QUp0ZGFXcDJxaDlwOURRMnJ2c0N0dENldldzWFZzS0ZmblhRZDJpK1BHSk1h?=
 =?utf-8?B?bmpLRkdwMjlOVW1wY011d2hPMmdhUk55R1VmVUFuMFExU2dIV3BTeVR2ckhq?=
 =?utf-8?B?bGRuN1pweVZBK3BkeG10VWJvQUNEbTMzOVJoTlNwclNOZXNEcW9xakdjQTVP?=
 =?utf-8?B?Sm9scVhJaDFCVHcyR0FscDFZdzVvZTBkVkxqdGx3RVlCS1hldjl2T0ZnMmRj?=
 =?utf-8?B?QXlMNGRFOUZpYVd5Z3duR25NdlFzb1NZdkN0cDBsVHhRZFZmNWtmcUp0TjNU?=
 =?utf-8?B?bnpCaUMxREtsWHBieStWM3BHdFFScnpWaVBlMVM2Nm9qbzhTZW1zbGhuYjNp?=
 =?utf-8?B?aG9UMnZERkFra2N4amYvKzFLTytsYzV2UFpOenlTQkpFcUE3cVRkTFVLZVZS?=
 =?utf-8?B?Sk1ITjBNcXlIRlZYZ2FIcXJPelBrYmJFd0VoYnFlYUtmc1h6aWtOZmx6MnNG?=
 =?utf-8?B?MVlNdlpkMS9ObTVZSmlpQ05tcEx3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OjD1CwVBdf8UfsybsnLuFCnodjQQNhapGi2/SZeAGh1lKSmSMNJn2DSlhoSrEhHzKk1h1nHDQVG2Y+y1xT79zPSGotbmhlfP33myk8ZLdZyU4gkcfmUg2g3a5fqzqOvyX4TIW3G+DPr1KdvOIfWVE5kJDs4on2udC3ITwfEEgZNOS735gd7S+XN7yOJiVq99hYPqNrWEcq6iq7/Awby/4q5NYz/nXqD1qo6RMTO4Ki6+fLqldtFZSesQqebEVJrQovMpSb/rM5K92aZOF9isvQ+9+tYyE33JSEpAR1TWEP7NIEt7d28/BVE8D/0LmBhpJRfETLnvnP1sx2dISeMAJomcn5Fbn6B3efHC6PuDPEcWFWXYkGONuOUb1vqGbrbgEoSmGBcFePAtQIy10EDzj9DxViK73hTr/AUlXSLwdxpKdS5tRcKJPIULym9zlTEd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:21:00.5492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80021a9f-93d5-4c2c-facf-08de73860693
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9012
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] gpio: stm32-gpio: prevent the use of
 the secure protected pins
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:fabien.dessenne@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDD4918474B
X-Rspamd-Action: no action

Hi,

On 2/5/26 09:07, Patrice Chotard wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
>
> The hardware denies any access from the U-Boot non-secure world to the
> secure-protected pins. Hence, prevent any driver to request such a pin.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/gpio/stm32_gpio.c      | 25 +++++++++++++++++++++++++
>   drivers/gpio/stm32_gpio_priv.h |  5 +++++
>   2 files changed, 30 insertions(+)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
