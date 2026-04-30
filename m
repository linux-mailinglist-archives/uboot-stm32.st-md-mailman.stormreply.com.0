Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCMVKBn+8mmIwQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:00:41 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9A49E4F1
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:00:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E34E2C8F262;
	Thu, 30 Apr 2026 07:00:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011026.outbound.protection.outlook.com
 [40.107.130.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70F48C87EDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 07:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4IPiQ3YnAWbyYNRTXRpGcqfVzHAC25QXBNwQz0xxEqefLZj3MAANaVJFEalboTof4rfmNNWM74x9OPE9r8msJry3VdfjWBRTxrLTT5aRCncINc7xJnBwljcs/WuMkAJrxraSCsmqxmIC/5lEvBYykqNWiYkX4QnRapNcZoBe6pyGCeoqp0hAT+yehTtqurTZSJuCnYxW7bVq2IwImlFroiZFieZk1dnl+U+zWyzxRY0khhwUgq+Kc1ZselFs/hu3GKTN6PrNJiSZKkBnjzlivS9sWc0JeYrCW8Vwri/qko0eeCkiMUGm/yfRmSTpwrM901xMx5QFBEAfyUYKzCiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4e78ncseY4KqresTgeMMp5WKffLH2Oak4IL+TYuY3E=;
 b=OxRr93edG0nVxUl99ztL0hc9K4PvyHo5ofDz7jHO1UrccXVcJMVRQsVOk3oUnl5g+CyCRYEAHej1jKsJbdUto+86Xy6+yhw72w9mypDKAmea5sAZRWYE0Fy1mPgeTz2lhVQbvZpnT9QUSYh5Ekdcw2s3nOMyFXODaFJxh/tL2VuKa/8KD4HCyVtfYW6l7fe5TnAgNjCInHBqVrAiTRcTgj4vQb4451mwx+00d3UfUtyGiCTB4pW/+yq2S7yyIo6o6t8kfVQ86vIHyWDv9bFI1SbJzZlyLQ34NnMmbFcFW89VmIwLX9SjcpyTMaiHK4WPCBA6QjPVXxhIlK74S3J9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4e78ncseY4KqresTgeMMp5WKffLH2Oak4IL+TYuY3E=;
 b=WgW5Ifu1bw02g3+iEY51G/03sNDuFt7dwp5wovvWKtmvBIHwS400c8xXulPLHvZVV8kk3XppqhF++aio8Qnw6g5kK5SoFKITIoRoDKClf6+YAMpcFFfu9Vg/tGYG7dxQn3B7mq8+49GlFrL1lnFZRU/l5kR1vI5vQfcj5YzGZDAfMlGV9GDzDnkP2eBTx7dnRVlwufPYyotMPT4tsBMKiZeCzC+tIwpz6EivmaWmMpe/CWCv7meq5xpd+iTRUdsxX7pTaEdy2u8a+oKd8PWWko4QBX1tpmHZS7++fsrGAACl7Iq2+10ImLe+Aj1n7qzMRFUabTPQAnSPu0/dl605Ug==
Received: from CWLP123CA0240.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::13)
 by AS1PR10MB5142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:00:35 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:400:19f:cafe::79) by CWLP123CA0240.outlook.office365.com
 (2603:10a6:400:19f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:00:33 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:04:01 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:00:28 +0200
Message-ID: <d70e58e0-3a40-4ff8-a241-4a0b1a0342c1@foss.st.com>
Date: Thu, 30 Apr 2026 09:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260401-add_stm32mp23_clock_support-v1-1-ff5fa33d8b67@foss.st.com>
 <c4b646c5-7038-4fd8-b794-f304502452c0@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <c4b646c5-7038-4fd8-b794-f304502452c0@gmail.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|AS1PR10MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 6122651b-40b6-48d3-47aa-08dea6862cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: sl16T0XaYQCCNfamQ0KumaUXLSNNOSZjsuBSbFeI4HhKlk+aGid1z1eQ6cvnPbiG4D1Af96QL+KNIXJfp8lAgh4rZ9XC5d0hpHimlJ0fZUk5PePvC1AnR3KvX5vl9MNr96wCO0porQPPTWPzkLNfwbjGW8Q7k5TryX07dZmrvx7WPa7wjLntGQ9WTervzCDrrh8MFbSHzPKWn20dLpIQ/oGSD7BAnYt8JcKJAS1nevd4BsG/aTVydojXREvwd+qkSycmNnHc2V11Yd+kHi8cPZrl5Pe7WU7w1B+4FPDUEY3jqs1Arg6CoDRDgQE1N9mPgp17YM4kOoXhDrZK/2rBnKMtzNgnZAzF0g0bjteez7IaphcOyHd+13bZ++f68DaHknIRAvRpON0IvdDueKTF5vwFA/XzkqA82XD0tlsuS4e3iHqSKO6hu+zV28mC7m14zRzW87n57RjVJRXbFgSxBnP+9LuU7sq2LNlS1I8waJgTIj6MiX51iH6s+yr1XyUBa5sOqDz5Vi6zpRRzY4k+z2jlh76tMbutcPVeQVAlRNPWgB1aakCht7sG6MhToVWovsZ5dKWEF98Gsm6aP9QG1pHamn7jT/BT0dB+h2zzfRIRI9dLzJCZO6smVzfTLQ4+Wo9ave9eorq9ZqC81GObRKVNHc+NhuGqZZ95mMd376Pjyr/WOs/yn29bnSHhsDXI3J77NccARDXn+vRvxb2oo2+FxyFwxIfqw0gQ/ATI8jw690y97NpeXVHKqI2Mrd/1yx0SWiy8XW6nI3W5bS57GQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bICI63uTm0URa74dnwcBsrGGSTU49car7ap62FTZGGqoQdu9jp+NX20tW4ZHbVF0Pj1SeH6ZF5/8GDsRU0dodJjdqDLswVkOMrMS0vTL8wQdl3yeQ/fD8suWRMopLRlUTjra2RsWd68Y8enghYCjsO8KRGLp7qAVfboebyZZEreXh1Pps33bkPHi/xQyteedYWM7II6HJEQOumfiPLEvc5aVc1GlnrDatgMshlwv5hl+vqa3OOWiqcdblWYp7d2jbzyazWu1BZUrjWS83bu2ZlCVZzSM/hspgY8Bt552yd8m9amEjBNdFbn7NIBlkCPreJzgBqgqvya61iy0sM1wdR8dwCdiY7XmIozdMNM7Zt4sh8mnroA474Q44hGmZp5WW4RmUUow0p+HisFU9btBAuDSYEI6iAvSed0g4jsbvblcaVV3d2yS0cNTEk7T1Srv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:00:33.8362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6122651b-40b6-48d3-47aa-08dea6862cbc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5142
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32: Add STM32MP23 support
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
X-Rspamd-Queue-Id: B9F9A49E4F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rgallaispou@gmail.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:nicolas.le.bayon@st.com,m:patrick.delaunay@foss.st.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,st-md-mailman.stormreply.com,lists.denx.de];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.345];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

CgpPbiA0LzEyLzI2IDIyOjExLCBSYXBoYcOrbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiAKPiBP
biA0LzEvMjYgMTE6MzQsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gQWRkIFNUTTMyTVAyMyBz
dXBwb3J0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBmb3NzLnN0LmNvbT4KPiAKPiBIaSBQYXRyaWNlLAo+PiAtLS0KPj4gwqAgZHJpdmVycy9j
bGsvc3RtMzIvS2NvbmZpZyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gUmV2aWV3ZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91
IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jbGsvc3RtMzIvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL3N0bTMyL0tj
b25maWcKPj4gaW5kZXggNGU0ODgxMzZlYWMuLmU2MzM4NWQzMDUxIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2Nsay9zdG0zMi9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvY2xrL3N0bTMyL0tjb25m
aWcKPj4gQEAgLTQ5LDcgKzQ5LDcgQEAgY29uZmlnIENMS19TVE0zMk1QMjEKPj4gwqAgY29uZmln
IENMS19TVE0zMk1QMjUKPj4gwqDCoMKgwqDCoCBib29sICJFbmFibGUgUkNDIGNsb2NrIGRyaXZl
ciBmb3IgU1RNMzJNUDI1Igo+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQVJDSF9TVE0zMk1QICYm
IENMSwo+PiAtwqDCoMKgIGRlZmF1bHQgeSBpZiBTVE0zMk1QMjVYCj4+ICvCoMKgwqAgZGVmYXVs
dCB5IGlmIFNUTTMyTVAyM1ggfHwgU1RNMzJNUDI1WAo+PiDCoMKgwqDCoMKgIHNlbGVjdCBDTEtf
U1RNMzJfQ09SRQo+PiDCoMKgwqDCoMKgIGhlbHAKPj4gwqDCoMKgwqDCoMKgwqAgRW5hYmxlIHRo
ZSBTVE0zMiBjbG9jayAoUkNDKSBkcml2ZXIuIEVuYWJsZSBzdXBwb3J0IGZvcgo+Pgo+PiAtLS0K
Pj4gYmFzZS1jb21taXQ6IGJhN2JmOTE4ZGFmY2QwOTNhZDczM2IwN2JhNDkwYmFlYjIwY2Y1ZGEK
Pj4gY2hhbmdlLWlkOiAyMDI2MDQwMS1hZGRfc3RtMzJtcDIzX2Nsb2NrX3N1cHBvcnQtYmIxNDgw
OTE0ODExCj4+Cj4+IEJlc3QgcmVnYXJkcywKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFz
dGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
