Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HQzZGh6vR2rxdQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 03 Jul 2026 14:46:22 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 081787027EB
	for <lists+uboot-stm32@lfdr.de>; Fri, 03 Jul 2026 14:46:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=k4fVuNih;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC6D6C8F263;
	Fri,  3 Jul 2026 12:46:21 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B913EC0F02D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2026 12:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkPP3VAmSwT2HvnnEpe2ufY5i2TVwkHph7cZJ6aYXKUmLwGc3hSRLDxSf37NNRkHbXY9+h1d69ElfBfhIXU+W7zhWE7L7kYp6rJGX7pn0wOKAzTTfRWbHJdM6/8769ZhKBrtKtvA8PgtJ+HDwSlYpM7jLZX+XjDecrNMOMTTzghzfk+0wLhNJ54mpKgMcRWl7QXxNp9/Th57ytGD+5ZZGqZkJxdqixKOV1SJWucExEHMY4h/dXS4VoOS/HhzKjeS0TB2jmXkpICGhKRg6kT0l4LmgELeSh39Z0gyTbjU+F42sAu6+lKjjjBV2sjvwvJ8JRbjPGLKygdiTtxMnHNAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AWeIoTpCNL8dEnD28JjLzK5eqamvUS059TDACb33bM=;
 b=WVK3MYSx4tf/zUelu/H/BwOsHYqzK7pvU4E34lqfcbUBuXXs1ITbMo1HyZ7rfAcPZNWnP3tjw6QH6uoSJ3nWYZJjkP2nEY4eR/AHshNcRYSD/lEw0lhbHHhl0/6yiSjmcWJ2cwEiJx+XHuq8zdLa0moNGAeBw7+Re4K9BuoCDqYDj4/LxX5A8NsqiTaGQTEI9jG/tChI0/vW+a3AM5d9ArNsgSTSOSJi5vx4hHmQ+ATfJ40OOqHNwXZVJOVN2G529U3OOd3Xb/pP5n8udYWmK3Y0U8QJgUWrpm2bggF5oCNFLE1ud23GXIXIfKPY1Qwt1Yu+vnLjZGhvMmmhSDusKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AWeIoTpCNL8dEnD28JjLzK5eqamvUS059TDACb33bM=;
 b=k4fVuNihrjgCc5Q54nQkwGAzB5FE1NaA40MYdVIB+FQO87QZiu/ChLNW6Oj7TETyHCmMQTUrTQtEj6Q0nAMBGLUjgFRq5iXv7mvaxw7+WGveItqphh4KE3Cvsy39jtzZqLfeP/BuoWLgXnEya2XbTrIOe7zZb/uBKOEMEKY1vcQivjujezOrQkZ7DQFgWTyOY/t3GRauGIPBLUy+z0A0p49+RZh2ZCAqGjiU78HR+JtWBpFtflEgIBH7sGjp1Ld6kpKCCCRXyZHK0Yw2Srt+ZadnrUKRN82OgpS3cSBRIvu1otZ2l2FYq7mqX5q1l1ieMPRRd3JQLiBCRzHKTOS9OA==
Received: from DU6P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::16)
 by DB8PR10MB3814.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 12:46:18 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::5b) by DU6P191CA0015.outlook.office365.com
 (2603:10a6:10:540::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 12:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 12:46:17 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 3 Jul
 2026 14:50:35 +0200
Received: from [10.252.26.28] (10.252.26.28) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 3 Jul
 2026 14:46:16 +0200
Message-ID: <9a7a6227-228b-4528-96df-4d80946230ec@foss.st.com>
Date: Fri, 3 Jul 2026 14:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@nabladev.com>, Sean Nyekjaer <sean@geanix.com>, "Tom
 Rini" <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20260618092921.3702970-1-sean@geanix.com>
 <4e7b14fd-da00-42d5-9221-719313eecfab@foss.st.com>
 <bf804b49-55fd-4bfc-9898-2265dfad95d7@nabladev.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <bf804b49-55fd-4bfc-9898-2265dfad95d7@nabladev.com>
X-Originating-IP: [10.252.26.28]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|DB8PR10MB3814:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a52243-8437-46d1-4b31-08ded90113ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|4143699003|22082099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: V0giFxQhI6N6MAcsW1BYuchvQxdY41cJVjGV8fOf1qwqtF7vTevwrBk5V+rclYk5/qfIn7+AZG8qwGQbRDxF0Qd8bN1Ceu/sb3/17zD3TNLspHiyZ9VfRtvchOdGv/cBZ8H0z+aBIlR574Kdz9+2hUWOSMynXHyleUFrS6Z7N9udQfh5bSqTUBkVLkF7HeXnJBsMeEIkbmZPdcBTFDiYr0npOJFUO+/9QwQvvo4AVGTvOtKdSWlgxpY95OVYOSYQ2MVlM7kieYUgd6bav0wUCOaYmi8JSR+73b+FRG2Kk+NgmKYvcSJA/o1H0f7euj/mfWl8/Br5Nki5++rdC0FLjZYk1e3IktmDW/T5CSE7vyceyJItYa4Cmiqr+2rvMoYAEIVW/s/gVVUtvHy5so1475elg2Ie/xkcu/z6zpndyNSR1ilishUQoGqxuZZDRxPubFoAcu0g6m9lgYukRK8XjXi9b+91dH69HQR5q2Sqq6znOybo4RytGqj6rqsL/MinFKO0aPPXPekicZg0D0OEYtuwpNKAGNqrt2KBA5B+zs/Ys/OCjVcp2WF1Ap1dHhmArWX291GAsbf32xUvhe2p9u8yGplbTCBShH91qaMfSLA9dzW7B/QZG3EHxk1edcW0nbnoq8Cb3DqkADESz5NJ0wKkDGlVetWNhnt0ErsnuZHN0zYFgYf+yUNk2JJZTqRZdFIzfSo/ed7WOSJMCAOvsA==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(4143699003)(22082099003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +X6Pq0NJcr1HKmgSFkGnrUdYrkmuKh9NVEC3kdifCHKty844iLOV9G40xNA40m7bSRJ5gAuwkhhaRgh1b4l578aWDvX/YZNlRJI8710h+4ANqPNnu9lbseqDYhrnQcc8ukMFFkQ6Nqcg/l9oBuiwIqkCTxvils7UjB0XdU6nQjfwadIE4CYJ2dEOE/KjUP8uLtS86aj/inLNQOmScYcg28UQryO4nUWdIusx1T26hLfFuMcOaevbZ7QfdzzgehdnBFvvW1rzn4/a+00M9PWIija+WBhUAhzVmEvukLhbflAcGivRSx7gzT7mycj1VFdNF84JocGidh2sHgNcd0oJ6vNGUC4uKzhFa35byG0wsmvAjkYuuCheoe1gBAtSr6UrO2Pe8EU1ulhb9ipFB/MX1MqmwtN45YzN+eDBfZYJOtdwdvglVCbUTL2vXULDfTxT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:46:17.9549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a52243-8437-46d1-4b31-08ded90113ad
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3814
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: use debug() for image entry
	point message
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.99 / 15.00];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:sean@geanix.com,m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,geanix.com:email,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,foss.st.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 081787027EB

CgpPbiA2LzI1LzI2IDE0OjMzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzI1LzI2IDg6MzEg
QU0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4KPj4KPj4gT24gNi8xOC8yNiAxMToyOSwgU2Vh
biBOeWVramFlciB3cm90ZToKPj4+IFRoZSBzdG0zMm1wMSBzcGVjaWZpYyBjb2RlIHByaW50cyB0
aGUgaW1hZ2UgZW50cnkgcG9pbnQgdW5jb25kaXRpb25hbGx5Cj4+PiBiZWZvcmUganVtcGluZyB0
byB0aGUgbmV4dC1zdGFnZSBpbWFnZSwgdW5saWtlIHRoZSBnZW5lcmljIFNQTAo+Pj4gaW1wbGVt
ZW50YXRpb24gaW4gY29tbW9uL3NwbC9zcGwuYy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvYXJtL21hY2gt
c3RtMzJtcC9zdG0zMm1wMS9jcHUuYyB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9t
YWNoLXN0bTMybXAvc3RtMzJtcDEvY3B1LmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJt
cDEvY3B1LmMKPj4+IGluZGV4IDI1MmFlZjE4NTJlLi5lYTVkOGE2NDhkZiAxMDA2NDQKPj4+IC0t
LSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9jcHUuYwo+Pj4gKysrIGIvYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL2NwdS5jCj4+PiBAQCAtMzYxLDcgKzM2MSw3IEBAIHZv
aWQgX19ub3JldHVybiBqdW1wX3RvX2ltYWdlKHN0cnVjdCBzcGxfaW1hZ2VfaW5mbyAqc3BsX2lt
YWdlKQo+Pj4gwqDCoMKgwqDCoCBpbWFnZV9lbnRyeV9zdG0zMl90IGltYWdlX2VudHJ5ID0KPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCAoaW1hZ2VfZW50cnlfc3RtMzJfdClzcGxfaW1hZ2UtPmVudHJ5
X3BvaW50Owo+Pj4gwqAgLcKgwqDCoCBwcmludGYoImltYWdlIGVudHJ5IHBvaW50OiAweCVseFxu
Iiwgc3BsX2ltYWdlLT5lbnRyeV9wb2ludCk7Cj4+PiArwqDCoMKgIGRlYnVnKCJpbWFnZSBlbnRy
eSBwb2ludDogMHglbHhcbiIsIHNwbF9pbWFnZS0+ZW50cnlfcG9pbnQpOwo+Pj4gwqDCoMKgwqDC
oCBpbWFnZV9lbnRyeShyb21hcGkpOwo+Pj4gwqAgfQo+Pj4gwqAgI2VuZGlmCj4+Cj4+ICsgTWFy
ZWssIGFzIGhlIGlzIHRoZSBhdXRob3Igb2YgdGhlIHBhdGggd2hpY2ggYnJhbmcganVtcF90b19p
bWFnZSgpCj4+Cj4+IFBlcnNvbmFsbHkgaSBkb24ndCBtaW5kIG9mIHVzYWdlIGVpdGhlciBwcmlu
dGsoKSBvciBkZWJ1ZygpLgo+PiBNYXJlaywgd2hhdCBkbyB5b3UgcHJlZmVyID8KPiBkZWJ1Zygp
IGlzIGZpbmUsIHRoYW5rcyAhCgpSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+CgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
