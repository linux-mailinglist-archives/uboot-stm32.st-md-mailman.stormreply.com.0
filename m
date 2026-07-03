Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id unLZB9itR2qDdQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 03 Jul 2026 14:40:56 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5E7026F2
	for <lists+uboot-stm32@lfdr.de>; Fri, 03 Jul 2026 14:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=omKi+Dm5;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D907C8F263;
	Fri,  3 Jul 2026 12:40:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 385ECC0F02D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2026 12:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/IkftyB2Ji5CSsXyIpAYxwrSh7NnT70ioxMioB+4FyczUMnmqa3Qs7GOIEAEgmvt7BGfYWAF3Ueh7DeVIWLE8aKojUcPh3NYDfk959bJu33gQfeVtO/FsqotUDtt9B/EucTLS5Io1ufQmY3//h81PJpFucicT0vqBBCIVEC/37VT0gzpAMsp6dmBWQ1iresNL5r1uuJfXQxF8VhKjtTFt6+d8x/tONnCaaldEuFmBnWyrNxn0rYOQyISuUIypov6IMaBqylTsuwfXaCzefwA+qAgeiK5eCTHs3OpewcNYq0Q8QkjCpoK7KvT8VWbXTk/lcBxifxEP8EwBkPrOXdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Re1kjTPoSrHbtXNW2bBD3ZZDgQ0Jk8c1Fx+O1R8tifk=;
 b=aHIWc+C8OvmzyaB/38c+S6UgfPz423J91IZzOawQlwAvZ5LgeMnzvCq891jBxpBe9hZ7+361HNgm/TsIu2fqDbPUIAMhCILDpbMx4IZpeLNtX9Rwm9+0xgexh0oZgW5U9lhb67kdCRvy3HGHT2xSPRzCnfxlooYfaURwZGnZWlMH9Wf+dJFFMHsFDkZ3qqInwKRTxs3qvvV08YIml9jU/kicHPdGAhFtBO+mi/Sz0GIGu2e+ZcFNYxqkrNQx+aASTK8OdJz5WbuJXa/LmkWGRnnPApk7gJlMN0TpzEQ4RIRZGR9JisahOOQkJb3nQX0GiGyW9PeTcue8g0s1jPU9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re1kjTPoSrHbtXNW2bBD3ZZDgQ0Jk8c1Fx+O1R8tifk=;
 b=omKi+Dm5wZ8Yf7E11nXa/vJh+nYhzb0WdnvrgTmNsYEbZ6Jqphh/9B+n9sFYoQepVaM4cAYgKY7Cp149VyQHQBzwIRRby9oH6iGtK/zpos7pS8FgUPnbEFSorw1fuDOgsWmXNOPvCbduAeLl7F3EfMoR7sS+3dmr26/QUQfrJrszRALfOm6xHxFT7NPgbkcK+0oFvSuv0BDFRqGbCYaagprLu0cY4WgcPhpkZm29lgzCZ7k820U13zPkLCu3RPb4P6VnvStLH6cG0chdM3LZzAqnfXuGDg8W7hzcGUwVHdZGj0q/n73auHK4JzQSR0Zo/SLLSbRLNX9cXkhxDszMRg==
Received: from AS4P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::19)
 by AM0PR10MB3666.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 12:40:50 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::1e) by AS4P190CA0029.outlook.office365.com
 (2603:10a6:20b:5d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 12:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 12:40:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 3 Jul
 2026 14:45:07 +0200
Received: from [10.252.26.28] (10.252.26.28) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 3 Jul
 2026 14:40:48 +0200
Message-ID: <2daeaf66-4cb9-4bc5-8632-6a64bccbc84e@foss.st.com>
Date: Fri, 3 Jul 2026 14:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20260529153159.3944049-1-dario.binacchi@amarulasolutions.com>
 <8aab07b8-9a23-4c0d-a2f9-3943f6490a60@foss.st.com>
 <CABGWkvoUa0AHPFmqD-AKfik8oMdBh=JD-1JUcb3cMFDovmdwmg@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CABGWkvoUa0AHPFmqD-AKfik8oMdBh=JD-1JUcb3cMFDovmdwmg@mail.gmail.com>
X-Originating-IP: [10.252.26.28]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|AM0PR10MB3666:EE_
X-MS-Office365-Filtering-Correlation-Id: 2577d38b-93d9-4a32-7bb9-08ded9005006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|13003099007|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: sgx7FUt18XLOGfbvWd+KBK0lMHh/GkJdGT4AAM+v04i3VLjeFHpCi/h+C+6XvkMOffWAGXfsJCIrJSXWVBP3LMTAwlQ+N116VlwXG1I+Upjf978tFA4uDy378CEB36WQku9P/nAhbkPi69yAh5orIuhhvd04hSaJt8ukVae/jNrgaocVU9nsdjy+SV+jBDn/qg8r7UKIWfqXOUomEnJuCFQNxp8+Ow/jZQjbxDvXv8gGDlssxuBN4kfpTJMEuTsvhanV9z0R2Tm0YpTlIpuEinTBsDUnrCtHLsC1NbY3PmXw6z5FtHodRgbUIT6O9nFJ7tSoEPoFlvadGyAQlzyp0aPPUeNM1LFuOj1hV5y1GrNgJ8mNluvLkQMKSiZM8C+7CpTlwmDQLr13GNmCafR4CcosRe82+FKpeTmMPjcjHLXq+V4J3GzhXJFGeSouEfjsDGcpyE48v0pFQWxEif0o1/PHwJf0QAG7rUU7nTu6SW6koFsxvJVj0uNxm0D0EDe4Ki+R3YVUORvZKXwnKJMvx3d9wQVM12JnyFQxAaxDgSIYRdNrXTlq4xvRnWcDjEsJPwdr76qIjviaUTCAugfLm7v8n9TlcBwrBNBUULdJBVskd2r25gtQh1+8zR6k8vlkXuxwnWj0VyuzjPUo1+kWqhHtJ/hcRm6TUYOYoglbdwW3j3hwX9MdfMFwyydSZijEjoI/5f/mUb6SXYVVk1/HlQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(13003099007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tBahtvwaEuKFvAykTZ7cmUZMeib9iR9Y1d6lJ95FgdKW6JwJmJ88DR3RLIJk2WBeKsDSl9/Oz6PXETEvka52bDuG3Vd9Ml1HFx/gXpxcaI7ERsI6aLU4piiq+ys5erM3QQrnulmpY1ABAB7M4bwGR4VVas+j8sHXeBWqeCES9H3JXwPWVloHe77V6gKRE5cmpwcK7MeLQ0/qzBuay44c4le5cT57rson3puGQYl1fvCwPznqVUwfIDp8R02i9l8ORDn1yAqr+RTqhZb9NlWDiiXdjHe11UH07+91xrY9ikONvvy62MEGJdUA27/rdDT2XGhkzxQYat8sco9kr11b4CmaWRee3yiihBmFVs6YRjnl6Md9COXgezQSNZsbBPob7ldzHKn7oMcwqMwFIVXvroQ9e2tjBmVBGypLEatoulDUTLMUOr0JHVWmXEaRIoSW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:40:49.8157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2577d38b-93d9-4a32-7bb9-08ded9005006
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3666
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2] ARM: dts: stm32: add U-Boot specific
 dtsi for stm32mp157f-dk2
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC5E7026F2

CgpPbiA3LzIvMjYgMTU6MDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEhpIFBhdHJpY2UKPiAK
PiBPbiBNb24sIEp1biAyOSwgMjAyNiBhdCA5OjI54oCvQU0gUGF0cmljZSBDSE9UQVJECj4gPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDUvMjkvMjYg
MTc6MzEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+Pj4gVGhlIFNUTTMyTVAxNTdGLURLMiBib2Fy
ZCBpcyBhIGRpcmVjdCBkZXJpdmF0aXZlIG9mIHRoZSBTVE0zMk1QMTU3Qy1ESzIuCj4+PiBBcyBl
eHBsYWluZWQgYnkgU1QgWzFdLCB0aGUgIlNUTTMyTVAxNTdGLURLMiBpcyBhc3NlbWJsZWQgd2l0
aCBsYXRlc3QKPj4+IFNUTTMyTVAxNSBSZXZaIGN1dCB3aGljaCBpcyB0aGUgb25seSBvbmUgYXZh
aWxhYmxlIGZvciBuZXcgcHJvZHVjdCBub3cuCj4+PiBUaGUgbWFqb3IgZGlmZmVyZW5jZXMgaW4g
dGhpcyAnRicgdmFyaWFudCBTb0MgYXJlIHRoZSBpbmNyZWFzZWQgbWF4Cj4+PiBmcmVxdWVuY3kg
b2YgdGhlIENvcnRleC1BNyBjb3JlcyBhbmQgdGhlIGNvcnJlY3Rpb24gb2Ygc29tZSBIVyBidWdz
Cj4+PiAoRGV2aWNlIFJldi5aLCBzZWUgZXJyYXRhIEVTMDQzOCkiLgo+Pj4KPj4+IE9uIHRoZSBz
b2Z0d2FyZS9hcmNoaXRlY3R1cmUgc2lkZSwgdGhpcyB2YXJpYW50IHV0aWxpemVzIFNDTUkgKFN5
c3RlbQo+Pj4gQ29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UpIGZvciBzZWN1cmUgd29y
bGQgcmVzb3VyY2UgbWFuYWdlbWVudC4KPj4+IEFzIGEgY29uc2VxdWVuY2UsIHRoZSB1bmRlcmx5
aW5nIHN0bTMybXAxNS1zY21pLmR0c2kgZXhwbGljaXRseSBkZWxldGVzCj4+PiBzZXZlcmFsIGZp
eGVkIGNsb2NrIG5vZGVzIChzdWNoIGFzIGNsa19oc2UsIGNsa19oc2ksIGNsa19sc2UsIGNsa19s
c2ksCj4+PiBhbmQgY2xrX2NzaSksIG1ha2luZyBpdCBpbXBvc3NpYmxlIHRvIGluY2x1ZGUgc3Rt
MzJtcDE1N2MtZGsyLXUtYm9vdC5kdHNpCj4+PiB3aXRob3V0IHRyaWdnZXJpbmcgY29tcGlsYXRp
b24gZXJyb3JzIGR1ZSB0byB0aGVzZSBtaXNzaW5nIGNsb2NrIGxhYmVscy4KPj4+Cj4+PiBTbyBs
ZXQncyBpbnRyb2R1Y2UgYSBkZWRpY2F0ZWQgc3RtMzJtcDE1N2YtZGsyLXUtYm9vdC5kdHNpIHRo
YXQgZGlyZWN0bHkKPj4+IGRlZmluZXMgdGhlIGZ3dS1tZGF0YSBub2RlLiBUaGlzIHByb3ZpZGVz
IHRoZSBuZWNlc3NhcnkgRldVIG1ldGFkYXRhCj4+PiBjb25maWd1cmF0aW9uIHJlcXVpcmVkIHRv
IGFsbG93IGF1dG9tYXRpYyBBL0IgYmFuayBzZWxlY3Rpb24sIHN1cHBvcnRlZAo+Pj4gZm9yIFNU
TTMyTVAxNSBib2FyZHMgYnkgY29tbWl0IDU2MGQ4ZjMyNzAzZiAoImJvYXJkOiBzdDogc3RtMzJt
cDE1Ogo+Pj4gc3VwcG9ydCBkeW5hbWljIEEvQiBiYW5rIGJvb3R1cCIpLgo+Pj4KPj4+IFsxXSBo
dHRwczovL2NvbW11bml0eS5zdC5jb20vdDUvc3RtMzItbXB1cy1wcm9kdWN0cy1hbmQtaGFyZHdh
cmUvaS1tLXdvbmRlcmluZy13aGF0LXMtdGhlLWRpZmZlcmVuY2UtcG9pbnQtYmV0d2Vlbi1zdG0z
Mm1wMTU3Yy90ZC1wLzIxMzQ2MAo+Pj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pj4KPj4+IC0tLQo+Pj4KPj4+IENo
YW5nZXMgaW4gdjI6Cj4+PiAtIERyb3AgdGhlIGluY2x1c2lvbiBvZiBzdG0zMm1wMTU3Yy1kazIt
dS1ib290LmR0c2kgdG8gYXZvaWQgY29tcGlsYXRpb24KPj4+ICAgZXJyb3JzIGNhdXNlZCBieSBk
ZWxldGVkIGNsb2NrIG5vZGVzIGluIHN0bTMybXAxNS1zY21pLmR0c2kuCj4+PiAtIERpcmVjdGx5
IGRlZmluZSB0aGUgZnd1LW1kYXRhIG5vZGUgaW4gc3RtMzJtcDE1N2YtZGsyLXUtYm9vdC5kdHNp
IHRvCj4+PiAgIHByb3Blcmx5IHN1cHBvcnQgYXV0b21hdGljIEEvQiBiYW5rIHNlbGVjdGlvbi4K
Pj4+Cj4+PiAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdmLWRrMi11LWJvb3QuZHRzaSB8IDExICsr
KysrKysrKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdmLWRrMi11LWJvb3QuZHRzaQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2YtZGsyLXUtYm9vdC5k
dHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdmLWRrMi11LWJvb3QuZHRzaQo+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzc4MDU0MTdiZmE5Cj4+PiAt
LS0gL2Rldi9udWxsCj4+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2YtZGsyLXUtYm9v
dC5kdHNpCj4+PiBAQCAtMCwwICsxLDExIEBACj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjArCj4+PiArLyoKPj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjYgQW1hcnVsYSBT
b2x1dGlvbnMsIERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbT4KPj4+ICsgKi8KPj4+ICsKPj4+ICsvIHsKPj4+ICsgICAgIGZ3dS1tZGF0YSB7Cj4+PiAr
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGZ3dS1tZGF0YS1ncHQiOwo+Pj4gKyAg
ICAgICAgICAgICBmd3UtbWRhdGEtc3RvcmUgPSA8JnNkbW1jMT47Cj4+PiArICAgICB9Owo+Pj4g
K307Cj4+Cj4+IEhpIERhcmlvCj4+Cj4+IFdoYXQgYWJvdXQgaW5jbHVkaW5nIHN0bTMybXAxNTdj
LWRrMi11LWJvb3QuZHRzaSBpbnN0ZWFkIG9mIGRlZmluaW5nIGZ3dS1tZGF0YSBub2RlID8KPiAK
PiBUaGlzIHdhcyBhY3R1YWxseSB0aGUgYXBwcm9hY2ggdXNlZCBpbiB2MS4gSG93ZXZlciwgYXMg
eW91IHBvaW50ZWQgb3V0IGluIHRoZQo+IHYxIHRocmVhZCBbMV0sIGl0IGRvZXMgbm90IGJ1aWxk
IGJlY2F1c2Ugc3RtMzJtcDE1LXNjbWkuZHRzaSByZW1vdmVzIHRoZQo+IGNsa19oc2UsIGNsa19o
c2ksIGNsa19sc2UsIGNsa19sc2kgYW5kIGNsa19jc2kgbGFiZWxzIHJlZmVyZW5jZWQgYnkKPiBz
dG0zMm1wMTU3Yy1kazItdS1ib290LmR0c2kuCj4gCj4gVGhhdCdzIHdoeSBJIGRyb3BwZWQgdGhl
IGluY2x1ZGUgaW4gdjIgYW5kIGRlZmluZWQgb25seSB0aGUgZnd1LW1kYXRhIG5vZGUKPiBsb2Nh
bGx5Lgo+IAo+IE9yIGFtIEkgcGVyaGFwcyBtaXNzaW5nIHNvbWV0aGluZz8KCkhpIERhcmlvCgpT
b3JyeSwgeW91IGFyZSByaWdodCwgaXQncyBqdXN0IGZvbGxvd2luZyBhbiBpbnRlcm5hbCBkaXNj
dXNzaW9uIHdpdGggUGF0cmljayBhbmQgaSB0b3RhbGx5IGZvcmdvdCB5b3VyIAp2MSBpbXBsZW1l
bnRhdGlvbiBhbHJlYWR5IGluY2x1ZGVkICBzdG0zMm1wMTU3Yy1kazItdS1ib290LmR0c2kgYW5k
IGhhcyBjb21waWxhdGlvaiBpc3N1ZS4KClBhdHJpY2UKCgo+IAo+IFsxXSBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAyNjA1MTIwNzExNTcuNTY0MDgx
LTEtZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20vCj4gCj4gVGhhbmtzIGFuZCBy
ZWdhcmRzLAo+IERhcmlvCj4gCj4+Cj4+IFRoYW5rcwo+PiBQYXRyaWNlCj4gCj4gCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
