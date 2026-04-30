Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PDdN7P98mmIwQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 08:58:59 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC649E4B4
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 08:58:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5B69C8F262;
	Thu, 30 Apr 2026 06:58:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF6D3C87EDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 06:58:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwckFtcftoYJpBbs5t9o+zl66sSd9aVKhGtQgMrmx/3CRrTO6p9+L2imLSv/NfuXceT0tkyGDds5gDYLclcjNg4UIxkS3rXtsCMIjTNdWHgsO3FhRvnHXHhDobbeg3XfE9L2LXoJ/1XCA7/6jZpZOj84mmWX2zCgnpGSLIl8UWxQfz8GvT1zYvOFxYpnVkW99u5Rb0lvI3HKS+tVU/WJdtn0o3mKttwMM88JLaKc+Q2c6lo8qUGr3xgbib1U9MUQM+D8U0D1f/NyihXAu4fbP7aaj5Pwq4EpW0QUWJ4KDAXM7sK68Mt3uId44+ZxUVXggUuikcrvlFM0bH2GsupDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZ0nIVbg+F8fii6M8uJ9RmV53XevAbunDeT69B42PZM=;
 b=xQnyjs3MDARO+SW5vBvaAVhKqwhOe3+FZ0ZqqLFCpsvdJldHTpQptip5ljEY+t9anszm+dWR0pJvb7WtcyNmrU4gXX3QIXADCyzKsDcMhQE8a7E6K2ymVgB17spfoUxOc19YJMvvJ1Nqtl+ROaHiqhVER05lRaVtO1SUalFBQQxn83LjAXb3qw2sUE/PMSdVA9bdnWJ3Qb0uYUW+wnhysOvA/qPKxpLISYBTb7LYw0An+B4FwMx7xpKfaaBxU/WE0Ytd8or9I8BWWYLQeqa7roX5lAp6aCSYdaY5i2SrFSdVFFPodM41ZYtrvkuovh3lRjVWHp3Vucz1zedmuYdumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZ0nIVbg+F8fii6M8uJ9RmV53XevAbunDeT69B42PZM=;
 b=ECj2PER0BlYw6ZBMVPWVgKLP8UlDg6Y8pb+p7BeAVVeoTXZG5HuvKhjB+5A7DFaNu3jk1NmQPC6lqI72gjWg2CM07lyfULQhcAp/rP7R/Wo9/Zyqx3UEvkIzl2hH6RRKXOQMQxkuaoYDWY9homZGVqn76YJG0t59TaN0PFcO3O3mkyDoSkUTRQ+YuavyQllM6djdjtRiVs8DQRoL9ijQxX5waFDV6188aBz0pGzi+ivGK+49W3JtmKcYmRJLs5y1etCxrtaXXPzaxTeVlaYMIP9pLvykYkY2/7QBHohwQp5zpoZI7mwMSeVeIWuO8hjP2ZR+vDD1enHhj4NnMTYhTQ==
Received: from DU6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::13)
 by VI1PR10MB3215.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:12f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:58:51 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::b7) by DU6P191CA0022.outlook.office365.com
 (2603:10a6:10:540::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 06:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 06:58:51 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:02:03 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 08:58:50 +0200
Message-ID: <fbc2d28f-7ad3-4e18-9229-f83fc54a05d6@foss.st.com>
Date: Thu, 30 Apr 2026 08:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260414-fix_usb_adc_meausurement-v1-1-8cdbd4c10dd8@foss.st.com>
 <255b4c39-eff9-46cd-9e18-8e1b47ecabac@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <255b4c39-eff9-46cd-9e18-8e1b47ecabac@gmail.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|VI1PR10MB3215:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f32b7a6-8845-4e7c-639c-08dea685ef79
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FmknOh93KM7FnT2dk5yZS/G+GI65x2mFieibPx1YnoDfCsJ3GY5wGR1KzB79wM1U5eoSg0dwbglTRzOkUk5QVdPo+qxDG4L4YachyhHQPy7t5wnZIRCCuVWPepLsqx7NeBMOpwmBJ7Qua0JALtfsrjgo7mAHC/ylCX3/LlKQguXDttSU05rmYKy2c6QJwEFkmW9XCh9VM3SS5dvyydkXokK/JUEA9SAZDL1D89e3iSZNF/qwdXnd0bRI1U02keEbDMlkXvidFbwwazCB/Otk7LI4Ihhk8R5GfkkJeeHCQKAQvi06n7oENqQltqOt3QK0gAzOuGmtsF5HacmynVgE8Pv3g/JAK1ZsM6CAEwdH/9tfJ/S92c/hV/zKZsGKqehyrfjmrMEtlUzGWdQK/6wU6/GnSld1YxqU8XrDvSJFsLwf8gRHFXDQOWJJBy+lbt+HX3p+TXEMhr047QsjlpfhBeK7rjIaay6IQ4dpdEe4gXTQg0WgQQrPr/yxvI1Msdk5sBbvnd7WBeq7EQgObMlbgNqwYt2I375EiR3X4sff7z0VDoWZtYHRTvBtbXUhm/6Qiyzl192VeyV0FfAm348xTnsQXBszzJeaNkj8xvEwOQ6SN+NaBF0TBFSBOzfZyNuwvmYhW0z+r1EgbpWR7USgX3Io79oh5O/VMIsMDNoMG8iLrMNgE9aTKQ61qHRenAR+6JJ6uz/lfBKjLzt5emen3d1rAzGm3elZdfNChlxJM4D9i59pnkMqGllo97HIakC3YwnqQ2OPT61/QZFyN0prBQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yiWBmhc7FaHXA1u1KWUx7DlyvCwP+8aHAH4kAkpQ+ykO8vLPT3iNSHbdq1UCMEatHLh60ntwZh8GSvA3mvtsfpCKr0P/Y6SRcP8IaihLCYuzItiyFxLEZhmtbisS9GzTrAp4A3vs0IYujOD/DcstKd2oh68wCjDSYCkMPulZrAK+0oQhtPKxxSHsJeQ5nb+vHMRwTm8DPVNGu/RKX1TeS/s6+cCx9FrWxA52MAM+7iE6lOFe9FPAP+p5x6TEfO2KOskUSLCHKoaF4Tn8kSE06eAQOrBgLKsiYdtrQXDKtG4rFg/0WFZsNeCHgK5XohtHHQQ5jBVBdICnCHCx3vwurykCNfJMByUTMq4iiqYnXamAunek89/TJ0hOJTinDGbq8p60h++zF+XFyW2yoi+egJwvbunzIb2ltXbi59lTEffL3HM5tMZF9ygo3mZRt7XR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 06:58:51.0647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f32b7a6-8845-4e7c-639c-08dea685ef79
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3215
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32pm1: Fix
 board_check_usb_power()
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
X-Rspamd-Queue-Id: 89BC649E4B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rgallaispou@gmail.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:kory.maincent@bootlin.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,st-md-mailman.stormreply.com,lists.denx.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.763];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]

CgpPbiA0LzI5LzI2IDExOjEyLCBSYXBoYcOrbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiAKPiBP
biA0LzE0LzI2IDExOjA2LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IERlcGVuZGluZyBvZiBw
bHVnZ2VkIHBvd2VyIHNvdXJjZSAoY29tcHV0ZXIsIHdhbGwgY2hhcmdlciwgLi4uKSBpdCBjYW4K
Pj4gaGFwcGVuIHRoYXQgd2UgZ290IHRoZSBmb2xsb3dpbmcgbWVzc2FnZToKPj4KPj4gIioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioiCj4+ICIqwqDC
oMKgwqDCoCBVU0IgVFlQRS1DIGNoYXJnZXIgbm90IGNvbXBsaWFudCB3aXRowqDCoMKgwqDCoMKg
ICoiCj4+ICIqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwZWNpZmljYXRp
b27CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICoiCj4+ICIqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqIgo+PiAiIgo+PiAiIyMjIEVS
Uk9SICMjIyBQbGVhc2UgUkVTRVQgdGhlIGJvYXJkICMjIyIKPj4KPj4gVGhpcyBpc3N1ZSBoYXMg
YmVlbiBkZXRlY3RlZCBvbiBTVE0zMk1QMTM1Zi1ESyBib2FyZC4KPj4KPj4gSXQncyBkdWUgdG8g
bWF4X3VWIGFuZCBtaW5fdVYgdmFsdWUgYXJlIGluaXRpYWxpemVkIGF0IGJlZ2lubmluZyBvZgo+
PiBib2FyZF9jaGVja191c2JfcG93ZXIoKSBhbmQgY2FuIHRoZW4gYmUgdXNlZCBmb3IgdGhlIDIg
aXRlcmF0aW9uIG9mCj4+IGFkY19tZWFzdXJlbWVudCgpLgo+PiBtYXhfdVYvbWluX3VWIHZhbHVl
cyBpc3N1ZWQgb2YgdGhlIGZpcnN0IGFkY19tZWFzdXJlbWVudCgpIGl0ZXJhdGlvbgo+PiBhcmUg
dXNlZCBhcyBpbnB1dCBvZiB0aGUgc2Vjb25kIGFkY19tZWFzdXJlbWVudCgpIGl0ZXJhdGlvbiwg
d2hpY2gKPj4gY2FuIGxlYWQgdG8gaW5jb2hlcmVudCBwYWlyIG9mIG1pbl91Vi9tYXhfdVYgdmFs
dWVzLgo+Pgo+PiBUbyBlbnN1cmUgdGhhdCBhZGNfbWVhc3VyZW1lbnQoKSByZXR1cm5zIGNvaGVy
ZW50IHZhbHVlIGZvciBtYXhfdVYgYW5kCj4+IG1pbl91ViwgaW5pdGlhbGl6ZSBtYXhfdVYgYW5k
IG1pbl91ViBhdCBlYWNoIGxvb3Agc3RhcnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPiAKPiBIaSBQYXRy
aWNlLAo+IAo+IFJldmlld2VkLWJ5OiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VA
Z21haWwuY29tPgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSYXBoCj4gCkFwcGxpZWQgdG8gdS1ib290
LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
