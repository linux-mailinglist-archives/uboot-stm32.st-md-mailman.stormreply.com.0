Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCc/E1rdDWqC4QUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:12:10 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A6591990
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:12:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFC28C87ED1;
	Wed, 20 May 2026 16:12:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95A3BC01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 16:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHIZISkL+WOQpDqgHzlsMP4zXwsei+lREjupjXgt8baJnA4MaKEyQNCZcJUSizoktgpJ3u3MbaCpzlJVKou9eCBgX+UbhZeIV5aQLnISTNqnBsxfUitE4+UJyuMA2A4Xj9G4dRVt0Fsl56pWZWJMXOG/oU718ZjyOrazHjyrSBwqz7NZAnaeKwRTOi1AahYI4LYib/pySW5pF7qLL8Oh0tTF0pVzqVaUlhc265jZE0T1iEnqTrmXk+R9cqQtmf63fEi2xfJ9OBwDzgQJVNxB5TWYY7wwQpkPuNQtdvrsY1mIugHsZwTdEsWnbkLCJDOcboZ7/yjYMs9HrN9H6RVFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7isMdAfGwiqfjDTwmLXG/pVqWGCof8IdrSoU8JtP9NM=;
 b=rJC6O3w1vZ9zps/xWAQJwhiI7Z/8HqYdYDRwKBNVbZD+stuDsNYzyny1ngToYr12uc3rwJfwuknUfttjaf8k9qg9fhjP7BzW0uG2/iCOapxpPKklq4xPQZHwRaoDhok3x2BGyScYd4q/hYqPO5spKtTEceUkS3rJxW2XbiJ1/YY1VqC5dI+hs/AOLnaADtw+M8bbngFN3hKo8Whv0z91ysmcxK3vDV2GlDRomsBp7TxoJE1fw0c0LduzOiEWubT4kiTXIwI1HcBKg66UdALZeoqiGjxKiWWLc2rALJVNYeScI/9qsATn5hmmY6xllBvB+Qbk20y3ODPfBQ6Qsq4B2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7isMdAfGwiqfjDTwmLXG/pVqWGCof8IdrSoU8JtP9NM=;
 b=G3wUG6NuWrW4zTXsqgJ+1zEn28RTPGIwF8v5eac567TzN9SM2TUBKaWwiEfA7DfgvVC6rEofgkrJWqzJa4PU8qGr17up7hcykoSKz2XyiWSYrl0TioBfMJBMbdwf++CgUPet9rcifXsthwlnaHUGz27Pulb4r8o5+KRqATGXS7DoN16zoTKErG88WRcfNG+q+cET1thZ+QyWKTqsHScMVynJEfYept6U6Nf0REPeh3rTkNYr5AMRRXJWgb9W7V3YoCa8Bak+wZxmU9RuAei2YZW2iRDgRjSL75pipCXwFVzeY94iibw83vydV5PIri+5d23r0yGE45CxTVEwpEa9EQ==
Received: from DU6P191CA0034.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::6) by
 AS2PR10MB6664.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:12:01 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::e2) by DU6P191CA0034.outlook.office365.com
 (2603:10a6:10:53f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:12:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 16:12:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:15:54 +0200
Received: from [10.252.1.215] (10.252.1.215) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:12:00 +0200
Message-ID: <34a3ddd1-aa5c-4544-a202-c1a09eed7331@foss.st.com>
Date: Wed, 20 May 2026 18:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, Patrick DELAUNAY
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
 <20260519163145.221668-3-yann.gautier@foss.st.com>
 <f420eff8-6524-4797-93b7-0f9a1149e860@mailbox.org>
 <1aec25d4-3135-433d-8fcd-4ead7a065d40@foss.st.com>
 <9b59c08a-ea36-44b3-9c30-d1bd555f661e@foss.st.com>
 <0d3b1038-f90e-44e5-9b1e-bf9035f32784@mailbox.org>
Content-Language: en-US, fr
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <0d3b1038-f90e-44e5-9b1e-bf9035f32784@mailbox.org>
X-Originating-IP: [10.252.1.215]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AS2PR10MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: b11d6772-2427-4ccf-87e3-08deb68a8680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|4143699003|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: d0Xxde9wdBbDQoOWYUmN/If3FOQTfU9sPRAwfp6KWC+NjRajJ3AsU7Iu+pbKuH9MUsQhoR0429PeZTY8LCK3M34GVjyfBMGk31b5FcW9P8E+iyVNLcA+sxOlspAASP6cwC2DDd7clV4/DDtEKdw/5x/6YHgZegsPXxWBK/OK3wAx+nRRRUgEqWAHLpzPQbd/OjNjlajwpEqrh0nyZX1wBkb6DkXi8N2zaozLtTKVc8zN7WpODFSd/BEM1hD+BYreuAcm6tJNJdE/DaQjc+eHhYHKYwHxyqavrQRW0E/FMDYfZj4dmbzxMefU1wM7VcJsj/lw00ZpmF32w85+YP5GjBXceZZvnvPijm79dcW7mrL/989shDoxbVUDin+vOqRG3Y/ekKrlUFjrTgoDABi7F7Qb2bDjoFV3x1OEXvDBwaD3KkLbAih4KhAx6XS3vZNud7psZdhWeXRGQQh4JGQntAMM0jJU7Nw4mkh3uM6IccFuQMETXPaxdWPwD4/2d7QI3lmVyAM1Rqfe4/H/IbMH+iiGuX59ED3SoSKNAeVQvYaTp8EVCm++H1QJkQtB99RHzO/GnuRIgPLJ2y0kh87Gm5qH9dumvAXLuccgHHQ8SEULtJNSKATwxzwfciGhVbmmUgTaAM3pR3YuiHb2gRexW5mEYnGlAAZBT2MOrVZLLs2cNt/y23ppYO2R+EePZYMWlSxXiaHYohYumy5aDoXPkV8H6PyaZO46kX8ZJAcGScc=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9fVbIot9/Yac28mUv5DrFpUnIlnMT37XmDHHgM0HfnF42PgdLjvGQF4NSldu2ghuvp6bEbi8UULTE1OJU+/bAVgNN7nUn+/zjDKPkvBoyc71W+MCS4BXywEAmAXYItV5NQCh/ELhyHZcFwfbMkukfP8Zr2uVLt9dH5EaTl7rDmGUvVbQY2lI4hIUjTYMQ17zrfpvy10x9spZh9NArqeSVEuiyiMskWwZqI4jxk88kTgL/8uKVU1fcuYYt8f63jIxMT+rRqQqXBVGpOllJVarf+pD+5DE8tgAQy/Nlsw/1k6K/r/KX+56dfVW/vZGA2uQaBtqlSWfCAhIjM9Wdc07EDXaTTHA1efixBextBH05AY/jKOxA+LeZv37wUADmQFcP6bndFF7iUbf5FcFa7CFW/toPuF81B70hMdxvkxCGI3UGwNp+WFopBOuPKtEZZLW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:12:01.0338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b11d6772-2427-4ccf-87e3-08deb68a8680
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6664
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Tom Rini <trini@konsulko.com>
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
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:patrick.delaunay@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:trini@konsulko.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F7A6591990
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNS8yMC8yNiAxNDoyNSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNS8yMC8yNiAxMTowNCBB
TSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDUvMjAvMjYgMDk6MDUs
IFlhbm4gR2F1dGllciB3cm90ZToKPj4+IE9uIDUvMTkvMjYgMTg6NTgsIE1hcmVrIFZhc3V0IHdy
b3RlOgo+Pj4+IE9uIDUvMTkvMjYgNjozMSBQTSwgWWFubiBHYXV0aWVyIHdyb3RlOgo+Pj4+PiBO
byB3YXRjaGRvZyB3YXMgZW5hYmxlZCBmb3IgU1RNMzJNUDEzIHBsYXRmb3JtLiBBZGQgdGhlIHJl
cXVpcmVkIAo+Pj4+PiBmbGFncyB0bwo+Pj4+PiBzdXBwb3J0IGl0LiBBcyBkb25lIGZvciBTVE0z
Mk1QMTUgKGluIFNDTUkgY29uZmlnKSBhbmQgU1RNMzJNUDJ4LCAKPj4+Pj4gd2UgdXNlCj4+Pj4+
IHRoZSBBcm0gU01DIHdhdGNoZG9nLiBUaGUgcmVxdWlyZWQgbm9kZXMgd2VyZSBhbHJlYWR5IHBy
ZXNlbnQgaW4gTGludXgKPj4+Pj4gaW1wb3J0ZWQgRFQgZmlsZXMgKHN0bTMybXAxMy5kdHNpICYg
c3RtMzJtcDEzNWYtZGsuZHRzKS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5jb20+Cj4+Pj4+Cj4+Pj4+IC0t
LQo+Pj4+Pgo+Pj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4+PiAtIHVwZGF0ZSBjb21taXQgbWVzc2Fn
ZQo+Pj4+Pgo+Pj4+PiDCoCBjb25maWdzL3N0bTMybXAxM19kZWZjb25maWcgfCAzICsrKwo+Pj4+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1n
aXQgYS9jb25maWdzL3N0bTMybXAxM19kZWZjb25maWcgYi9jb25maWdzL3N0bTMybXAxM19kZWZj
b25maWcKPj4+Pj4gaW5kZXggNjIwYTZkYTJlZmUzLi5jYzQxNTg1MDk3YzcgMTAwNjQ0Cj4+Pj4+
IC0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDEzX2RlZmNvbmZpZwo+Pj4+PiArKysgYi9jb25maWdzL3N0
bTMybXAxM19kZWZjb25maWcKPj4+Pj4gQEAgLTExMyw0ICsxMTMsNyBAQCAKPj4+Pj4gQ09ORklH
X1VTQl9HQURHRVRfTUFOVUZBQ1RVUkVSPSJTVE1pY3JvZWxlY3Ryb25pY3MiCj4+Pj4+IMKgIENP
TkZJR19VU0JfR0FER0VUX1ZFTkRPUl9OVU09MHgwNDgzCj4+Pj4+IMKgIENPTkZJR19VU0JfR0FE
R0VUX1BST0RVQ1RfTlVNPTB4NTcyMAo+Pj4+PiDCoCBDT05GSUdfVVNCX0dBREdFVF9EV0MyX09U
Rz15Cj4+Pj4+ICtDT05GSUdfV0RUPXkKPj4+Pj4gK0NPTkZJR19XRFRfU1RNMzJNUD15Cj4+Pj4g
V2h5IGlzIENPTkZJR19XRFRfU1RNMzJNUCBlbmFibGVkIGhlcmUgLCBpcyB0aGlzIHRoZSBBUk0g
U01DIAo+Pj4+IHdhdGNoZG9nIGRyaXZlciA/Cj4+PiBUaGlzIGlzIGFsaWduZWQgd2l0aCBzdG0z
Mm1wMTUgY29uZmlnLCBhbmQgbm8sIHRoaXMgb25lIGlzIHRoZSBTVE0zMiAKPj4+IElXREcgZHJp
dmVyLgo+Pj4gSSdsbCBjaGVjayB0aGF0IHdpdGggUGF0cmljayAod2hvIG9yaWdpbmFsbHkgd3Jv
dGUgdGhlIHBhdGNoKSwgYXMgaXQgCj4+PiBzZWVtcyB0aGF0IHRoaXMgZmxhZyBjb3VsZCBiZSBy
ZW1vdmVkLgo+Pj4KPj4KPj4gSSBhZ3JlZSB3aXRoIE1hcmVrLgo+Pgo+PiBUb2RheSBDT05GSUdf
V0RUX1NUTTMyTVAgaXMgbm90IHJlYWxseSBuZWVkZWQgYXMgb25seSBhcm1fd2R0IGlzIAo+PiBh
Y3RpdmF0ZWQgaW4gU1RNMzJNUDEzIGRldmljZSB0cmVlIGZvciBTVCBib2FyZHMKPiAKPiBNYWtl
IHN1cmUgeW91IGRvdWJsZS1jaGVjayB0aGUgc3RtMzJtcDEzeHggZGhjb3IgdG9vLgo+IAo+IElm
IHRoZSBXRFQgaXMgc3VwcG9zZWQgdG8gYmUgYWN0aXZhdGVkIGhlcmUsIGl0IGhhcyB0byBiZSBk
b2N1bWVudGVkIGluIAo+IGNvbW1pdCBtZXNzYWdlIHRvbyAuCkkndmUgdXBkYXRlZCB0aGUgY29t
bWl0IG1lc3NhZ2UgaW4gdjM6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC91
Ym9vdC9wYXRjaC8yMDI2MDUyMDE2MDcxNS4xNzUwMzItMy15YW5uLmdhdXRpZXJAZm9zcy5zdC5j
b20vCgpGb3Igc3RtMzJtcDEzeHggZGhjb3IsIHRoZSBMaW51eCBEVCBuZWVkIHRvIGJlIHVwZGF0
ZWQsIGFzIHdlbGwgYXMgCnN0bTMybXAxM19kaGNvcl9kZWZjb25maWcuCgoKQmVzdCByZWdhcmRz
LApZYW5uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
