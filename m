Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPaNK91PhGkE2gMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:07:57 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2403EFB9F
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:07:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CC5CC87ED5;
	Thu,  5 Feb 2026 08:07:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53934C87ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 08:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg+EN2MgOXXg1pHUr9jJoYXhHqDV/jcPfxAVAhKxnp6Uu9jt1kE1KZEQlddq41FdOS2WxW8c2LpNWBtDp3LlLdadh6hUbXi3Su2jxyjBUU/zT1oGrggDIK3SVMQhXcS5Av5O5ZTYG2/dvTw2JOBDtey8I67AFp6NTNvpmhcm+ovMCBSaPPyQwOQfPGEWva4Y5N0p2LPn0+el6JWmH+LqXWWavkY0TxZUgSFQakajf4Ho03VSbb74cy0bI2tUOILgSzdBioJmau0x9fXcEDAYNFLx0d6sb4pjAwkmePDAEnLE26E1Zzq5Gt2YZWj405OvFDBjuwV8m92g8WwGUYWDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuLgZ9lFYAPuU1/Smls82f9cHTzUDjkdCLX/wGEBqVA=;
 b=vvjxCzCTS5kjAD2Dlz+DzL4BLKqQKUaCP0xTxgBWL+cE3xZ1n8fHZ4DI0cRu3rFmuOO6J5kXbOlD+i2/8aa0LKPXngEDduAHeGlbxsht8Pb5GaN9ReIMdMRXsKv94RwjQBjtqW3gVXk/hg62VzB0N5yeedXZ1aITY+NNW5+0CXO5WnLZUtJmJ1ijJT4tt7cj6ydIeVzyHQs+npr1pu8HYHcZhAq7dkrjHSNHJ4kJNNjIv9DSaqWD6G2ZX48SAtbWVvEF2lCKBgaEBNclwFKUTgU/Mpe2eifSbP5e43WkustCUQErLp9rz4lu5SmAZxPaQyPkp/LX7ipibx+/MPACWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuLgZ9lFYAPuU1/Smls82f9cHTzUDjkdCLX/wGEBqVA=;
 b=G5Zyx1WUOMeJ+AXEtLAIjdj7DHcdnBS5Le3qUH4419Oe0GiPMMknOGLLdEYYQ6Py/+XmmKVvMrIC6stIfIJ5F2ex0PP7ulqgzw4zjufU0Ho+y+RQP3EmqpbfisnUZ8lTLFEoWK/MU06LNyx/aEKvs5oywOR0h/9mgwqasHZtyQfx0ZMHMcewZMUa49cxDA9S+t0EDG2kmzDljVs5p5pL995hVMzGuUfE5ms+3OTN47frsbbI9Q+0x3EaHb8Dgav1CwPaQcHc1ZjLFgrUNOanUyYrv1uT/o9Bp6rW0KUNCLJ8fY1Qu7NuoRCCTC29Vt+gKb/I8EU9yzaXmexgNluWPw==
Received: from PAYP264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::22)
 by DU4PR10MB9432.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 08:07:51 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:102:11f:cafe::fd) by PAYP264CA0035.outlook.office365.com
 (2603:10a6:102:11f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Thu,
 5 Feb 2026 08:07:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Thu, 5 Feb 2026 08:07:51 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:09:30 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:07:50 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Feb 2026 09:07:49 +0100
MIME-Version: 1.0
Message-ID: <20260205-upstream_pinctrl_stm32_update-v1-1-3a3797af498d@foss.st.com>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
In-Reply-To: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|DU4PR10MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: eac3813f-454e-4b38-64fc-08de648da879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUd1cS9GVWJSZHljVmxQaWtWQkw2b21KMmV0N2pKZ1hCZ1VDbTdieDhhUGVC?=
 =?utf-8?B?YjkwTFBoZk5UbEJEb0ZGL3JXRi9BYnVnWitnSHlnUjJZc0pBK2tsT3VRWVNN?=
 =?utf-8?B?aW5NZVM3T0k4SjlCYXJ3V2hSUXk0STlGL0dsUG5lNzV2aHc0KzdxNFhNcXdJ?=
 =?utf-8?B?eUJpWngxa0N5SERiM0RjRk1mUXB1U2VabFhoMENuNkJOczM0TURHc0VhTHRW?=
 =?utf-8?B?Um1FMGFxb3VEeWFhTEdkN2kvK0RaTkE1NmR1N0lxSU5LK21PT2gyNTRXYXJG?=
 =?utf-8?B?RWlndzRHMnBoU1N4WU11cDJTQTBoNzVHM1lkNUFkS3R2R1NoQlhCWHpncm9o?=
 =?utf-8?B?RUdodXlnR1A3Y3hZb1ZRTnh5YkVLZjVtYmFzbFJZY2c0RE5PL2E1aFd1ZXhH?=
 =?utf-8?B?eERlK1pNWm91eWloaTVHa2hPUTZhSDh6eC81SHZvOE5hQ2NITFIvanF5UStE?=
 =?utf-8?B?MVBZSzhKQUkzKzRSM2R2ZDkwZDJDbDlpaGtrQTkrZXQvREI2RTVyVkpJSFhw?=
 =?utf-8?B?bDRyK1BKL3YvUy9ib3FxREEzeUEyVVpJN0l4ZEpYZDRJdWxCc09ITUxBbm5j?=
 =?utf-8?B?QTcvZTJEdWpDY25kZ0JMT0ZLSmRoZlR1aTM1Rmx2Um5YOGRPeE50QjAvY21Y?=
 =?utf-8?B?U3RuaXVKbDZMKzFhUjQ2bUpMOWdha1BSMDRaMTFFRllhTkRrcy9teGJyZGdy?=
 =?utf-8?B?UFJMNjliczF0MDU5anpQSTM0UXYwU3RHcG9lQWVDbWhmN3FHNUwvbkdBejhu?=
 =?utf-8?B?Y1JKZHE1OVpuZVR0ekdGaGVnamo0cDJTaVZYRFVoNExnMnZGNW1BQloxcmNJ?=
 =?utf-8?B?dE1Cc0NXc2UzYXlKRVdsemVVWmQvZDh6RUN3ODJiOGxuRVgwQ3RMUTNVNVVZ?=
 =?utf-8?B?VDk4Wm1ZSlJIVSs3YXprOEVBZEVjOWxsSklRMy9wUFhoZE9BSGFwVTZ1Q2hh?=
 =?utf-8?B?T0diOGZFYnI1VVN5VHRJWk9WdjVSbDh3aFhDbU1ZOWJ4U1U5QTlwUGVDczJE?=
 =?utf-8?B?VGFjZzZoR29ZY295TVFEMlBDU1ExdzJCK29qNXZqWVlZT3BEU1RlUjRPSENm?=
 =?utf-8?B?M3BSNUVncm1KUS9ZNDZScmQ1MjFLcE9ITmhrdTZBMXV2bXlWbVdocEVCaHpO?=
 =?utf-8?B?eUNxM1ZmQkZDTXMyNS9hV0hxaGV4aEhXRjRrR0FyY2RzMkIwR1B6U3Z5RzIw?=
 =?utf-8?B?RU94dHgyaTcwWmFyUmdFR2p1Sk94SitmZnRhS0ZBUzFsbm1LK3Bjb1FmVnpB?=
 =?utf-8?B?QWMydVV1N1Y0cXpHOXoyTWpYaGc3ZmFDMVpzdkw4MGg3SW93VzZhaEZDMWFm?=
 =?utf-8?B?NEVNRFhld3hJaENLd1Q1aGhoQjYwOVdrWVBVYlpnVWQ1YmQvc3I5aTVsM0sx?=
 =?utf-8?B?ZmhSc3Q5NG5WNEZqQlBIcytUd2lVaDJCb3hUemdaNmM2V2dFbWdnTUJNcXBh?=
 =?utf-8?B?Z3BidjJaQWFMZ3BaUFlHaURwVFJ5eXZLZjVjTWU4SU83c05XaE1pVkp6MzRu?=
 =?utf-8?B?R3JpN2YyL0l3eFFhVDU0UFUxN3k4aWNDU0h1blFHODAza1IrL2NYR04xenQ0?=
 =?utf-8?B?OUJqcGZDV01jQndWaG1nSHZQcmpaa2kvd2lYdDdWekVUa3hoSndNUkt0YXpP?=
 =?utf-8?B?cEo2Tmt0dDdNYTg3MDljSjRFVHdqc2JtN3FYajZ1ZjJ1MWtuVG5IN093TmxO?=
 =?utf-8?B?N0VKU1pSSjRTQ083UmJIZGZQeXpKdFZYMXA2dlkvRTFtUjVjc25WRnVZU2t4?=
 =?utf-8?B?d240NnFUbkdpTmYyYUVtM2NnOGVDUGNPSWxvL3pSR0xhYzhTSi9KUnBjL0U2?=
 =?utf-8?B?NndyUDR4SHlsT1VJLzBsVldLaDhWcjZYTTRQN1krUjluWGM2b21JOWJQaVNK?=
 =?utf-8?B?V2ZNRXZIY2hwYlh4dlVmZCtQRWdUZGxkQTMxVW8rY3VTRCtNWFJaTUZOdlFY?=
 =?utf-8?B?NXo1b1hHa2pvQXlodVdWRmhNM3RiN2t3VnBrTktiM0Y4V0g0cUplVVVEdElp?=
 =?utf-8?B?cnk1VG1hNHNFUXhMZG5ZK0JXaVRCeVRnanl6dVBoQ2UxYndaekJPTEFOVFFF?=
 =?utf-8?B?VXdFdXZBdXY0UkNvQzRSc1ozN3JvckZKQkxwVnQyUzJjOWVVSXhBYWllaXFQ?=
 =?utf-8?B?cVZwWmZ3c3BzS29EUDI4QzRpM2czaDNDd1lRUHhETnhZcHZXdVNQMXRldlNh?=
 =?utf-8?B?RXNHVUVFSmlnSEY1dFMrVG1GZjZoeXV0S3lKTE1jUU13ajJ6OSs2ZWQyT0Zn?=
 =?utf-8?B?aEtOVCtPL281WjE5SjRHa28yNG1nPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aDf57dGK7ufFFvNoQDDLFEfOrSdQD7N+ksnSSOrfTmDoBXij219UKwIM0KjJS3p9uaWNaHaYSjiukjt68w3qPpNUYohWdF5EGYob5ZSWFlwkx+2AnC9g8ud38eeabn38pw2uyAQlHi+lay28XgmeJN0KRCjL9WwmzYI/9WaagezEv1/jnhDhzr9pqOxAKhJYglrhqQoFX8hv8lB+z8h3JB1AFTVVM93Qu3jDqdBb/LSXDcIpW8e0rnQqy72Ss9aPBp9yhv3Lhc8l6KqDkSYL3eNTJZ07EKTu/SyfLUt2h9t2BgtwyW8nQznB/1ZjqFlIxJ3ibu+LKDE7rPhso8x04wRZKXKgIr/DxjIVB3oRS7F9Z36m4ZfBiBAB6jCwMWCbCH2h3CO6ZhXpiMeF573JvAe7I2v/zmFmbl8wOY2qL8lykRpV4cOuUjbSP/wAyNU5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:07:51.2101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eac3813f-454e-4b38-64fc-08de648da879
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9432
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] gpio: stm32-gpio: prevent the use of the
 secure protected pins
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,stormreply.com:url,stormreply.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[40.107.159.0:received,10.48.87.93:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2403EFB9F
X-Rspamd-Action: no action

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

The hardware denies any access from the U-Boot non-secure world to the
secure-protected pins. Hence, prevent any driver to request such a pin.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/gpio/stm32_gpio.c      | 25 +++++++++++++++++++++++++
 drivers/gpio/stm32_gpio_priv.h |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index b8eb55465d3..e354a4148ca 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -32,6 +32,9 @@
 #define OTYPE_BITS(gpio_pin)		(gpio_pin)
 #define OTYPE_MSK			1
 
+#define SECCFG_BITS(gpio_pin)		(gpio_pin)
+#define SECCFG_MSK			1
+
 static void stm32_gpio_set_moder(struct stm32_gpio_regs *regs,
 				 int idx,
 				 int mode)
@@ -89,6 +92,27 @@ static bool stm32_gpio_is_mapped(struct udevice *dev, int offset)
 	return !!(priv->gpio_range & BIT(offset));
 }
 
+static int stm32_gpio_request(struct udevice *dev, unsigned int offset, const char *label)
+{
+	struct stm32_gpio_priv *priv = dev_get_priv(dev);
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct stm32_gpio_regs *regs = priv->regs;
+	ulong drv_data = dev_get_driver_data(dev);
+
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return -ENXIO;
+
+	/* Deny request access if IO is secured */
+	if ((drv_data & STM32_GPIO_FLAG_SEC_CTRL) &&
+	    ((readl(&regs->seccfgr) >> SECCFG_BITS(offset)) & SECCFG_MSK)) {
+		dev_err(dev, "Failed to get secure IO %s %d @ %p\n",
+			uc_priv->bank_name, offset, regs);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
 static int stm32_gpio_direction_input(struct udevice *dev, unsigned offset)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
@@ -238,6 +262,7 @@ static int stm32_gpio_get_flags(struct udevice *dev, unsigned int offset,
 }
 
 static const struct dm_gpio_ops gpio_stm32_ops = {
+	.request		= stm32_gpio_request,
 	.direction_input	= stm32_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
 	.get_value		= stm32_gpio_get_value,
diff --git a/drivers/gpio/stm32_gpio_priv.h b/drivers/gpio/stm32_gpio_priv.h
index 662a000fe73..d89e9b8ed60 100644
--- a/drivers/gpio/stm32_gpio_priv.h
+++ b/drivers/gpio/stm32_gpio_priv.h
@@ -51,6 +51,8 @@ enum stm32_gpio_af {
 	STM32_GPIO_AF15
 };
 
+#define STM32_GPIO_FLAG_SEC_CTRL	BIT(0)
+
 struct stm32_gpio_dsc {
 	u8	port;
 	u8	pin;
@@ -74,6 +76,9 @@ struct stm32_gpio_regs {
 	u32 bsrr;	/* GPIO port bit set/reset */
 	u32 lckr;	/* GPIO port configuration lock */
 	u32 afr[2];	/* GPIO alternate function */
+	u32 brr;	/* GPIO port bit reset */
+	u32 rfu;	/* Reserved */
+	u32 seccfgr;	/* GPIO secure configuration */
 };
 
 struct stm32_gpio_priv {

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
