Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L8kMf2GFmqqnAcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:54:05 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B335DF9B5
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:54:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 837F6C8F287;
	Wed, 27 May 2026 05:54:04 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011054.outbound.protection.outlook.com
 [40.107.130.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 102D4C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 05:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaAVp3QjoSEqjyRBVpnH4D0hEuV7K5Y26R5FWnsN9DVsnFExo1d28KqZS6SOMDRYjsy73/GpWY8CASXPpV2QzxcLXajQQQLT3AI2XzAbi4fwZyrN043/IIdElE5y00jq/udysB7mZUxayrUgshpgcL5kycxP/WGE4a/gxTN/sCI/gOXcd8C6ocv6svk5sVl6SyOmph6VRfuSkzYzb/TtKajjOwp5qjk4jlLoFP8YS/lLf4C+t092yeI7JE3962eTRH61dSEt/4C5MxwqhYAIsRko75KowAzyBuwgIqz4dUDGVGjuNN/pCZfYheiwMwrU3iWIbzLRuRyrNLEaQp9Wzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20svEs5HKbFOvJh3xc6rZKRCo4bicMvvkIMahUdYBfg=;
 b=Ah5ukrjZ9UJvBUxBhO2rWGTTNJ6cHXsGUz9kVV74TcpeKaguSYwltwo1Ord9V6DXHHn0o6D6OPfwqNfJo4yn+5IpNJkZTnW9QWXE1DfqFBloW9WNrvwNLKPHZEYkEanbSxG6IppZfO6UvIh7+ak/ChQOp35TA41LPHxH7I1ILANMHKNdZlz2u/PXzFVV4zPDEA0WGjC1QKqbYXomPd0qDV6PbhaB8SlapdcMcVsbbaOePoEHgTmu9dIZy5f/DDmOeJ3/CmnV5nD9VDpCyP/Lrb3ALDCk1Ckgog0UsDSfHzxYSI59SbN+eBsBI8FFwRf9k3zcqbdZemlozLLzDnriIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20svEs5HKbFOvJh3xc6rZKRCo4bicMvvkIMahUdYBfg=;
 b=Cd7Muej6EcuWG7SaM7r9m697qolBhb67LQcLxUBkPfJmSXNYLrBwyFi7IC8Kgn0UrYBA/Aawgy/af+mcVWi6bwdODwfox/qqjTiXVz+bdIso4sNsBjNCSdpr54FWvf7MfqPw4eVjQ+YjKCk25oIbEwqf9o+at1h+CLrplG1Hps0L0sbqn6u5z5Bm+78GlXA5svB2A5QmRecNqma4rJGzqtdFJQv+my3FMwzDdFE2uiYNyarrLmpvQBmM65XCKV2s0pdrsFH7NAGzJz7sahGP1q8bXrrEiXdwrPIzFrfpgWcaiYaC8te1bFQg1Qi/U0kZxu6GCDAnUQFrJYLSPF2aXw==
Received: from AS4P189CA0041.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::15)
 by AM8PR10MB4019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 05:54:00 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::5e) by AS4P189CA0041.outlook.office365.com
 (2603:10a6:20b:5dd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 05:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 05:53:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:58:02 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:53:51 +0200
Message-ID: <ec36ce66-37e7-487d-a987-0f9f7035c2bc@foss.st.com>
Date: Wed, 27 May 2026 07:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260224-update_mp251-3_part_number-v1-1-d8bf2033b3ed@foss.st.com>
 <2590b373-0184-4d53-920c-74442680789a@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2590b373-0184-4d53-920c-74442680789a@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|AM8PR10MB4019:EE_
X-MS-Office365-Filtering-Correlation-Id: fa420f20-f8e9-46ca-9536-08debbb45932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: idrS7WdI+yJEZF1slEzicupRCK5igXGXCzUrLrCuH6XCib5iq4Js1yLfdAe/nB9jIKKOClEUFvIxgGih8uSkBFp+ALlg7ESfEYIPI3yyvtzbYBrLcUsb1wCJqjskCwVEnFlnE0UjOASSUWQ/aK2MB4AMHm6O5cDorykY4T3TJKGUC9Mu3hk7clYAO8j0AR+aanyXsRBdE8wTVha/BosfrTnjX/162Pu3Teh0jGWFvCGS+3NiohVWZIbWndRqPABQrKvpylsQ6pqCp/I89faEU871wkQ3Un3BCvexRYCF0MDr+/PbQ0k6fm2xIhr9GDwSUMv6bPyzr+ZuTc9SIN7GJ+dUA1z0KMKbUkMgsPFmVMbRjITfNhhfb95sKBWPFoU/qRQt0o8FYRlHnGQx5EzFr0ubWy34Lt4cfS5R3tCTeoJhLYvfdOM8opDptpXdLlSlcrNfXQ60T8PLLZezg1pFplXyy4JyCJV78DCEz6guhz2rZbe+TWhWI+GmdT6dZ2SrA3H8ZPFN5nXD/OgSD/DFvNjeks1QqvXbZtWaji2HnQoalevXCTyP19SWc86X3ZocAAyucZCt/rYpZ2YjO2lc+CCy+7PWe55s3vvyHgP761h0b2chnJsbVBNJuJ4lBt5fU9D/6Wysq3NSkJ+VelLrzHxE8yBUy03YecsWJKOWQ1tcQTm4Qa6YE+FaT66VplwLJt2KkyZD/M5+FqSd+YKEZ68IzSBRz1IkGthVE9DuuNQ=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bHEppbkahOT8m+I0LXiGiczF/t9bfu0fzxtXh0g7k9vDaDTPSnx0hY3JQ7KzS9wRPkeUr9+MZzc5JkeSEF2qF3xXNGiywhD8GLHrTs4Rp6dNNWBVsT/zNJzwbR6JUWhNR/Ek+h0JAQRXyG0QEwXH2+/Ji/iKfYmcWktYE2zzErgvI07nuIcy99OZROiKRRNF+res/SarKlFt9+dpuJ9TVQ7LKq58BF2itP/+yElW0n2Y1EZpVlPiMDO098VFeFwzUg0aSYTD1HTikrhDWyY/L0ZXEDBRxx87tGts9xiiWPdcls/t66SWnp4qeMlEnGRMlAGONJoPKDqKpP6lsOIgfqJ0eaNkr6KCq25zYj6wblDRQbM5KyroxplebmekL6s9CqLt93JGMdnKAmRQVnVOY6eYcHV5xcfyCHBGNgu69l12WKag3qTor1qzT/swAB/m
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:53:59.7366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa420f20-f8e9-46ca-9536-08debbb45932
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4019
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp2: update part number for
	STM32MP251/3
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
X-Spamd-Result: default: False [2.99 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.947];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66B335DF9B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiA1LzIyLzI2IDEwOjA3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvMjQvMjYgMTg6MzEsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gdXBkYXRlIHBhcnQgbnVt
YmVyIGZvciBTVE0zMk1QMjUxLzMgZm9yIGxhc3QgY3V0IHJldmlzaW9uLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4g
LS0tCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3lzX3Byb3RvLmgg
fCAxNiArKysrKysrKy0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMy
bXAvaW5jbHVkZS9tYWNoL3N5c19wcm90by5oIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1
ZGUvbWFjaC9zeXNfcHJvdG8uaAo+PiBpbmRleCBhODc1OTA3YWMzZS4uMDVjZTg2OWM0MjggMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3lzX3Byb3Rv
LmgKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zeXNfcHJvdG8u
aAo+PiBAQCAtNjEsMjAgKzYxLDIwIEBACj4+IMKgIC8qIElEIGZvciBTVE0zMk1QMjV4ID0gRGV2
aWNlIFBhcnQgTnVtYmVyIChSUE4pIChiaXQzMTowKSAqLwo+PiDCoCAjZGVmaW5lIENQVV9TVE0z
Mk1QMjU3Q3h4wqDCoMKgIDB4MDAwMDIwMDAKPj4gwqAgI2RlZmluZSBDUFVfU1RNMzJNUDI1NUN4
eMKgwqDCoCAweDAwMDgyMDAwCj4+IC0jZGVmaW5lIENQVV9TVE0zMk1QMjUzQ3h4wqDCoMKgIDB4
MDAwQjIwMDQKPj4gLSNkZWZpbmUgQ1BVX1NUTTMyTVAyNTFDeHjCoMKgwqAgMHgwMDBCMzA2NQo+
PiArI2RlZmluZSBDUFVfU1RNMzJNUDI1M0N4eMKgwqDCoCAweDAwMEIzMDBDCj4+ICsjZGVmaW5l
IENQVV9TVE0zMk1QMjUxQ3h4wqDCoMKgIDB4MDAwQjMwNkQKPj4gwqAgI2RlZmluZSBDUFVfU1RN
MzJNUDI1N0F4eMKgwqDCoCAweDQwMDAyRTAwCj4+IMKgICNkZWZpbmUgQ1BVX1NUTTMyTVAyNTVB
eHjCoMKgwqAgMHg0MDA4MkUwMAo+PiAtI2RlZmluZSBDUFVfU1RNMzJNUDI1M0F4eMKgwqDCoCAw
eDQwMEIyRTA0Cj4+IC0jZGVmaW5lIENQVV9TVE0zMk1QMjUxQXh4wqDCoMKgIDB4NDAwQjNFNjUK
Pj4gKyNkZWZpbmUgQ1BVX1NUTTMyTVAyNTNBeHjCoMKgwqAgMHg0MDBCM0UwQwo+PiArI2RlZmlu
ZSBDUFVfU1RNMzJNUDI1MUF4eMKgwqDCoCAweDQwMEIzRTZECj4+IMKgICNkZWZpbmUgQ1BVX1NU
TTMyTVAyNTdGeHjCoMKgwqAgMHg4MDAwMjAwMAo+PiDCoCAjZGVmaW5lIENQVV9TVE0zMk1QMjU1
Rnh4wqDCoMKgIDB4ODAwODIwMDAKPj4gLSNkZWZpbmUgQ1BVX1NUTTMyTVAyNTNGeHjCoMKgwqAg
MHg4MDBCMjAwNAo+PiAtI2RlZmluZSBDUFVfU1RNMzJNUDI1MUZ4eMKgwqDCoCAweDgwMEIzMDY1
Cj4+ICsjZGVmaW5lIENQVV9TVE0zMk1QMjUzRnh4wqDCoMKgIDB4ODAwQjMwMEMKPj4gKyNkZWZp
bmUgQ1BVX1NUTTMyTVAyNTFGeHjCoMKgwqAgMHg4MDBCMzA2RAo+PiDCoCAjZGVmaW5lIENQVV9T
VE0zMk1QMjU3RHh4wqDCoMKgIDB4QzAwMDJFMDAKPj4gwqAgI2RlZmluZSBDUFVfU1RNMzJNUDI1
NUR4eMKgwqDCoCAweEMwMDgyRTAwCj4+IC0jZGVmaW5lIENQVV9TVE0zMk1QMjUzRHh4wqDCoMKg
IDB4QzAwQjJFMDQKPj4gLSNkZWZpbmUgQ1BVX1NUTTMyTVAyNTFEeHjCoMKgwqAgMHhDMDBCM0U2
NQo+PiArI2RlZmluZSBDUFVfU1RNMzJNUDI1M0R4eMKgwqDCoCAweEMwMEIzRTBDCj4+ICsjZGVm
aW5lIENQVV9TVE0zMk1QMjUxRHh4wqDCoMKgIDB4QzAwQjNFNkQKPj4gwqAgwqAgLyogcmV0dXJu
IENQVV9TVE1QMzJNUC4uLlh4eCBjb25zdGFudHMgKi8KPj4gwqAgdTMyIGdldF9jcHVfdHlwZSh2
b2lkKTsKPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0OiBjNjFkNmY2N2Y0NmYwNTE0OTE4MmIzM2Mz
YzBiYTVkOWI2YjQ2ODg5Cj4+IGNoYW5nZS1pZDogMjAyNjAyMjQtdXBkYXRlX21wMjUxLTNfcGFy
dF9udW1iZXItNDIxOTZjNGY3ZDQ5Cj4+Cj4+IEJlc3QgcmVnYXJkcywKPiAKPiBSZXZpZXdlZC1i
eTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBU
aGFua3MKPiBQYXRyaWNrCj4gCgpBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5r
cwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
