Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP+8EhJ5DWqfxwUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 11:04:18 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D352058A5C1
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 11:04:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7ADCC3F944;
	Wed, 20 May 2026 09:04:16 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013014.outbound.protection.outlook.com
 [52.101.83.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71448C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 09:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyN2w91CDQz+9X/e7w2tdzlfPprpHiKttFgOE1Fzd+5BtDaaKevWlPjdc467kjx6FNkrYEMMM+rAIQSSm9w8ocdvDLcfQcHLOYZZPd/r55fzThCtV9CzXPTLj9/8ZoBhO681wTrlGcpV3G3nenvGK5aOqvPrlJM/BBJ/LWwjqMHa5znbcNc1hRTupcsD31D96N1YsbctRsrpMA2d2pggF6EXyMs+1B8gGB7XG6+FwMXQwj6N4jsrEywr5a8rQJvVbgFmJBOZND9aa+vcO1vQcgRXK3fL2E4TGYV8nEnGpeDtVra8nv4xMwkrbrBCnNYlI2zmal3IriCf9Z0+9ZWwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsZ3DFKJC7UXaHeO0WZWY63+eAglK7KS7fdOnEkPyPY=;
 b=HFc6k2L4kI0m/D71u4GrdJz4eQidbt/XWf5XpBka4jQjK2YUBuf3IKIGR281hl1Ie7GB+GwVk8JfoKa0914PzfqAJduXtls4wFN5pu40HjdezxoVADm/DKB/utkjssuPPIx7SIj/vr44cSa0kMPeR3sN+iSnP6dhVCiHByLodu7HipVZ0QXaIb/WVju5hAW5m6F9lL4GMIqN30hG0CxvP763KIk4V4OFHEooqzVZ6TaP23jjCRlygSwY1QFo/cC4Gn4cCobiSXZNg+BcOXZcSJZT9opMK6QIDjpsTHCwDFToVcQkS/SMKy4lN9q8uGFmu5XLj73P0UUr6o4msk138A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsZ3DFKJC7UXaHeO0WZWY63+eAglK7KS7fdOnEkPyPY=;
 b=HcmnEkM7v8SI4r0cXFbNFrOHCIoZqpOb0FBVq5qxK1RM70LT4Xr7rL/XyMO0RDtH6+Y33s8gzzatzYsnkKaXcJEj2dsu94xl3lMnHdfCpsuL6a+VkDKiwqr3A5huJSGcWES2TRz3AzfHsvyjF1WtkFfoNUW+LHPOzkNw8IstuYSluCjEUtwzcDumegZyUvWhLtznZOA1515NmEPYHbn6OKGk+ZYHQe95MqsZYc4jfpts0LGob2V6OsB9CjpDuJxxv9Z5pWlhKJXQPqxDU1sy9f9Y5xPcdoPGASmouShYUGik8canoMkT/UZBcAO25W49YmlDOlfcw0HBArwktaAH3g==
Received: from AM8P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::24)
 by AS2PR10MB7396.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:603::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 09:04:08 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:219::4) by AM8P190CA0019.outlook.office365.com
 (2603:10a6:20b:219::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 09:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 09:04:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 11:08:01 +0200
Received: from [10.48.87.227] (10.48.87.227) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 11:04:06 +0200
Message-ID: <9b59c08a-ea36-44b3-9c30-d1bd555f661e@foss.st.com>
Date: Wed, 20 May 2026 11:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yann Gautier <yann.gautier@foss.st.com>, Marek Vasut
 <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
 <20260519163145.221668-3-yann.gautier@foss.st.com>
 <f420eff8-6524-4797-93b7-0f9a1149e860@mailbox.org>
 <1aec25d4-3135-433d-8fcd-4ead7a065d40@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <1aec25d4-3135-433d-8fcd-4ead7a065d40@foss.st.com>
X-Originating-IP: [10.48.87.227]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000196:EE_|AS2PR10MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 19245b81-6505-4e77-8815-08deb64ebfdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|4143699003|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: SbUYZjJcPSpydh8o3OOEfv3j/FRLf0AZOleuHVVvOjzvjWV/OQ4xN4jONZ/Xu4pqkhzXN/CuZUPYjKFJphkoVXHpvYY0YyvYLQaWClNO0uZlOhV7h2KDPV1A+9LLqH8vB0gAzReKEeSDafBdIKt+3q3M3bUKixJImA/Et9r7Hdl4nYDANs4DS2Qy+b9VQCSQ2rTX5vSIci5NfC9SgOpM2l+xq7JC6/OsueHOEHgF5UXFlcAGHKfMaQt97CpxFWiunZUEWTiUCvVw6AKFT0L/qTOjrHZlWuRyZsHM+jMNqxNT7B+RUKXCV/Y7xwK6o5M5mP74QxAFHSoBUIDNYGYCZ9WSH9y718BP4yXIzs2B7NFcE5z8KOMxAcCWho1VktQWohjXh8iR/41+982J6dYaLZd0Df/wgoi5AaqEuq1b7CG2TI+Mv7PV1BOmvAzJygL4kQPczeHAHyRpMIwdVm1MXARhU2op+YkehhpewKQiOIhZOnXG0QgW02ZTHuDrrS6cimXWUNxVZQOADWgTPth3e5lLVWXj1bO17Pmb9+EOI2I2D9IXkaQJLCKyj2mIFfKLxa60H4oJnWuR6jdgB398cEfu8jU+T/6VDlmYcrOZ4fIxHnFLXa6vNHkEXsOmtfFLgbBjIdy4Pm1FZeFigqyVB8jvC0P4ZlMuWn0Nfbxdoj+LJEVUdlaH57fd8VA9/dVyONArBS+6LNnT4ruW0V36p0du5XG+XpZhXH4qwDooHfQ=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(4143699003)(56012099003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UhL9WfcNDSJwKvC28Sm0pU7M2jPWiUocljqrf4YngVxoZCamPW0deDESPY4aKhk6JPxTeMu1SLtRAy0xVKoVCfTK3609FpIpDvjHsKzLspI15StonxOUKqREw2sxOaDM8adit0vga/IBo0pzH730AMvVWgloT/OCbGfONcUEXkzAFfdwDSIs3MciSmhHPs49JwJRHBIV7GCFuSprz7gZNB55czsJJZz4PWDX20PWmAt52qY8U+WnJiD8Wt6Ndew2wmUT1/dkjIOt16MZiixCUdKpQIDEe9qnOHfX4fwRKSoLaVpGvnalSBLtmo+yuJWaDOelDdUCrNdhqn1Svceuj3/ddsC4B7U4fknIhvvyrz0EDTVp7/ZdOXcwW4s+Gqaz3/fh05cqCh4TEsRcax9er9nvrCcq+m8dCDDbBhXcm7Lc7sYYjPRSVbulqx9kTciv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:04:07.5102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19245b81-6505-4e77-8815-08deb64ebfdf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7396
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] configs: stm32mp13: activate
	watchdog
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:marek.vasut@mailbox.org,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D352058A5C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGksCgpPbiA1LzIwLzI2IDA5OjA1LCBZYW5uIEdhdXRpZXIgd3JvdGU6Cj4gT24gNS8xOS8yNiAx
ODo1OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDUvMTkvMjYgNjozMSBQTSwgWWFubiBHYXV0
aWVyIHdyb3RlOgo+Pj4gTm8gd2F0Y2hkb2cgd2FzIGVuYWJsZWQgZm9yIFNUTTMyTVAxMyBwbGF0
Zm9ybS4gQWRkIHRoZSByZXF1aXJlZCAKPj4+IGZsYWdzIHRvCj4+PiBzdXBwb3J0IGl0LiBBcyBk
b25lIGZvciBTVE0zMk1QMTUgKGluIFNDTUkgY29uZmlnKSBhbmQgU1RNMzJNUDJ4LCB3ZSAKPj4+
IHVzZQo+Pj4gdGhlIEFybSBTTUMgd2F0Y2hkb2cuIFRoZSByZXF1aXJlZCBub2RlcyB3ZXJlIGFs
cmVhZHkgcHJlc2VudCBpbiBMaW51eAo+Pj4gaW1wb3J0ZWQgRFQgZmlsZXMgKHN0bTMybXAxMy5k
dHNpICYgc3RtMzJtcDEzNWYtZGsuZHRzKS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Pj4gU2lnbmVkLW9mZi1i
eTogWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5jb20+Cj4+Pgo+Pj4gLS0tCj4+
Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdlCj4+Pgo+Pj4g
wqAgY29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnIHwgMyArKysKPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMm1w
MTNfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnCj4+PiBpbmRleCA2MjBh
NmRhMmVmZTMuLmNjNDE1ODUwOTdjNyAxMDA2NDQKPj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDEz
X2RlZmNvbmZpZwo+Pj4gKysrIGIvY29uZmlncy9zdG0zMm1wMTNfZGVmY29uZmlnCj4+PiBAQCAt
MTEzLDQgKzExMyw3IEBAIENPTkZJR19VU0JfR0FER0VUX01BTlVGQUNUVVJFUj0iU1RNaWNyb2Vs
ZWN0cm9uaWNzIgo+Pj4gwqAgQ09ORklHX1VTQl9HQURHRVRfVkVORE9SX05VTT0weDA0ODMKPj4+
IMKgIENPTkZJR19VU0JfR0FER0VUX1BST0RVQ1RfTlVNPTB4NTcyMAo+Pj4gwqAgQ09ORklHX1VT
Ql9HQURHRVRfRFdDMl9PVEc9eQo+Pj4gK0NPTkZJR19XRFQ9eQo+Pj4gK0NPTkZJR19XRFRfU1RN
MzJNUD15Cj4+IFdoeSBpcyBDT05GSUdfV0RUX1NUTTMyTVAgZW5hYmxlZCBoZXJlICwgaXMgdGhp
cyB0aGUgQVJNIFNNQyB3YXRjaGRvZyAKPj4gZHJpdmVyID8KPiBUaGlzIGlzIGFsaWduZWQgd2l0
aCBzdG0zMm1wMTUgY29uZmlnLCBhbmQgbm8sIHRoaXMgb25lIGlzIHRoZSBTVE0zMiAKPiBJV0RH
IGRyaXZlci4KPiBJJ2xsIGNoZWNrIHRoYXQgd2l0aCBQYXRyaWNrICh3aG8gb3JpZ2luYWxseSB3
cm90ZSB0aGUgcGF0Y2gpLCBhcyBpdCAKPiBzZWVtcyB0aGF0IHRoaXMgZmxhZyBjb3VsZCBiZSBy
ZW1vdmVkLgo+CgpJIGFncmVlIHdpdGggTWFyZWsuCgpUb2RheSBDT05GSUdfV0RUX1NUTTMyTVAg
aXMgbm90IHJlYWxseSBuZWVkZWQgYXMgb25seSBhcm1fd2R0IGlzIAphY3RpdmF0ZWQgaW4gU1RN
MzJNUDEzIGRldmljZSB0cmVlIGZvciBTVCBib2FyZHMKCndpdGggc2VjdXJlIHdhdGNoZG9nIG1h
bmFnZWQgaW4gT1AtVEVFID0gaXdkZzEuCgppbiBmYWN0LCBJIGFjdGl2YXRlZCB0aGlzIGRyaXZl
ciBpbiBVLUJvb3QgZm9yIFNUTTMyTVAxNSBhbGlnbm1lbnQKCmFuZCBiZWNhdXNlIHRoZSB3YXRj
aGRvZyB0b3BvbG9neSB3YXNuJ3Qgbm90IHlldCBjbGVhciBmb3IgU1RNMzIgYm9hcmRzOwoKaXQg
d2FzIHBlcmhhcHMgcGxhbmVkIHRvIG1hbmFnZSAyIHdhdGNoZG9nczoKCiAgKiBpd2RnMSA9PiBz
ZWN1cmUgd2F0Y2hkb2cgbWFuYWdlZCBieSBPUC1URUUKICAqIGl3ZGcyID0+IG5vbiBzZWN1cmUg
d2F0Y2hkb2cgbWFuYWdlZCBieSBVLUJvb3QvTGludXgKCgpCdXQgZmluYWxseSB3ZSBhY3RpdmF0
ZSBvbmx5IG9uZSB3YXRjaGRvZyBpbiBzZWN1cmUgd29ybGQsIGV4cG9ydGVkIHdpdGggCkFSTSBT
TUMgdG8gbm9uLXNlY3VyZSB3b3JsZC4KClNvIHRoaXMgZmxhZyBjYW4gYmUgZHJvcHBlZCAodG8g
YXZvaWQgdG8gaGF2ZSBhIHVudXNlZCBkcml2ZXIpIGluIGFsbCAKU1RNMzJNUCBkZWZjb25maWcg
ZmlsZXMKCmV4Y2VwdCBmb3IgInN0bTMybXAxNV9iYXNpY19kZWZjb25maWciIChpLmUuIHdoZW4g
T1AtVEVFIGlzIG5vdCB1c2VkIGZvciAKU1QgYm9hcmRzKS4KCgo+IEJlc3QgcmVnYXJkcywKPiBZ
YW5uCgoKUmVnYXJkcwoKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
