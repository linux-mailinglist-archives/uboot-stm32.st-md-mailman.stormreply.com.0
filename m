Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHXHJjBdDWpLwgUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:05:20 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47621588A1E
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:05:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D260C87ED1;
	Wed, 20 May 2026 07:05:20 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013049.outbound.protection.outlook.com
 [52.101.83.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51C25C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 07:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ6KfFxnW3vbmpybri9jaxMT41VUmrQSRyjIsftvjfIYhG0jI/5YADAU3c2AICITB/A8Te8lbvatAIvxQkbvuBoBr7FoYwXnUMoaO0vmQQWT7/Cq1sbLQ3TNfhuJP0XeTx8Tpqm023C1auDyQ9MehYzbe7QsjvXUsHkSjZzDUNipOpFGSTAuFMQUZ8cYeJrwIOwn28mUc0L9xm0a0uDcokwr1pFxXmcxZ43QHPS8cWqqCPDvGXRFu/q0/sbaSizIqtsuQDQtgRtGxCUlMdvE/InVLIlpAgR0bjOPMQw1WabqM4yT6+KGhf6Xz1TJEgvcovA7fcJwi8ZbaDGF9JzzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0ISnAIf1A+orR3b88cFCoM3nkNPEgFro6+Dxme4C1g=;
 b=Hi7yWXQqycPTcFM2zafHgM75sPjTpktlmJi+zYG152ZyV6vO3gK2Utj47a/rQUsCeH3DswMHru+f2tR3PBHvGsymeCpq0STqIBF8fxLagNqtD+1sLnoWLqbUbl4ttyXgB2Dh5df/f8hi+8Xe7YMMEhhMkkbydj1GDqyVncTwJKm0/rWq0LImqB8Mj79k45NY36yPpGoCEBDVRKSuN61JFJGXndNfKnPPT7ONVnCDzds/K96+oex2jNAlEubklfj5ucO76/8JAO3Czqtpjp10sN3yQWTqYEijGeMNCHDRTfhetphlp0mR+fqfkw20shYXtRsryOKcwwJb46Wst3Poqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0ISnAIf1A+orR3b88cFCoM3nkNPEgFro6+Dxme4C1g=;
 b=AcPMpGpMRW8Z4046ArpNrBrPLohUkaIxuBaMEqmRqtBb7f4Sc2eUiHZwGUyHwiSj9CBKVcxSr0WKxZEojeNn4KlvpMjhwdeU+F6YVykRaGvQnkGEfJTmLa9aF6+fHSw2mIvwjaojckL2Rtl/kneXX1lhLzT03r9TH8s5KhfLFaeiGDZS5cNk7h6TzjtGPyydWiJ7MpsyF+3fHDEskGrsRXJm8etwMupLENW5YeuPSUljSH94UY549mb4tUlJKA1gQk8SPFKGytK+slWYP4H2DhkzM5HLvRoQLfktYZqCyssRppWdCEqMRfNaANBT51Ni9+UrS2hMPeeYGtnqhdbDDw==
Received: from DU7P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::6) by
 PA2PR10MB8602.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:421::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:05:09 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::6a) by DU7P250CA0022.outlook.office365.com
 (2603:10a6:10:54f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 07:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:05:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:08:38 +0200
Received: from [10.252.1.215] (10.252.1.215) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:05:07 +0200
Message-ID: <1aec25d4-3135-433d-8fcd-4ead7a065d40@foss.st.com>
Date: Wed, 20 May 2026 09:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
 <20260519163145.221668-3-yann.gautier@foss.st.com>
 <f420eff8-6524-4797-93b7-0f9a1149e860@mailbox.org>
Content-Language: en-US, fr
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <f420eff8-6524-4797-93b7-0f9a1149e860@mailbox.org>
X-Originating-IP: [10.252.1.215]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|PA2PR10MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: f286bf9e-44da-4107-9501-08deb63e2116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 9IgkEeqZKYGXVZRS1/QKQ3oR3MyUQHecY2CQXU8u/6v/bJomQAs88nszTecajQEXWjlfoSzrwCJv6H/ipna1pJaROzHVzjJoHSObuC7ilcxezNk3H7n70THKgpBqdNF+F8zRQn/WvOpw6G16wchdBip7K11oBic89kCDfmfPEASop0tYhMO+jg7u5ErPQki4OQUo3K4YLA+ZxvEG31inG1LWbq2T93M6oZXTIAIPojQDKH2eauhVTFp1hlBSUGvRLM3S/yTSukTGpQuiDH94qXksH+zjyISNfNX7315ZF+SUhgFaUY5BwtZwV/wrBO7lMMYIDV69CZqJb0yy0uUPQ2ebZOOll67JDY3ioRwYmtHPrkYQZ6OyoZZz2oOnVVezKYWekvmKLFNWaFUjJWS9O3zpSUIAilQ6vhpKuQ9TB7s1Grvh9dC3puIdYICTxlS4qKe6QAsI1yvw0efw6ls77xbgFS9LwBY41yfeWBL2EBJ5ZcqbdzGr+JKP4ahLqrxoxwJYNzNmM1kjXsZzHOUFgsxc1VGnVIAGz7xRAMtY922DYo3blZn9XI19xn18HlE4+BqjXcR9HFXQCcaek5GJMwz3yCVFHybAa/26KNPfv/dOtZs/T6Q4aAG0mtk9+2WrN5usuKIM8ffeVQkov4xekXN8GW9PUY7QYojtPAL+xitxPDUA9M+ZGPffRkG8YCBwrv3zakfRm+QYelwxh6cdJRL661uwYwLlMUp5LTRu34I=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dXvd1O2m2ZP+OgRLfUyGjCNGvKyqTKFX3vLPXE0js4Bpd6ZlG7JtC69KMPDXSh3gnNnCDcq1dDmTTGTEQ1bTwaIVVRsKWah+MHqTNS2OxBKYn/Yusceh1iworMbSj5B6shiwe29UXuBrnH4t3ISm92/qi46asLCD0fl4bn1Msdt0o88RjVnfB5rtBYoqjWDrsntPsHu2ir/YSbTx4YxkXO7hBrHmYzQ/4g61hc5EIYmdtlSrqBd+spmKWjBpKEC9VvbZpMgBDksWhuVHh9WXGHihYTszG/YMUMfp+NJVONfEStExIbxYyAlfEL8R5CI0Wv4fOfzHEljvDUCOw832SkH3dZDQOYczHvPZuRl0GZ90Bp7DxC497DGuTMcuROtzr2UUFrFuNj+Sy21/twUmLlyiX2u6MXZeqMO8TzBM6dXjd+016IfX03IO4iqXu8cN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:05:09.1477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f286bf9e-44da-4107-9501-08deb63e2116
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8602
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47621588A1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNS8xOS8yNiAxODo1OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNS8xOS8yNiA2OjMxIFBN
LCBZYW5uIEdhdXRpZXIgd3JvdGU6Cj4+IE5vIHdhdGNoZG9nIHdhcyBlbmFibGVkIGZvciBTVE0z
Mk1QMTMgcGxhdGZvcm0uIEFkZCB0aGUgcmVxdWlyZWQgZmxhZ3MgdG8KPj4gc3VwcG9ydCBpdC4g
QXMgZG9uZSBmb3IgU1RNMzJNUDE1IChpbiBTQ01JIGNvbmZpZykgYW5kIFNUTTMyTVAyeCwgd2Ug
dXNlCj4+IHRoZSBBcm0gU01DIHdhdGNoZG9nLiBUaGUgcmVxdWlyZWQgbm9kZXMgd2VyZSBhbHJl
YWR5IHByZXNlbnQgaW4gTGludXgKPj4gaW1wb3J0ZWQgRFQgZmlsZXMgKHN0bTMybXAxMy5kdHNp
ICYgc3RtMzJtcDEzNWYtZGsuZHRzKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxh
dW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWWFu
biBHYXV0aWVyIDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFu
Z2VzIGluIHYyOgo+PiAtIHVwZGF0ZSBjb21taXQgbWVzc2FnZQo+Pgo+PiDCoCBjb25maWdzL3N0
bTMybXAxM19kZWZjb25maWcgfCAzICsrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAxM19kZWZjb25maWcgYi9j
b25maWdzL3N0bTMybXAxM19kZWZjb25maWcKPj4gaW5kZXggNjIwYTZkYTJlZmUzLi5jYzQxNTg1
MDk3YzcgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZwo+PiArKysg
Yi9jb25maWdzL3N0bTMybXAxM19kZWZjb25maWcKPj4gQEAgLTExMyw0ICsxMTMsNyBAQCBDT05G
SUdfVVNCX0dBREdFVF9NQU5VRkFDVFVSRVI9IlNUTWljcm9lbGVjdHJvbmljcyIKPj4gwqAgQ09O
RklHX1VTQl9HQURHRVRfVkVORE9SX05VTT0weDA0ODMKPj4gwqAgQ09ORklHX1VTQl9HQURHRVRf
UFJPRFVDVF9OVU09MHg1NzIwCj4+IMKgIENPTkZJR19VU0JfR0FER0VUX0RXQzJfT1RHPXkKPj4g
K0NPTkZJR19XRFQ9eQo+PiArQ09ORklHX1dEVF9TVE0zMk1QPXkKPiBXaHkgaXMgQ09ORklHX1dE
VF9TVE0zMk1QIGVuYWJsZWQgaGVyZSAsIGlzIHRoaXMgdGhlIEFSTSBTTUMgd2F0Y2hkb2cgCj4g
ZHJpdmVyID8KVGhpcyBpcyBhbGlnbmVkIHdpdGggc3RtMzJtcDE1IGNvbmZpZywgYW5kIG5vLCB0
aGlzIG9uZSBpcyB0aGUgU1RNMzIgCklXREcgZHJpdmVyLgpJJ2xsIGNoZWNrIHRoYXQgd2l0aCBQ
YXRyaWNrICh3aG8gb3JpZ2luYWxseSB3cm90ZSB0aGUgcGF0Y2gpLCBhcyBpdCAKc2VlbXMgdGhh
dCB0aGlzIGZsYWcgY291bGQgYmUgcmVtb3ZlZC4KCkJlc3QgcmVnYXJkcywKWWFubgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
