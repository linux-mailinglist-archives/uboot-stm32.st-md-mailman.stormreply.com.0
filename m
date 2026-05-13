Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL8XKCoQBGoMDAIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 07:46:18 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF352DB4C
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 07:46:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65918C8F289;
	Wed, 13 May 2026 05:46:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011025.outbound.protection.outlook.com [52.101.70.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBAC6C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 05:46:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cnx8Lc+ZL+xXU8nTzBRcyD8FlB9ZXA6NgtHH1OjpcuvZc1zf/IR4A/p+N7Uzktd0ZxFP2R4AdTD6EZP8Ju2MU4V7AdeNdRUw4TB2bYaLUvxsOmkDspe0KysOerV3tatjajCAE6FfvSec1m5JEuz5uu7U8i7iCZPeK4SzdbPCBmNxugdSD8KxrdeF2AQAX/yD36I9TRf0eES9rqnl35BhYzcBtiiZmtqGs3Rcqp7YFVlTRaLV9v0x0gLMQhTbx+5lBqs/5YBv+xGcTlnDtqxzsOsw0Sw/sbbWZBrLb9ZmG41qoxYzbQcEhaULTEvWsMP5jG/FR+Dbg4GJjCVEvET3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuh0mxFFVgazhaTSOlrdVMKwvZO71+KcbeWHFULJVvs=;
 b=xREH5AiZuPAwjAoeLpZkUEUXNRHQ+wfXWOF/j3fp/pEQk+V8pxNDjrv5FLzBIh7nJ0h5egwR9Ed9JMCYdsdMKrWVbdJXAazMiiI6ww+RH0xWMC3aVAvLC08mNMzfnjcAlvbFIwFRKz2vwTDPi/LCOGefAd1z4KnooXf6OM60bXlScX7+gOMoI9VX/lVSNxzPLuoABh6zsLXh7ZH7CULHwCfOzpXGUpoHv8LN3bUAI8Res1E9xrovCu1BBbuNzLpzYCe+I7oBeFjdg1ftexFi0pfcJYK0oBKJ5q0UHOyoWR9MyYcXG9Ml6sk/hDUYBmw3vmEP75nebjjZeaK1tkkLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuh0mxFFVgazhaTSOlrdVMKwvZO71+KcbeWHFULJVvs=;
 b=OqRdNOwE+HP5E/E5CgcqY5uKuYlMcqtSOWyJe5EeUk6HxISFQa6Se33nWixbzMSs2VJh162/CHO0ymMIo2PJO+fSunSPg7h9nrHmgaEKzPokOtQB6K91ItOYHebC6+W8cNuFSA+nVdq0TVtc15TwT4xxBA2ROWfxqqdk1B0OFhmH52+rLPDerI+dRfIbQxREVZV+veOmXtn0md4RWcFZRQk/lN8dOI/Y7th6u4d5WYdvDTZkTuROsPWwptnHBxSd1ob7FrDaJLV1BGsa4wzm8nCU/GU2wHT5v/PXvaYTQwurptI1jzJIibTFVe3QY996U8rtpmkaCGCqTEYO+QAkIA==
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by DB4PR10MB6071.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 05:46:13 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::17) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 05:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Wed, 13 May 2026 05:46:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 07:49:39 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 07:46:12 +0200
Message-ID: <2345df59-0ffb-4817-8801-9114f598bb15@foss.st.com>
Date: Wed, 13 May 2026 07:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260428-fix_mp21_reset-v1-1-d1f2dff3f507@foss.st.com>
 <488f6f98-762e-4104-96f2-60a2475585fd@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <488f6f98-762e-4104-96f2-60a2475585fd@gmail.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|DB4PR10MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: b50cdf8c-bd86-4003-4577-08deb0b2f14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: rwoXVoKeWcKjH/QsYEqTsSLY/kvdKsgvRs4yrUWeq59jZnxoInG0FzgsXhfadkI/Ze0ROC1KpSsd9dqXp3LSiMP992KAVntCFQG0DonRqysfMrCbVhfuFIaa/LCDv7l/QSmsxXXhS5sKwxJrrwss0BCNZmoWuA3f/xpoxsskHYjzUYMUbumZ0N53bb3q1a2YeTZBMQxRPaaAWOM6Xx3XWkzqZnVPr9Xb9fwyHglEytBheCToMmfJkzj+MMwb9Dkd1ggpCsRW5OS1QguaUdFclh8Z9pjQ7A1yXn0z/Et9ekU0Spcg0ksg9bjuY/44fOOtK69vKtx1MiwSvcoyD0kyJSQSf/UX7tiTTk8ZPV0R43uJfA8wazyIBxbfk4BzTDrAsacYY38TLpNcJ+nTl1AxpbqYwV45po4BCupVpIYwXUPShi/LFAURrcaCxy4rIMB57QyF4yTEDw9gzJlFxf+2mQnzLDs1B/Kd+3PGsn1JMSlmJLzyS8SCHmpzY+kWSaEHHgdjlyW5cESoRa8zMzbG0YIiffl9aY9Objk/Ng6P7ur/bsgSSINcGU3hg/0MYoGkbjkJvRp/VwsQ2kQ6LX1PNbVoYk1kHNK5n1XSghZV51ecOAdIRVGhfe7VkUenwoj3Ir9Nc742uLFAIqYo/tmLiydkUyihKNn1lEiHZ71JyCq1Br7tp9/sxVjSllpStMDpd+oNbnRKSx2R9LJRfT7F3WnOKJAqcLYJQWzQ0Wc0SXs=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IxsHyOkcjbNMtv4AVC/verk8wH1W9df2ttCXY5OIqiU14P0Qe3TQerHQWXtmoS9clxxCnnCzXeyxnglrl87h+/qqwq5Fk8IfC7J09ndLOGZSKvWlF4EoCLzFnJSYtev0eqsN2QiBa9x0YSixg5CugUvjlFkAhVZAejDDl61KyF0yT5pGQ3YwhYYYwoG4mp5Y8R879mjhtdCMbOtz8RWNxX8wDNHWbh+efT9tc+o1GLqGrP3L2mrLRiuYNDJ6T4O5Cd/cYaj+Q/0eYh3cKGTPBwO135fcTzJAHXNEpqOvKZdnUKBaoZPZwxbm80g0FKfmgvYndqEMmOQ9otf/Ecuz1ckt3hf7q0wbKWKKtikS7FvPLiVmeO3JiEXIGA4FXsWIEG3boakChRtkm8804IeLee8Tdsk2vabTV4w9MX6tw3eHb+/uXcuMe2G7laXAbrDr
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:46:13.1094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b50cdf8c-bd86-4003-4577-08deb0b2f14c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6071
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] reset: stm32: Fix compilation error
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
X-Rspamd-Queue-Id: D2BF352DB4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rgallaispou@gmail.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:marek.vasut@mailbox.org,m:gabriel.fernandez@foss.st.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,st-md-mailman.stormreply.com,lists.denx.de];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

CgpPbiA0LzI5LzI2IDA5OjQ5LCBSYXBoYcOrbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiAKPiBP
biA0LzI4LzI2IDE4OjEwLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFRoZSBmb2xsb3dpbmcg
Y29tcGlsYXRpb24gZXJyb3Igb2NjdXJzIHdoZW4gZW52aXJvbm1lbnQgdmFyaWFibGUKPj4gS0JV
SUxEX09VVFBVVCBpcyBub3Qgc2V0IDoKPj4KPj4gZHJpdmVycy9yZXNldC9zdG0zMi9zdG0zMi1y
ZXNldC1tcDIxLmM6ODoxMDogZmF0YWwgZXJyb3I6IHN0bTMyLXJlc2V0LWNvcmUuaDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+PiDCoMKgwqDCoCA4IHwgI2luY2x1ZGUgPHN0bTMyLXJlc2V0
LWNvcmUuaD4KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+
fn5+fn5+fn4KPj4KPj4gQXMgc3RtMzItcmVzZXQtY29yZS5oIGlzIGxvY2F0ZWQgaW4gc2FtZSBk
aXJlY3RvcnkgdGhhbiBzdG0zMi1yZXNldC1tcDIxLmMsCj4+IHdlIHNob3VsZCB1c2UgI2luY2x1
ZGUgInN0bTMyLXJlc2V0LWNvcmUuaCIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPiAKPiBIaSwKPiAKPiBS
ZXZpZXdlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4K
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gUmFwaAo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0
ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
