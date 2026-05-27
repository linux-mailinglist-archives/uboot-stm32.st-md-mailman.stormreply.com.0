Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULAMAq2GFmqqnAcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:52:45 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BE5DF961
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:52:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58F5EC8F287;
	Wed, 27 May 2026 05:52:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F85BC36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 05:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooyo2LJXK0v0siQjnXhHs9kTWGVHMo4EjlesivAMEgWfItOj63bMzaMRvW0uQsIhd60X3/Aaog0gCSLeuJ9PdZEP8F1patInYu4GDxeICDOSmCa/4/QPtiKbvGFRVsasJjMU3vUo8up1/I82W9gtymnEahaEJAAs6eykBa4T6dwmWlUt1PMPR7vjdOL19LO65jyEpahgtVXEy3PkTBdqqzGHRVhTvxEGZY1LjMSWENE3mdUj4N9PH2iK/NrlZTGkbQpBpvQNd3E3qd7JgtMXrRWDFg/FF0A+o/1QeaNW+BTB04xOqnTe/i/L4Ccr1odLFRZCLdXLpx4a8AwHAp5I9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTmw79UT3JKFQ1sItPISxSYDD4NNO9g1RcAWqF3whrs=;
 b=TW2M3PlZzi37/+TKMKwgaHF7nWU4Q1Ierl+4vkUa8G/fbCQeAPQ93wFSGoUXLP0gSacQlmH7ZlktwJ509OZ8IrkkVIG0kCd1KQWPX3I594CNYAr2qs0A8vG5fBoHEMRxSevSb0MK2TP9NNLxsbxKFDgiGxFTF06MmZuW7kq1hg8jLXXpY3+asA66ZL9NfQOVYpcYamvhqTkUew8dWUUN7qLAAbwuWggq5A1UjHWWQcj0bwEfUP+XvvxMM+OMBK3aL6memLsvP845TuFjc5IawuF9s1wxGbXfwwIhf6PxfIuv7MQVOWvyyLFL7pUmfD/+NcfZCxzsP8clcpe9PQxjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTmw79UT3JKFQ1sItPISxSYDD4NNO9g1RcAWqF3whrs=;
 b=M2T5H/i4kYoM9VuDL/1ZR29usw3UD6Y+LgQlqtHEc2SbUSWu2z09jEW7nGUKOUEjo+xu1dAv+xC3V7wpUgAX8ONuif2NJD7TwH1iXBO81BBBfNgC3EU+7DzPRrg4Labic4JyPg4LhR0CCDm+f+Za9t8uuOGMKnD78oxCTZ6OXXkRMize2flolJFchNKrQKrjkRa9sGrR1OWmraL8Gp94LIN+N/VFgcxWtOhMfKDdvdkdF1CEZrQPNx2NEl1cAhwMHqC+IuN9YEWDPU38xHS0q/RvWP2rENzRvZYp+ut2mIe8k8/d4aK2FQT+yoXE/4k7ofsLkVBECVYrWsHI4OTetg==
Received: from DUZPR01CA0238.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::9) by AM7PR10MB3937.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:170::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 05:52:41 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::44) by DUZPR01CA0238.outlook.office365.com
 (2603:10a6:10:4b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 05:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 27 May 2026 05:52:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:56:22 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:52:40 +0200
Message-ID: <a1046652-e8ec-4188-ab2c-c44ac52ea495@foss.st.com>
Date: Wed, 27 May 2026 07:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260518-master-v1-1-37fd4df56609@foss.st.com>
 <47740fa7-a75c-497d-9982-4292ef5764a9@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <47740fa7-a75c-497d-9982-4292ef5764a9@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|AM7PR10MB3937:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ac3723-1443-4279-4518-08debbb42a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: 6+w8u6XrvqWenGka3Hg+8FC++D1xjon/GYJSkm/AcBuxYD34n8aFLG+8mdkChe8/VZGphmqsQGN+FQ09U0d2xndTRhWgeLCsodkRCZJ62WEV8gAjPWd2aSq7YeEZPNisksgCwl2tUJja86vvfrUngjviCawJCMjHscOD7uVXxUOVcJbixQKJ9w9dC6fg1cJpcj35lT1Zb7/UqHUfZolx5xUTD1El0CMn9OYirZUbn3JrnWy28ohMTNWC7eHpTYuVlpc2Ly169XCdgTL393ekf+xB+46iWiw7CXPf5pq11wUP3KlQdGXYAlPIz9b2tPJxSpqxkCYEHTjfuAclVjWQ8SAOGrad+Ofh844mIRPonpp+PX86Fahgg6V9jYJRHB7RqX9YiO7r+Y4+JUMokfotSgsX0mAbonKUxYTzKuPsgwxvm/uiF32yJ771Wtf/NS/LMKEShwTI9bqdS9nqeaxJ9UCHGXjypBzb4+wuxHx3edQIvWC1vGIO8jp9mZU4DuQCK4W/yUFNK03Pn/A9yZq1HTfo5n4tsv1LH6m5yadJfYgrqGx+4O1ZcFtfFTg7J4vvFcXenB4/rc3RS+CVki6Lg/6brRmYuuCdiwu0pTg3OegV5eulpwxDKGDVXv5KKCUkqzhTgZ6Rc+J5nwWlO9IQdgErKByuojt7cXrJBaJ+QM1o8lO+R24E571MFUDAe8lXg02aeEsXETabTxArULSoLwYPKzvt0W2JBdea/0GkXc8=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uOqjE9lFs+ga09TMAT8x3q+6rLN//4oa6IGmleR/PK/jUycPhi/tppv1FCNKLx1PExvYbKs0ak01Im7Nvr5oJkUTcLRPrUZ20FVdbHVrod8j28PvOsyA+MAeGlvfjx+BEPjAfFbCxIC/gbJaxA7utLmAz/4yuWun0HpiXNfz37LjV2dophzgZuqlgn3fUDQkE+gRKbBY8tFIcuqGGZU1+h6xZck1GNU67feiz6YROn55XhMsu6+txOvaQHCilj1C+m1pPWrIeozYQfZO9/kxDpju2OAVj1fUyzfwY/Pe/npj36ZMqaXkc0/sl1tvR12P0p+rcFhV0LlkWmwnuHiZ4mxcP6CKmVhW8yScsp1Gas53bCYCF9+VCClWctcTSOaBGK1wlepQJbiza+slBcM1Xg6ZDFzO5jbXboGhAmBzqoBi9028zD5NNa9XZoTOCON4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:52:41.1163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ac3723-1443-4279-4518-08debbb42a5a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3937
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 Anshul Dalal <anshuld@ti.com>, Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: Increase
	SYS_MALLOC_F_LEN
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:peng.fan@nxp.com,m:anshuld@ti.com,m:michal.simek@amd.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.469];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A43BE5DF961
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiA1LzIyLzI2IDEwOjEwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDUvMTgvMjYgMTU6MjgsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gVXNpbmcgc3RtMzJtcDE1
X2RlZmNvbmZpZyB3aXRoIHN0bTMybXAxNTdjLWRrMi1zY21pLmR0c2kgZGV2aWNlIHRyZWUKPj4g
d2l0aCBvcHRlZS00LjEwLjAsIHdlIGdvdDoKPj4KPj4gVS1Cb290IDIwMjYuMDctcmMyLTAwMDUy
LWcyMTU0OTZmZWM1OWIgKE1heSAxOCAyMDI2IC0gMTU6MDU6MzQgKzAyMDApCj4+Cj4+IENQVTog
U1RNMzJNUDE1N0NBQyBSZXYuQgo+PiBNb2RlbDogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAx
NTdDLURLMiBTQ01JIERpc2NvdmVyeSBCb2FyZAo+PiBCb2FyZDogc3RtMzJtcDEgaW4gdHJ1c3Rl
ZCBtb2RlIChzdCxzdG0zMm1wMTU3Yy1kazItc2NtaSkKPj4gYWxsb2Mgc3BhY2UgZXhoYXVzdGVk
IHB0ciA4MDA2MCBsaW1pdCA4MDAwMAo+PiBvcHRlZSBvcHRlZTogUFRBX0JTRUMgaW52b2tlIGZh
aWxlZCBURUUgZXJyOiAwLCBlcnI6ZmZmZmZmZjQKPj4gYWxsb2Mgc3BhY2UgZXhoYXVzdGVkIHB0
ciA4MDA0MCBsaW1pdCA4MDAwMAo+PiBhbGxvYyBzcGFjZSBleGhhdXN0ZWQgcHRyIDgwMDIwIGxp
bWl0IDgwMDAwCj4+IERSQU06wqAgYWxsb2Mgc3BhY2UgZXhoYXVzdGVkIHB0ciA4MDA0MCBsaW1p
dCA4MDAwMAo+PiBSQU0gaW5pdCBmYWlsZWQ6IC0xMgo+PiBpbml0Y2FsbF9ydW5fZigpOiBpbml0
Y2FsbCBkcmFtX2luaXQoKSBmYWlsZWQKPj4KPj4gQ09ORklHX1NZU19NQUxMT0NfRl9MRU4gbmVl
ZCB0byBiZSBpbmNyZWFzZWQgdG8gZml4IHRoaXMgaXNzdWUKPj4KPj4gUmVwb3J0ZWQtYnk6IFlh
bm4gR2F1dGllciA8eWFubi5nYXV0aWVyQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKg
IGNvbmZpZ3Mvc3RtMzJtcDE1X2RlZmNvbmZpZyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdz
L3N0bTMybXAxNV9kZWZjb25maWcgYi9jb25maWdzL3N0bTMybXAxNV9kZWZjb25maWcKPj4gaW5k
ZXggYjllNDQyNTQwODcuLmNjNGRmZDlhZjcwIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL3N0bTMy
bXAxNV9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnCj4+IEBA
IC0xLDcgKzEsNyBAQAo+PiDCoCBDT05GSUdfQVJNPXkKPj4gwqAgQ09ORklHX0FSQ0hfU1RNMzJN
UD15Cj4+IMKgIENPTkZJR19URkFCT09UPXkKPj4gLUNPTkZJR19TWVNfTUFMTE9DX0ZfTEVOPTB4
ODAwMDAKPj4gK0NPTkZJR19TWVNfTUFMTE9DX0ZfTEVOPTB4OTAwMDAKPj4gwqAgQ09ORklHX0NV
U1RPTV9TWVNfSU5JVF9TUF9BRERSPTB4YzAxMDAwMDAKPj4gwqAgQ09ORklHX0VOVl9PRkZTRVQ9
MHg5MDAwMDAKPj4gwqAgQ09ORklHX0VOVl9TRUNUX1NJWkU9MHg0MDAwMAo+Pgo+PiAtLS0KPj4g
YmFzZS1jb21taXQ6IDIxNTQ5NmZlYzU5YjNmYTA5MjU2YjRmYjYyZjkyYWY0NmUyZWM3ZjkKPj4g
Y2hhbmdlLWlkOiAyMDI2MDUxOC1tYXN0ZXItMDU5YzNjNzU3YTE5Cj4+Cj4+IEJlc3QgcmVnYXJk
cywKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCkFwcGxpZWQgdG8gdS1i
b290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
