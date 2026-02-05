Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGo4DedZhGl92gMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:50:47 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E0F009F
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:50:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D21EC87ECD;
	Thu,  5 Feb 2026 08:50:46 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013046.outbound.protection.outlook.com
 [52.101.83.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EDCEC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 08:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErpEawxf7nHwD2OdxJ53u59k9hrkXq8GSbue5F1f7hEWipyCBkZkCRWkzBKsQsbb5cjlizzzVy687cZ5LEYD+4F+mA+1tEQsKF/WataSecUZ5JeNWI+W0jd9eeK8wjBiFT8vADOYsrR4oLTma4kKbEf6/NAkzXAkHV06pci7wdGe0/KKg9HRO3eowBpwPuL98Q/xPeggS92r0E8lVwnf5I44nGDEDWvhbc3Xgh+LzEqJzsxdsgW6zzIzIHfSQX/hEg2TBFg1OSOmSbYSnK7hukFJOeySPh59H1ReImdaOFo7qK9mKoQmmYFygeAYZuBZ15R3J8skgQzWx4QC1abXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB4OId1vjz1+1AP0saUTyFY2Yjh5VVFvccXz6TxjrE0=;
 b=bC60GZ836tKi8vR1ZDJ7AWroH5B/yXFfJk2i+py8oHh7mbJJyrlyovblM88xeJ+Mu5q7R7or+i+JtXBqN3gyGhN4u12+HRA+hygqbmkdEHcfmMAdLrJmHAYW523dsjKIM/YisUyPLhVnNin1Dn9qRoAyMDlFUC8RXLWhbiLd4o51hMtmyWIAvo31C2s9URQzOEOp+6sSw3LPAmvUn8huNA/iCk/B5Kb82CzbV5EfraaH/nGq7ciKgp1fcbK6osdQ2ssRLdECVEcM15E5630Wt0x2l0aeez9DCcfM5GOFVkcoRAEoKGtYZMGU47ST+VCERc1TCQv+aLjXgsNWjN4A6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB4OId1vjz1+1AP0saUTyFY2Yjh5VVFvccXz6TxjrE0=;
 b=XFl3XKH2grPGqEL+dnsmEijfP311P286EGEXjqHTeViPAFLOeZX4D2WQDGwL+r7yzRu7RGAB+/53ppC8YSfxO5SPMIL9hQqambAcYG5NOhENAZ3fSo0WC90gnwfQ9Delwxs/O2yfAWz5op4hkJrL6hHGBQKqmdOT3nipHBokokfuuFKpvocfNq9rTITSDK8vYXfKuYM7ujS0+tt0iNnEmbbF3IGaLt3SAh0mb8bKEYPT3Nio4QdfoDYNp9XklX2o+OWuMY7Uv70kLoCCVeJjWGxBcYOYRORJNocBfLSDBkqiY15amVT2iJlzhHXpBt1V/0CXF2krEX9Jqb4ANoctyg==
Received: from AM9P193CA0025.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::30)
 by PAWPR10MB7867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:35d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Thu, 5 Feb
 2026 08:50:40 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::27) by AM9P193CA0025.outlook.office365.com
 (2603:10a6:20b:21e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Thu,
 5 Feb 2026 08:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 08:50:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:52:19 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:50:39 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Feb 2026 09:50:24 +0100
MIME-Version: 1.0
Message-ID: <20260205-upstream_stm32prog-v1-1-578f2d835d2c@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAM9ZhGkC/x3Myw5AQAxA0V+Rrk0yKsbjV0TEo+gCkxaRiH83s
 TyLex9QEiaFKnpA6GLlfQtI4giGpdtmMjwGA1p0Fm1mTq+HULe2eqwpetlng65IXY6Zw76EEHq
 hie9/Wjfv+wFCrzQ7ZAAAAA==
X-Change-ID: 20260205-upstream_stm32prog-2683672562b9
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|PAWPR10MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: aec5fcaf-7e5b-4907-8f74-08de6493a3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlQxZEMrbjlZOHFiVVhJQWZJQ2J4RlVVTk92UElKVzlLQm5JWjNRbDFhSWgx?=
 =?utf-8?B?L21UQ2wwYkNMSzFzdUYrcVQyU2txVitPNHdoTlUzUkNuNE9TZ0tmNUMvdmlC?=
 =?utf-8?B?eDk5b2NjTVJNT3FMN1NUUWJjaDBvak8vamFYSUUvU1FWTnVWSHU0dkdPaHQ5?=
 =?utf-8?B?b1lDeVh5MlJBZkRIQ05rc0poRFZGenhOYnZzWEJkNStncWQ1T0pNZUk3UEs3?=
 =?utf-8?B?Zyt2YytsYjBBK01RT29CZEZHU00zUTRDMFFlNmRacVdmcGJIN2RlR09Zdkhy?=
 =?utf-8?B?SGp4UUQ1UklLZXlpYjQwOGtoOFJ3RE42MVhpV3FNd2hucEN6dmtRS3l4YUJ6?=
 =?utf-8?B?dTUvV3JQWVhia0s4QUdGT21QSXdLWDMreUEwNXozdGlHdzZxRnQxOGVUWlFp?=
 =?utf-8?B?UGRoM05nWEZITmloSVA0bldObHhhc3BZa285NUNYRW5mUTJ4NWJYQVFsTzZE?=
 =?utf-8?B?NlFBNitxVEh3eUF1N0ovY2oyQjhUcllLT0ttcVNqZTc0TEdvSHFxUGJjM1hp?=
 =?utf-8?B?UzFhQ3kwTjJIZkxOYnBkMGlHRmQ4L0dJNGNzZ3ZwZ0o2NytVaDVjRWtoS05j?=
 =?utf-8?B?TFcvN0Q3NkI1TEFSdEtyMjd6MHhCYldyMEswTUxZemc3UmxrLzN2MnRJdm1X?=
 =?utf-8?B?K2V0UndYdXZqZkREVWNHb2pkL1NRL1BtV0ppQ01CeEZnR2p5QlNKMUQyTXJi?=
 =?utf-8?B?d3g4TktadUd2MHg3c2hDWXRMSFZOdDdFdDdQNXpKZUs3NzZHRVZ3dUZrcGJS?=
 =?utf-8?B?OWRGVDJ0S044ZENhS2kxK09XOERCVXh3RTdlUjYyczJ1U3VrZkdTbGtidVda?=
 =?utf-8?B?U3VNQlBqeW5DblNJMHR4UHZqY2FMb0doTGxyWng2THNHZ1NiQVY5bW5uZ3VH?=
 =?utf-8?B?cnk2dElVN3JPT2RnUlgvMnp5L2RaMjJSd3pTc3VEQUFUdVNMdWxaRDR2dzha?=
 =?utf-8?B?aTY0UWFaSDlrZkMvc1dldE5ZZEp0bnpucjU0WG9mdTJ1emg3UjhweXN4OVVK?=
 =?utf-8?B?OVU4Y3pEZ2J1dnVpK2syekhtUCtTTXNybnJnRzE0NTBCTmRUU0FwQlZCbHQ4?=
 =?utf-8?B?TWxqQ2pmNlFtWFE2blVxQ0VmVDAzWWdTUDA3Mk9MY1hSR3puOGg4aTJ6c2FC?=
 =?utf-8?B?ZmU2T1dSR1J3Z053Ukp0U2ZFZUhzS29HTmVjU3BpL3VteW1CNWczTjI4VXhN?=
 =?utf-8?B?SW5QOURtQ3ZKK1c0NUd0UzZIYVFwaGZYYlVLWUJjeVQ4aW0rMURESkZ3Y3g1?=
 =?utf-8?B?SnJZU3Z5ZVR0eHl1WW5PLzR0WnR1N25TTHBvemI3dUZqTlBDaTFkZlZ4clhF?=
 =?utf-8?B?RWJzWEJLd1o5TnE1ZlV3ODV6cVA0anhiK01VdU1mT1pYNWdMeWl2bUZEci91?=
 =?utf-8?B?SkxvUDkvc3Q5NHhNMjBnWnZqcUllUFRJSVdkUDJMT20xMjRzbEd0WHNzR1U1?=
 =?utf-8?B?VnZJT3JhWlU4KzhVTjczNDhBUlRka0lKb241YTR6VHJuUU9YM1hNaVEveWFS?=
 =?utf-8?B?bW5LWFJ6UkN5NGd4WUw1eVNRYmZ4eWNzOU5KWFprK2Q3SjlNL3B4VytFL3dE?=
 =?utf-8?B?WTVZOFJPTG1nclJQU1dQK2YrK3lYS2w2ZDJ6WkJUR0EyV1B1STNGeFdHSUQ2?=
 =?utf-8?B?bVVnc1pEUGNMZ0RjUXQxTHJVMElPb1FyNm1TSlcvQ1RWRC9HMENFWE4zdjk5?=
 =?utf-8?B?ellxVk9DWmdseDJ3T2hhRkdwUyszUFdzQXB5VGF0Wm1qUGdsM2dHMkNIUWph?=
 =?utf-8?B?cVRZeGszVlNzSGp0eCtrMVVXT25PbThraEpJTWVuYyswK2JtYUJOZnp3Z1di?=
 =?utf-8?B?MmlDN09oMjVJODRDQ0VTS042cWc3UjhWOVJ4OE9UZnR3U0xjZ1J6azRZYkFE?=
 =?utf-8?B?MUVQUnF2ZG4yb2ZzYkpQUmV4OXhiay81UXJWVmZabzNKWkZ2VDFsSkRTZHJP?=
 =?utf-8?B?aVZDU0ZHbDRWU2prQzNvU0dNL3FOVlFobDYwQzl1K3NDNTNraW5ISmwxQkNS?=
 =?utf-8?B?UVV3TjNvYVduQ2gzWUovckhUdXdMWGM3Ukg5OVlxUXZ5Tnp4UU1sM2dvckZu?=
 =?utf-8?B?OUhZRUM4UHNhZWYzYk5tWUJObmNySEdReHFZYlFHRkp1eXUwOEh6SHY1TGRi?=
 =?utf-8?B?VWk4WEl3aWJVNTFpeFFGbS9SMnpNeGJudittNVlrdy9vODRLdm1VazJmMXJN?=
 =?utf-8?Q?bm5T7cuymgZJJyyR8mv5bgYF2X9mZ8GneQm0xl0DNpHF?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l20OIdPXb5N8WaKEK9mOsH8irNXpr+q9xUa8JVotiY21rpz7Q/dPvZjAvJPARnz7mHLomuXcfA7udniEeSJ9nd30B8stRucygTwSczQCETblaWBQcPkyn1j96ocH7Lo48Mtj1hL/mAs9NVa9/jHxnoY4/Tlz6A32N3JsuEIsTOyhKx07+fbRjC1ixdJtEwOYUZYjM6hOygv+8hvRKE9oJ4r7FECV7kGwmTAb7aZTgrPxjjUHhL28vlwR/EW2Q4Veg524hl1HKUvEhNHsXTCg9l3N0f5d5LNHDYIU+FJdDQDnGLTEHDbtEaklHYcfJdtoj6uHxHvBwI9CKdHxC/7+YjAVY6vG0T2hsXC1hF9hABrZFo0941uNRND7v+719E7YpKs6iAiO8tKpRjtG4GHcQifGFuB2Oe1dzJQ4gnOs96OVrR8YWCdUZRWGf3w32CdU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:50:40.1571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec5fcaf-7e5b-4907-8f74-08de6493a3b0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7867
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Jerome Forissier <jerome@forissier.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [Uboot-stm32] [PATCH] stm32mp: stm32prog: Remove fsbl_nor_detected
 from stm32prog_data struct
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA0E0F009F
X-Rspamd-Action: no action

No more need to test if a fsbl partition is present on NOR when booting
from serial or USB. Now MTD devices are automatically populated with
partition information found in DT. Remove fsbl_nor_detected boolean from
stm32prog_data struct and all code using it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c |  8 --------
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 10 ----------
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     |  1 -
 arch/arm/mach-stm32mp/include/mach/stm32prog.h      |  2 --
 4 files changed, 21 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 506ecac2ef0..24503bbe58c 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -187,11 +187,3 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
 	   "  <addr> = address of flashlayout\n"
 	   "  <size> = size of flashlayout (optional for image with STM32 header)\n"
 );
-
-bool stm32prog_get_fsbl_nor(void)
-{
-	if (stm32prog_data)
-		return stm32prog_data->fsbl_nor_detected;
-
-	return false;
-}
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 9acbc0689a9..835eaf48dfa 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1010,7 +1010,6 @@ static int treat_partition_list(struct stm32prog_data *data)
 		INIT_LIST_HEAD(&data->dev[j].part_list);
 	}
 
-	data->fsbl_nor_detected = false;
 	for (i = 0; i < data->part_nb; i++) {
 		part = &data->part_array[i];
 		part->alt_id = -1;
@@ -1055,15 +1054,6 @@ static int treat_partition_list(struct stm32prog_data *data)
 			stm32prog_err("Layout: too many device");
 			return -EINVAL;
 		}
-		switch (part->target)  {
-		case STM32PROG_NOR:
-			if (!data->fsbl_nor_detected &&
-			    !strncmp(part->name, "fsbl", 4))
-				data->fsbl_nor_detected = true;
-			/* fallthrough */
-		default:
-			break;
-		}
 		part->dev = &data->dev[j];
 		if (!IS_SELECT(part))
 			part->dev->full_update = false;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index bf184c8a884..929e38700e1 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -167,7 +167,6 @@ struct stm32prog_data {
 	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
 	int			part_nb;	/* nb of partition */
 	struct stm32prog_part_t	*part_array;	/* array of partition */
-	bool			fsbl_nor_detected;
 
 	/* command internal information */
 	unsigned int		phase;
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
index 23d1adfbad9..c10bff09c84 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
@@ -10,5 +10,3 @@ int stm32prog_write_medium_virt(struct dfu_entity *dfu, u64 offset,
 int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 			       void *buf, long *len);
 int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
-
-bool stm32prog_get_fsbl_nor(void);

---
base-commit: 1de103fc29761fa729dffaa15d0cfb2766be05e4
change-id: 20260205-upstream_stm32prog-2683672562b9

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
