Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGgFGjX3gml2fwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:25 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6CE2BC3
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 08:37:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B5B9C87ECD;
	Wed,  4 Feb 2026 07:37:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03EF4C87EC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 07:37:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZHQTjK++dS7sFbXZrwWVyv0Xs5uAoo/mKbO4Mu9vG8fRxHxtCPixNK83t0pszoe+8tBSPdM9cR9XcsGsIM14BHyxSc9AzNeDXerpww9SmGLJ53q7e4HxtoLij5qt5mjk0eHTZkOZk5r+3k4eHumXj4PEoqBZSuYH0PxlNr/61jy8Jf3C8ELv5hw4kL9ORRotB3RtGSFD3YS8TiunD7vKkX1lVjuzB1SSj78+TqdJcWWACsQTrjypeXm2qhKb+pGJMlWoZLDyh5JRaILF3fo/wMguTEmjwAeNvjINm2CUGDDl8qCt5o3zgVr4YcYp7N37WXtyRVY14rwMw6Pzkxj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/pY38Dn3An13b6RRsx2yFRffbyzDHhRE7996k4w8ok=;
 b=sYgypRVrfiofQ1bd0pbIrnlnpLpOwRD555+kjVNbWX0S5Rr/DtfR9sAmPnjkVKEMxVc38ade8wTcOU0mo2cWhmHrAEUsXN4bxBshuwaLlkUAZJgaycKXgPXY1altMmo/vFgfq1gMgHOQ29WGaLdT4tc4SJceSkGXOd+0X31FWa5Ni1ItQASvBO9ul7abW0wpUfnOm/3NgOuJgMzhy/RNe4qWFeZGc1HccgSrAxhdnmgDtAFuSQ6Nal98aTpLMQx4U+PTSwIpfi36Ejhk+pN7oH52z9BEqYnBvvsNjL7ipTRZaP+4bEqwI3kHwF8cpzhdEkS2H6UTnJxDnSUcOFFDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=eds-india.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/pY38Dn3An13b6RRsx2yFRffbyzDHhRE7996k4w8ok=;
 b=OTRyLBvD7zTyCAFdIlQsH8pQ+RjLEDO6G23gk4PhAqNmLc0skFVoxDn76f7/CeGlpXw12MT6b0LOWGA73hlMdL/znUI8d2u0Q/u7AcMtSsRrwWdqvmN0dMY44FV8JMFR9S/zRxGVBx37XQHvsyVYxJr8PPLltZ/XafZqWI4kxTJ4WwFAJmEwAN7cayavtiOKYAkFYel+7w2A7sxJGIWwjorfU2IXj6bak55zhs40B2WQyMl5feSay/eSukeYRydOZawKvP4m4nOM0vrOPxAPQV1/WvZfotmg4JZHzxbUKPlAysRS7+tlxjztzUBKwj8WjLW4d1+88g7P4EwI94NP3Q==
Received: from AM0PR02CA0160.eurprd02.prod.outlook.com (2603:10a6:20b:28d::27)
 by DB4PR10MB6311.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:381::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 4 Feb
 2026 07:37:20 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::5b) by AM0PR02CA0160.outlook.office365.com
 (2603:10a6:20b:28d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 07:37:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 07:37:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:39:06 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 08:37:19 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 08:37:09 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_factorize_and_update_read_idc-v1-3-f41a063c28b9@foss.st.com>
References: <20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v1-0-f41a063c28b9@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9D:EE_|DB4PR10MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: a6116a54-33b1-437d-088e-08de63c03ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzNaQVhCOGtYSm0vajVqWk0xSnAzbVdWNXhIVkFWK2FuTU03VnRGVGkxV0hM?=
 =?utf-8?B?ZWJibDN6RW56cW0wd21NWEpld1VjdG1QWW1BRC9WVDI0R09ldHdsbElvZWpJ?=
 =?utf-8?B?TWxlMUg3TEpwcG84Vm05L05wQ240MUpUQ1VNZEdDOVVrcmZCWnJwWm1XVk45?=
 =?utf-8?B?Z2lxY2YxSGdZRFN5dGxhTlRETlhBTFpmNHFNV1l3NThBbWdadGRheEU3L2h3?=
 =?utf-8?B?aitlUmZsT1VPaEt4WHFCL2t4V0NMTno3UFVuaXNnamN0Nk1kV0xlcFhkMGZQ?=
 =?utf-8?B?UTMvS3pLa3FwazBMUVpodGtJK3gybzN0K2dOWWdZS3lzQmdhbXBkSzIvTURo?=
 =?utf-8?B?QmRZdVBad05YUWZkdFlYQUpLaXNIaWZtMEpSb2RrTkpYbG00cFJtWXdYbDNp?=
 =?utf-8?B?NUhuTmMwZHRVSG52NmV1SVNtM0Q1NTlTS0IyM0RrbVBDS20rQ1hCd1ZYV0dX?=
 =?utf-8?B?VmF6Tk5oZ0YxeWxBTmZDWHk5RmMyNWpoU1lvL2N5RytZeXVycE8rd0ZLY1VK?=
 =?utf-8?B?aFB0aVc0bEY0SEtpais2ZU1CQnJPTkZETFB2enA3ektORU1kNXkrZlBEUmVr?=
 =?utf-8?B?TlpEUSs2eDJYanRIOEJ3U1MzK05JcllwTy9ISE9QeWJqZ0FhVVhDV0svZ2dp?=
 =?utf-8?B?dFlRZ3JRcmp0OUVtSkFyYUtPaG9hYmMwSHdsQ2hXWi9BOGVqTmJoV1haQUVn?=
 =?utf-8?B?cWJReVE2UEVjZTBUTHNmbHNYYk55OG5jR0IwOHA0aHBxK3JLZzRSazA4OFdQ?=
 =?utf-8?B?aXhkUlIrazQ3Z2hKbWMxR1FuamNFdEZnK0tkcUd6emdVN2REUGJkZVJqRGxZ?=
 =?utf-8?B?cXEvQ3VRUWtXVXRWK0dHTS8rVE83Z1VCeSszZUg3T0UreEovMVNaNVBFK3k3?=
 =?utf-8?B?MkE1bGxRWXZINFU5Uksya1U5UHg0QlpoZjl1VmhkaDE2bHdkUlhlY1hmUWVR?=
 =?utf-8?B?a29rK2krc25NYzI5QjJ3RllWMFI1YmErY3hKeUhEUFVNeGtpNHVmL1BTUmFq?=
 =?utf-8?B?YjQ2b0VnWVJWbE4vc3dBNEt1OE5mVGFnTzZlengrMmFTRVYyR3BYY0ZEc0dl?=
 =?utf-8?B?MGs0aGdSY2tuRnhHN09XK09CY0NFK2VLT1FvUlYrbitaTC9yQllseXFhbldM?=
 =?utf-8?B?NXA1Q1pKckVzN3RBSzIxM0d5WU1Rb1pCRk5lbDhpaXhCdEU4RjZvUWY5c1Nk?=
 =?utf-8?B?ZEhaVEJxTkh0bXRNeWN0WmxiaFNxRmM0OVFCS29LOTBCRzlxb1ZMNEt5WWRp?=
 =?utf-8?B?bTMvUEl6TzRDdUJYMUZGcDd6OTgzVG5IMldEOFpSOG1jcVF0aVgrYUY2K3dD?=
 =?utf-8?B?ZWFUUWduRWtRNlY4V09nNWY3Y1BNV1VDOUFPTTg2ZmRPWGdNekZXdkZpeEFs?=
 =?utf-8?B?WitGS3NxeTZhTi8vRUhKbEdEbTBhWjAvemRRVmgzVlNqVmVvd3hkbzRDbGVD?=
 =?utf-8?B?L3U3TEt6bTVEbVF4RzVEdUgvZkJ2R2I5dUlacm9zNWJaS1UyV2xHeTErZEo3?=
 =?utf-8?B?NUpkL0FoOGZPQWtQWDlwZmMrK1BNOERMRGpDV3dSNU93V01LT2lVcTY1TkE5?=
 =?utf-8?B?ZXFXQjRyNDBoc2M5ME4wRVBKb0ptNlRCY1ZReHVsclpxeUpaNXAwOWVEY2gy?=
 =?utf-8?B?T1M2U0FkSVZrK2lwMzM5Ri96bjRIWnB2U2hGeEtRcS9JY0daUHVUTTRaRkE3?=
 =?utf-8?B?eEZ3MGIzUjVYZ2ZIZVl4anRINk1uc0ZWTXM3MnpQSGdEcjArTkdpMGZlL1F2?=
 =?utf-8?B?SG9Ccm0yQUZUKzNuZ3hUaEpESDJZWDcybk1aVDZ3WEMweU1lZEdtQTNBYzI1?=
 =?utf-8?B?bmdReGRDYWxGOUpBZ2UrRUxycEpOdW1Rc0NHMytYaFhFNmEvalRKRFJLdFNS?=
 =?utf-8?B?b2dnYWhKQ3NpV3d6bjRBeEJKTHQ3ZUQwS201cTZWc09lNXB0dnE1TXd2Z0dl?=
 =?utf-8?B?bXd2SHJ4RDB0ZENmQWZaTk5FMG0yWG82NWJtK2hXWUtqcjlxYXhlcEgzalFQ?=
 =?utf-8?B?bGErdXYrODc1WFhpaDBGaklSRG02T1JHbU5OSnNnZHdJSmNNSGpBaXBXZ2xB?=
 =?utf-8?B?cGtMd3Q0LyswZGRjOHNwUStZY2RlVlRqV0lyY2lCeFg3MWxZNzQzR0xtd2lD?=
 =?utf-8?B?MVZ0MURwRWVaTm40WW9PUGJuQU4yKzlxK21Tc0NsQjJ3YmxOeENHZW5uWHJE?=
 =?utf-8?B?dFZLcHBqYzU5Z3V3NDdYQ0lZUkkxTWtiUXFDbk51ZFlXK1ZRK1VBbytZa3Qx?=
 =?utf-8?B?MXpDV2RPbjhSeU9WejJvMXd5RDVRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M60c6EJlXxPg3W8ATay5KTDd9krP9/oWybpqMy1ZJNnO0OkJ7mSiv/VvtIOxikOVzaHhJqYl/0OLN4IA1pENu3fMR+B7CUKF+tBaLw8LrUOLoEbzGuMkbPcA22mDk2dOAl7QNFVhEN7lUPB2gYMz7WF9bWCZbihd/6kLprHI3AeyqVNPZHx32Xz9XTglBoj2hOknJ6pRV4EeCsgCvKtgEuTwhiIaLNKVzBi6FjFa1clj5npxEnhfdTjzYCJvVqzbkNiW6qO/GroE9jrOSU50erxif12k3Tz7Rg3uKmJDg5NlZNX/QUWVXCvZem3FsVUbbgY1T+1h/Xg9uKArJeKET+4yhrd1QxuHa7gpT+UH335WTiQ4VGxD401WkvITP7RZ67qPZRNJPgt7HcxTc3kpUHcQSvWy6mw5senftLhPuyU6PFB3z581l6UpmM8nPYnf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:37:20.2253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6116a54-33b1-437d-088e-08de63c03ab6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6311
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Uboot-stm32] [PATCH 3/3] stm32mp1: Add check on
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
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
X-Rspamd-Queue-Id: 54F6CE2BC3
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
