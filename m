Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBV+ANNurmnCEAIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 09 Mar 2026 07:55:15 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B70234803
	for <lists+uboot-stm32@lfdr.de>; Mon, 09 Mar 2026 07:55:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C2FCC87ED8;
	Mon,  9 Mar 2026 06:48:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2791EC58D7C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 06:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAokBGc7Ny1NDhWDm/E3+af6EINmDqoVdybjQraqzXqXdvVW6ZZPpaT4/AMxVep1/zhBT7SkYfeRelNHjtYUSlV6Ff7URcVEUrVphAjfSn01gMIPTnXzP6a3h9tDLTsA47reFdLvDJBO4Qtuu5kpbr4qcpIBC53HjLRd6pO59Uk70CCy41lgTj1bf9F4JdqXaGkx7x5yr0vaqGy5v/RWEE2i8FkvUsOrekEEH43Qb8bKntPWatYimmNORVcVpZ/bcmCqeM3gpIDCO2QKTK+tZOZ1UXzF/hXtoaMs+OH/ocUh4G27kS/9bcRydTfIZePdpafqahJzjfCqI7l2CFl8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg5eJpnyOeZZVbNnIb2F07KZhI8KuHxTtiKSCiVZ4ik=;
 b=H+Z/3hsWUXhS3xlgJcjVAb83dAZO0JCEp/yfcoR6En/baqeV8bTFOCtfm3krSkqqXMkeLC8S/UXYAY6otAGTukQRuLiIyBsZecLBJhcb/2hmk0NJoLATQKK9wZShr3YpAOt63d91dGwMX9yWQkY8cMtZkgIQ8uMdN7SspPrCMHLbt9hp0Kcy4zBDRL1AKCJcZBphIVC8RNtBYTw01cBqqPSQU/OLaRqYicjMthtwC/K55FWEDom9qmgqhnla6c4eVyEJDENVfzTNpPOjUhJtTTKXwODeaiaN0tNKG2dRRyp7VyWBpyoVAC2xr6j/VhgI+7xZe5dZo6uPKNNhihVEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg5eJpnyOeZZVbNnIb2F07KZhI8KuHxTtiKSCiVZ4ik=;
 b=KYrGPbmjh9HP9RyQ8bak1SFJM++VFU3CLykHRArEdRFWVg5CDec293WrJcwQw46Yn+F3j8zlFfgqfPecY5xhZpO0+grPwnPfdl6sYM7sxXPW4eNWs0I2oDsJy4ruxcmfhSjZmvRN7GLIpvh8xFBuvKYfvcTsUCJzRlQ9v8j6uUW/q1kypFyby5/YwPNiZIl8nNiOelx+q4XXJCFL112lp/VAtouB6kfXpLx0l6sDPxXaVBFAJfKDhAkJYh/QgEVhRGjlTM/lk09NjZsv33aBvxbGrS7X+AsePfPyoPcfbYNNigHD05PdZQ4PgVYOhjCbnwi5BJ3clQG8mmQMM97a9w==
Received: from AS9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::16)
 by GVXPR10MB8988.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 06:48:04 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:532:cafe::4b) by AS9P250CA0017.outlook.office365.com
 (2603:10a6:20b:532::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 06:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 06:48:04 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Mar
 2026 07:50:17 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Mar
 2026 07:48:03 +0100
Message-ID: <c81042f6-4a32-437c-96df-74d5c8c73622@foss.st.com>
Date: Mon, 9 Mar 2026 07:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?=
 <rgallaispou@gmail.com>, Patrick DELAUNAY <patrick.delaunay@foss.st.com>
References: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
 <50a9f6c3-4284-460c-a429-49b4a53c836e@foss.st.com>
 <beec85d9-a580-4ae3-854d-3c957b888eb2@gmail.com>
 <20260306223317.GW1388590@bill-the-cat>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260306223317.GW1388590@bill-the-cat>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|GVXPR10MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc73dd1-e10f-410f-c6fd-08de7da7d077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: sv8s71qWZt/aZ82+MTigxOQ42IOzjSJKyQdllX5Q+RgL08g52e4jc0PzRPB4K2b1vS8a2WJ377JruGtn9WpM//QP8jZviK7sNv79gWcMXM+GwK4nEWcGJO59Dpjt0jz/zF+VBR/cjqmiWAE8IZpsR5+wXJpAjhm/Fm/XEPa/hS4yBYaTjXdOJNHk3by6PTiKUfpvwp3AEo0oP6b3CBqPxtWB/NPlHH+aW82/6dfBwSd1YrdXM6BYlqTVwLK9ynWlOORSry33yWR2obhnEB2Fbe5UoVy0PdiTDFp+K9e0QhbUJ/HnlL+d1Rt1BCNCotJe/oO/2HIzjsUZJTriK2cMU1vOPJTFIjSKE2RNyuI39/pzXS/89urwGh7fkOYpkEYpQTFNUvTyqyWKprXoqF5OmwR3Fsb+h4yGPqpeU3+XWBt01CYRi6xvPGNulUvXyIjtpRxtMa/385PKORZkDhzUc7yg3M191v1324B6kstKGNSp57UWu9/FnNNi4e1AVbhCZ0KGLyfv/fPlWWtyNlfNVbsNevSremOgYoj/S6Rk+opkFH+uA4bZCrPqfPXuMQojLrLuiNO6ULKGC5kqt3U8pK6yQLMEO5so37b036eI+YWg8XxUGyLYMSYzvIcM44LijcYvZgB1JDEAMMiY/s8H0pR5KUfTwMfJXVgLLTgukiV0uFPo1T5KlVkSmxkVd1lEhLv2QeVO8c/GcoPMAJnlUe2BvB+HURH6GN4xvZt21WvzsDRyDyVUrkiX1Xxk1aOa5muJPY6m7UTqJMQOWq+FjQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PvGb/5yX+YBIMIGqcjKiYLql5ND6s9/CS2Lv+M+xXV/XhLhvT6xRb0q/SdYpHWePi8Nu1hGzeHM82M+vegj54rup3ly2GR8QocWpDvL6woUlVBNWxY9LEgttMg8VdC+vu53bBbzevO6huYJrPzg2jB9ZM5c4EEyMXyt6s5t9cezIN2l+/8y5RwOf4dNKk85sy54pTrNg7jkHUybQyP/hiBEJ32ptwRWfR7iiICiB/OOlUFw7RQB9QhZ6Jt9Vcr1Yu60YfcorOsnDdFwDj7YXQiFCc3FVeowA4eGgJhOpSe/YfjFhZLn/XB7V9Fz7l0gUlKMQVksHEJ6PeDzWv+K4AAJ8+IKizl0QgcfXmOZNUh7jR2iw0sYbC8gNscawt8q82z0mPNnYqDVns+N/mGFYmXDEEAkHTHxSz9tVGR9HQ/jxcWnNDjxNZJqeyYLH81JD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:48:04.2863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc73dd1-e10f-410f-c6fd-08de7da7d077
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8988
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: dsi: add .of_to_plat
	callback
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
X-Rspamd-Queue-Id: 99B70234803
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:rgallaispou@gmail.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:ag.dev.uboot@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[konsulko.com,gmail.com,foss.st.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	FREEMAIL_CC(0.00)[st-md-mailman.stormreply.com,lists.denx.de,gmail.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

CgpPbiAzLzYvMjYgMjM6MzMsIFRvbSBSaW5pIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDAyLCAyMDI2
IGF0IDA1OjIzOjIzUE0gKzAxMDAsIFJhcGhhw6tsIEdhbGxhaXMtUG91IHdyb3RlOgo+PiBIaSwK
Pj4KPj4gQ2FuIHRoaXMgb25lIGJlIHBpY2tlZCB1cCBmb3IgdjIwMjYuMDQgb3IgaXMgdGhlcmUg
c29tZXRoaW5nIEkgc2hvdWxkIGRvID8KPiAKPiBQYXRyaWNrLCBQYXRyaWNlLCBzaG91bGQgSSB0
YWtlIHRoaXMgZGlyZWN0bHkgb3IgaXMgdGhlcmUgc29tZQo+IG9iamVjdGlvbj8gVGhhbmtzIQoK
SGkgVG9tCgpZb3UgY2FuIHRha2UgaXQgZGlyZWN0bHksIAoKVGhhbmtzClBhdHJpY2UKCj4gCj4+
Cj4+IEJlc3QgcmVnYXJkcywKPj4gUmFwaGHDq2wKPj4KPj4gT24gMi8yNC8yNiAxMTowMSwgUGF0
cmljayBERUxBVU5BWSB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDIvNS8yNiAwMDozNSwgUmFw
aGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+PiBEcml2ZXJzIHNob3VsZCBleHRyYWN0IGRldmlj
ZS10cmVlIGRhdGEgYmVmb3JlIHByb2JpbmcgdmlhIHRoZQo+Pj4+IC5vZl90b19wbGF0IGhvb2su
Cj4+Pj4KPj4+PiBJbXBsZW1lbnQgaXQgZm9yIHN0bTMyX2RzaSBkcml2ZXIuwqAgQnkgZG9pbmcg
c28sIGl0IGFsc28gc29sdmUgYQo+Pj4+IHZhcmlhYmxlIHNoYWRvd2luZyBpbiBzdG0zMl9kc2lf
cHJvYmUoKSB3aGVyZSAmY2xrIHdhcyB1c2VkIGFzCj4+Pj4gcGVyaXBoZXJhbCBjbG9jayBhbmQg
cmVmIGNsb2NrLgo+Pj4+Cj4+Pj4gRm9yIHJlYWRhYmlsaXR5IHNvbWUgc3RydWN0IGhhdmUgYmVl
biByZW5hbWVkIHN1Y2ggYXM6Cj4+Pj4KPj4+PiDCoMKgICogc3RydWN0IHN0bTMyX2RzaV9wcml2
ICpkc2kgLT4gc3RydWN0IHN0bTMyX2RzaV9wcml2ICpwcml2Cj4+Pj4gwqDCoCAqIHN0cnVjdCBj
bGsgY2xrIC0+IHN0cnVjdCBjbGsgcGNsawo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFwaGFl
bCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+IFRoaXMg
cGF0Y2ggaGFzIGJlZW4gdGVzdGVkIG9uIHN0bTMybXAxNTdjLWRrMiBib2FyZC4KPj4+PiAtLS0K
Pj4+PiDCoCBkcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jIHwgMTY4ICsrKysrKysrKysr
KysrKysrKysrKwo+Pj4+ICstLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgOTEgaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pCj4+Pj4KPj4+Cj4+Pgo+Pj4gUmV2
aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4+Pgo+Pj4gVGhhbmtzCj4+PiBQYXRyaWNrCj4+Pgo+Pgo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVi
b290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
