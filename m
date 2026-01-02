Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 590ABCEE71A
	for <lists+uboot-stm32@lfdr.de>; Fri, 02 Jan 2026 13:00:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E01C3C8F27D;
	Fri,  2 Jan 2026 12:00:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D411C8F27C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jan 2026 12:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ue9HKM0EJMH8C2W35ksqaeBa4IvU0bruvg5S8r8uMvKdJ1GNk6J2PQBFWPkIlmIgPCG1BryosbMarTc01aENM6M6IhHVtphoGOtoMakBcwjpxQCgMl3czpVqGOx9AzuJUanarG7lb0GMwmEeUBlVW67wiPrFpKcv2M+spG7rf63QVAafamxP8oxXoDlp8Xg89xUQLV6TAqmMVFSDdQgVO/zOiN9HsZYwsZKxUFUXa0c8+5larfnkzx9EIuu7LJdd7Uxki1YKjRgHIfhPMcyZBv2tEiXQFSQ0shCDDqoO7pWjqZDoLAWaJjMpEoprFcSILCK1P3AAoapPQOk64xLN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7MuQr3WvXGLn37H02aMKFS7qcwmeq4Tdeesi7k0Sgs=;
 b=x/s4pGyNbrW7F2geA5W6a3W4bGSOKKwZjE15LTxYLM3Bwlf+A/oXciiwTtKEwxdzcl6BBC1PDvTFFyjDBOuOvUmw39KF6t5uOZ9n/+F92OfX8fFER9QDl7LwyYdTd17V35ltnE9QOLtmGZ0aXF9YbaAgNXeOTGxGtUTv7i0C47qNWCaLoq/VHrqWGr9ftorZ0vG9couprL1YcMqXNmqoBW6NihBZN8NfRgb/76s+ey2JOwe5tpdWdJt2OwlIWmUlVDjIihvPi2NX1Ydves4vSoMt2rUZfmM5hSt+asYzMXcFQ8XD+05/ztCv3frlCwF9SvI9OxPDKwCnmWyclvLxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7MuQr3WvXGLn37H02aMKFS7qcwmeq4Tdeesi7k0Sgs=;
 b=nMJJ8IGL5Pfq8/Byhsx4mh4qJwYo+kZEZQ4+NjRugYTc/TlcCpL057yZyWP2q0U3XLbC62ESUEAmqJsGEW9FQEwqHRQZ4hKUrAtwgtuCr7w/V5enHrLXRVM/OL2R0xtpnMGasdT7BL50XVALfj3vdLgpmKn+4s9CzmY25CoLD3pM1FElluCBx0CEaIFBVy7+7PuN6+rtNczhMOogeCGZwlctq04L+OlEnahalIziOrr8mqpPUmywjU0Au0mg83x+08nMF/cJVb//OZBY26aXHXFkLE0lYilFg3litQ9zem7jXAKOuNe0RRGpprw6E8o/3RfqFwOz8CVvRzSajMC2ww==
Received: from AS4P191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::6)
 by AM7PR10MB3924.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 12:00:38 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:657:cafe::39) by AS4P191CA0046.outlook.office365.com
 (2603:10a6:20b:657::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Fri, 2
 Jan 2026 12:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Fri, 2 Jan 2026 12:00:38 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 2 Jan
 2026 13:01:49 +0100
Received: from [10.252.11.251] (10.252.11.251) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 2 Jan
 2026 13:00:37 +0100
Message-ID: <020df345-65df-4d5b-945c-36db65428587@foss.st.com>
Date: Fri, 2 Jan 2026 13:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, Peng Fan
 <peng.fan@nxp.com>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-3-d055da246e55@foss.st.com>
 <869f8843-8d43-4c1f-b6ae-0116fcf64ac4@foss.st.com>
 <f6140b6b-2dba-4bfe-bdf8-11a9793916ee@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <f6140b6b-2dba-4bfe-bdf8-11a9793916ee@mailbox.org>
X-Originating-IP: [10.252.11.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|AM7PR10MB3924:EE_
X-MS-Office365-Filtering-Correlation-Id: 44743e72-1508-437f-8bf8-08de49f68b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0ZyL2J6TGRtcmRNK2pteDBWci9JS3FCYUQvN29NNytPcE95MTh6dUswdzZj?=
 =?utf-8?B?ZnQ2enMvOVhpM0dDSEE0UGVVSGtSZmFrVThsR3k4dE94bEdyT2hiTU83aENt?=
 =?utf-8?B?VW1YRlhNeHc3dW5iTGxPOWozcjVWeXJXb2ZYMHBiQmowZEE4d0p5WUVBd05O?=
 =?utf-8?B?Zmlldit5WE1ST0wzV0U2MVBRZHZqM2RkRE9YeWZSbVJLdkFramo1ZHlkUEZa?=
 =?utf-8?B?Z3BBR3BRZWlQOVY3OFNwSG50eDU0ZU9nNGdFVFVZSFg0Y0JjbTIrVGlXNTJa?=
 =?utf-8?B?SGRwRFdSL255N3dPV1FnbythTU1VUXVHMEtiRkI0aXNuQ2hGSGRsL2xjWUJ4?=
 =?utf-8?B?eW5wUHRhR3MzTEZOc1Q2VkdZSzhoeXgvTy9Xc1dycjZFYStDenVla2FsSjN4?=
 =?utf-8?B?RDhUeFhrbEw5MzQzUUI1MUpMTklFRWV2dXY5S1NLdGhUTkY3MGNNUU9URUxU?=
 =?utf-8?B?b3BsWGlEdWZGa1VRWUkvUHRaRXhLM05rSTJ3V3IzUWJRY01zOHIzMFoxM3dV?=
 =?utf-8?B?M1k4SXZsaEk1aSs0WXQ2SkVxVnREdkMxeGR3eG4zTTRHMGEwVFlraXdIai8y?=
 =?utf-8?B?d09BNkJZdmJXVlFxek9RUUtKajVSNEpLamVDT0ZZWnJMV0FjZDlhZ2NxNk03?=
 =?utf-8?B?dXgzdzZTdUIzdjBPUVdWOTJpZHVIRjg1QWU5RFB4bVZHRlJOUGg0QkdXNnE4?=
 =?utf-8?B?ZVduQkk4RlczOWNsYTNIUGZCdWIxNGE2dHFWTHo4REJVdGswVkEwOXVDZjZy?=
 =?utf-8?B?RWNCcnozVlk0YTIrejlva1ZFQmIwQk5NSGEwaTEzbWRPaVczYXdTUFpHRnly?=
 =?utf-8?B?anE0VElEaCthZEhjN1pxNEdCc09xREYyTTRITlNRT2hEcHUwQ0hzRUplTjM2?=
 =?utf-8?B?eFV5aHZVZDgyL1BUWm5PTmJtTG9CRG5HZkRWci9HSHVRRFRDTWFnV3VObGsr?=
 =?utf-8?B?eUhtZGt6ZjlkTTJlUlUvdWpDeFd3UlJDbjJPdnJzV0lLYmVHWk85L2xSMjRQ?=
 =?utf-8?B?TGowa3h2Z0lQbndaeDN5ZjNDUlhpTWUzZTdUaFJDUzNwcmQ5a1FNVkFiY0dW?=
 =?utf-8?B?VElhUjRrU2FLRWtrRDBkenJLVThpZU9qVThpaE40ZHB2T0swdlBBSS91WEd0?=
 =?utf-8?B?eC91WVR6Y3pBY1I1UXptSWxaS044L2ZnSEtTR2VnMWcvaDUwbGxPTVVBN2lP?=
 =?utf-8?B?QUxTYVcyZnJyeEFIc1ZEbXNZajVROEJnUFJ3UEYyenlMQU8yNFo0K08vL1pZ?=
 =?utf-8?B?QlZjRElndERsMVpTRWlMaHNFODhSdjJTRzNxTVU2aVRtejFVK3B0d3RENzZo?=
 =?utf-8?B?dm03ZTJjM1BieFN0MXFCMllRWUpmNDNwZHRtak96QU9sM0lFb3BJRE5nOXdV?=
 =?utf-8?B?MFYwVXp1M3hBazVqcUFkbnNhOWdybkxsRlJwcUxrckVYaUdyZmNLTDc4a1lx?=
 =?utf-8?B?M01JS2pHY3YvWGNnK1kyR1hvZStqcHovZjEwRzcyQWorbWF5cmVBSlFBTTRn?=
 =?utf-8?B?YkhMNjRjYWpmRFM2UjZUMStpaHhRYVRObVlWMFZ3Vk53VFN0U24rNlBqQ1pR?=
 =?utf-8?B?ck1udkNwZUxJd205cExhR3VYV3ZaNHZYM3k1Y0FucEY4bmtnQlUvcytsdkI1?=
 =?utf-8?B?OU1KZXJ5bTRJOGhKTDZwdGMreS9na3ppL1NselFFMm5xNWM5WHlQaE5MNGlm?=
 =?utf-8?B?d2xEeTRQbHU5emJXZ1ZZbmVpTklUMGxjSTdTeGZGdElRZGNTNkxpRkFvMC9O?=
 =?utf-8?B?Q2FRKzh6aWZla3NWTVNRLysrTDdma0cyTHZ2NURvOVBiUnNKTHROQUd3aW0r?=
 =?utf-8?B?aG9OSGtJR2NORVUwSmRNYi9scmF1K2hHaEg0YnBreWZWckZTZ3NjMEl4bW0x?=
 =?utf-8?B?ejZNUm9KWGN1L0FqcXhwV3U1V0xLZjBhb1VhZUp4bDFaeWk5cnBnR0VnWVdH?=
 =?utf-8?B?cTZmWTgxUmdua0IzUmdYTmxiSHNiM1BEN0NYTkJWSS9Qemcwcm1zSXlYc1JD?=
 =?utf-8?B?OElkbjRNcVRtMVJHNFI0dE51VWhjTEIzanplakorREdlQi9YcWltUE5aVXJB?=
 =?utf-8?B?NTY0L0wyT3Y2aHlMT2Q1UVJMVGFqVjRqelk1ODdZZnFlbE1tbkhxZU5PU0FR?=
 =?utf-8?Q?ZFL8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GSTINy/4Ut6tt/iu302lL2IsW/DCgD3haNxaDfpA6/IrKXSS04bV3PbxDuuBs/JUye7uWH9sdUbKIxgIWfy8UsqBIeoWQ4d0aipSv+dTwNA17lxtMHCJk3y62zyeWp8BxFOUped4rvkLfbPYPrnSCXgsKXs6guRciZsi9F6BclURKAhXhH9wyl7JWiQf/wha/mrcuEmc5SOvaYPY1E79XERB5pKjeAOIzdXWrfipdi7zDc0/qFtSyKVrf3smPaWo+w5hYcgkv0KN7datxfLr/h0+wZGNWtZoL7bjVM/1CXUzMRmPxBwyPoR6lp0710pBQmfC+5hgCqr1Gokl3uggP8n3mIaaV+XUkhzVrqU/xUYx+pVuMyWO/FjDpzl1j7NYgD8KNTsOgcYPjTGbZxW399chJ9N0jlhEX6QIpfouNiM2Hd0eI4rjAbUYucYA5wNoChEJThYZByPEN4wMX3Sl7AJjgpkSH+2lDfvQTbK5BQjQt988kJOrWFZ21flwihtRbCbUiRTMLR8lejAMb67+2Rx8xHqO8oeRY+6HSweWd/oEhi7sPo7HC7lQrVmONEC0NGZIuEe4w5KLoI8rnQLJLaIY+gCS+KYpVZIjGKhXVA4P+syFlsoS1kGKDQ8zzWSR6CRv19QCfw8Vq2rHAMrZXrTPTONASAIaXoySgejtBcf/LAFDNEvV5i6iRxn+Yp1j
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 12:00:38.5171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44743e72-1508-437f-8bf8-08de49f68b97
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3924
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] clk: stm32: Update clock
 management for STM32MP13/25
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

CgpPbiAxMi8zMS8yNSAxNjo1MywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTIvMTYvMjUgNDoz
NSBQTSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IEhlbGxvIFBhdHJpY2UsCj4gCj4gc29y
cnkgZm9yIHRoZSBsYXRlIHJlcGx5Lgo+IAo+Pj4gwqDCoMKgwqDCoCAvKiBXV0RHICovCj4+PiAt
wqDCoMKgIFNUTTMyX0dBVEUoQ0tfQlVTX1dXREcxLCAiY2tfaWNuX3Bfd3dkZzEiLCAiY2tfaWNu
X2FwYjMiLCAwLCBHQVRFX1dXREcxLAo+Pj4gK8KgwqDCoCBTVE0zMl9HQVRFKENLX0JVU19XV0RH
MSwgImNrX2ljbl9wX3d3ZGcxIiwgSURYX0lDTl9BUEIzLCAwLCBHQVRFX1dXREcxLAo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ19SSUZTQygxMDMpKSwKPj4+IC3CoMKgwqAgU1RNMzJf
R0FURShDS19CVVNfV1dERzIsICJja19pY25fcF93d2RnMiIsICJja19pY25fbHNfbWN1IiwgMCwg
R0FURV9XV0RHMiwKPj4+ICvCoMKgwqAgU1RNMzJfR0FURShDS19CVVNfV1dERzIsICJja19pY25f
cF93d2RnMiIsIElEWF9JQ05fTFNfTUNVLCAwLCBHQVRFX1dXREcyLAo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNFQ19SSUZTQygxMDQpKSwKPj4+IMKgIH07Cj4+PiDCoAo+PiBIaSBNYXJl
awo+Pgo+PiBDYW4geW91IGdpdmUgdGhpcyBwYXRjaHNldCBhIHRyeSBvbiBESENPUiBib2FyZCBp
biBTUEwgPwo+IEkgaGF2ZSBiYWQgbmV3cywgdGhlIFNQTCBkb2VzIG5vdCBldmVuIHN0YXJ0IHdp
dGggdGhpcywgbm8gb3V0cHV0IG9uIFVBUlQgZXZlbi4gVGhlIHByb2JsZW0gc2VlbXMgdG8gYmUg
aW4gMy8zICwgaWYgSSBhcHBseSBvbmx5IDEvMyBhbmQgMi8zIHRoZSBib2FyZCBkb2VzIGJvb3Qg
anVzdCBmaW5lLgoKSGkgTWFyZWsKClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywgaSB3aWxsIHRy
eSB0byBoYXZlIGEgbG9vayBhdCB0aGlzIHRvZGF5LgoKUGF0cmljZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
