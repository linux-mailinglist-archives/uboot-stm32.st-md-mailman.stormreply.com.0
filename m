Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D6jOm85e2mGCQIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:51 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A272AEF5D
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D74C0C1A97C;
	Thu, 29 Jan 2026 10:32:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CE49C57A51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 10:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfiYZDzQaih3P9+M/LggPqYDVQN1ZJ/H3fy7Dli9/RhlBsS/0+QoU6GLLKsDNgZV4aXMv5T1uxgNsyp/jomz5ufYYnrEbRuhQtRRZFE1Tp87F0Cua5uRKUJwI0mrXtSJB5fEkWMf6eFcStZLwrFh/O9XrWnO1J+xkfcX/DQlBK0oOO8JHIW1f3JIUDG2pInHEqBkVkvuWhvCk2fcztkkYYGlto3X9EaMgH5EljaHJiM6fPcfpQG0HBBzf5zn3LnpyFn0p1RKZwHYVgNn3Kdvlt1LEIw3oRfkc1zp5lZ6hgzVPH1FvQ0/l5kLxfRT6REg4ginhrvKE93DcIpDcjvFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9C30644t2WOxlGvlyPJEaJq2QXycI+vvKs/XlRLtGA=;
 b=WDnCFZDlafDrMZqj4wX0Pi1aOfm+H1L/49ld+IrfDoz1Ndv5wOLxgL0vMazaY64jNaY7k0CRn23oeQd+xxRUhMqXu5MM/oobln4J+8Bo2l0/aB9XOlMqiJJLGwF9BUHl9WqGbXWRyroAbDdAxL2gjv9haRCqNMat+cUWWZGGl8jod09Ak3oVYJ3lyb59B79fjCG6uvdVlBPnZg+RFLx+VBp6U0ZcJyddwX7ofDhMtPjoo8LtNu5G/7dUQVUvnP5TLpPMrWG6sud2rb/aZLsbOFYFSxHFWoUQeeA6UOOat2Kis9zKmWYtjrOqpHuOJPkyr5ZTfi4q1Yq2XCyF1uB1LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9C30644t2WOxlGvlyPJEaJq2QXycI+vvKs/XlRLtGA=;
 b=LczP0Xg+tQSudjIGq8GaJFq4EcP3IMOCC1AyYhoh9YF9eAlXNeDFjX2aDE7H4ZSXJX4Z1Ic8m34e+U+F9dyFee+S13wdSQvt2I7BBZlxuBUue/OeyBXTkWzZiBCVQTjLpZ6ErNTbrTzPRl/ByeB/NjXjsM/cKmUbfFwBGmS0omitHJRtKFX5TZhYy8pVO9+2tUaUZCJNd53npmm/P1QL2r833dDVmPSuoh79+FP59+G/hvi1fwkF0jENQzsjF4T12oP/Q0Kz3ti3gaTNwXrJ0xSegVPgJc7ITVwvSvWKbtJeMd//ubTwR3bNxAalL/Q/9QF75Tc0fLqnc9pUUzK8aQ==
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by PAWPR10MB7817.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:34e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 29 Jan
 2026 10:32:45 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::71) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 10:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:32:44 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:34:27 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:32:43 +0100
Message-ID: <4cf615f4-0f9a-4ec7-800a-56e3804b9acf@foss.st.com>
Date: Thu, 29 Jan 2026 11:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@nabladev.com>, <u-boot@lists.denx.de>
References: <20260108021705.518243-1-marex@nabladev.com>
 <f7038b76-37e6-4dca-bca3-53b39a1d0489@foss.st.com>
Content-Language: en-US
In-Reply-To: <f7038b76-37e6-4dca-bca3-53b39a1d0489@foss.st.com>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|PAWPR10MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d4cf20-8a59-460a-1fed-08de5f21bd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3BtSXJ4T3FoamE2RlhSc04zTHQ2dTVJb284ejQ4eFZEa0xiZ3MxM3NjZ2RI?=
 =?utf-8?B?WGZVQS9JOXRRcTNvVTdGeXdrZ25LUXNrZmJSMzZKU3EzNWlmWXRZMVFFbmU5?=
 =?utf-8?B?Mkc5a2U0YXRYNC9lLzdlMmU2VUJubEtuYjBNWnNGd3h6cmJkb0xLclRLN0Ny?=
 =?utf-8?B?VEhqeFcvd0hqVm9RM0JtYjluN0M1WTZRMXhHNThYWDkzYlAxQTF6TVRRQ0VG?=
 =?utf-8?B?MWxhSWNXYlFMNTZNaXBEelhXSENlejhXOVZxdDRXUmdtak9iL2I3blBPWDU3?=
 =?utf-8?B?d1k5dDdtajdWRzlVNWlOWSs3V3lBcUM3eUdtWDc1eVF4SFdKQjJiYXMxOEpC?=
 =?utf-8?B?UzdVTDJlbnYxdml0UFdmNTRwQ3ZaV2dCQWNpVGY5QnpZZFZDUUd2dGs5WUh4?=
 =?utf-8?B?dFllM1JDa2hXWFVWcklXUnlrK0J3anBLRTFHOTBISHpuQUF0V0hsVTRURzFr?=
 =?utf-8?B?cVV4WVZtd0N0T0JYODlFTWJVcDVsMVFYalBqbitaempqRmt5L1U2N251SUJz?=
 =?utf-8?B?bUF5Z2NIU0xHR2dHWDlXa056R05ZcWNBYmUvRmJoMXJHbGsvMHM5SVhnamNJ?=
 =?utf-8?B?b0wyUVJ0am8vSUZKNFhTZm4xRlNVT2pGSWFtQXdQSzdMY2dDeXdrcFlpUnpR?=
 =?utf-8?B?dElyazcyLzRSdmNtUDdtZzF1K1JvVE81MG4rdUZvMmdjb1V2enJYQnBXQUpX?=
 =?utf-8?B?QkJ3RStrUXRYVU41ZEJMWnBSM3FDeFpMNEdFN0s5V2pESThuczRKZGovNWRQ?=
 =?utf-8?B?a3M3WXdKVzZzeXhIeTE1QytMbUtoaUdTaHNTZW1rVS9XaEc0b1NYK2Y4VnhE?=
 =?utf-8?B?cFFwWWRZUnJBTEJ1Q0xaYzl0TGZqbkw5cGVkYkFVN2YwQ29EZ1lkNVd0dTFo?=
 =?utf-8?B?K2o3enpNSGtDK1B1TjlSeXF3eFNtbDcyYnZvVkZlZldOSjVOeDNDakV5NkNK?=
 =?utf-8?B?bE91RW5YWTdUZy8yVGpsY1NjdHJYNVZFTHpTOHlWa0E5TnZxaGlmMmYvTmZa?=
 =?utf-8?B?OUU4TDJHM3pXcXRiQ1EwcHRhMUh3aGhDZHF5USswSmIvSGJJelFaSC8yeDk1?=
 =?utf-8?B?WExPS2dCQ21HdjUrdjBSQ1RDTFo4Ty9FL1NJd0F4NStSU2pNcjV5MVhRdFA4?=
 =?utf-8?B?MjRKUnM0emlKbGpOZXVRVkliT1ZrM3lTR0FzdzAyMitBVWdGeWpsT2xaYm54?=
 =?utf-8?B?RUU0WmpQUlIreitrYjB4eVNxbW1HaTE0YUFmTGtHMFBnOXFVZXhvdm5OVU16?=
 =?utf-8?B?d0lqbkk5amw4MVB6OW44MHV4MGVScjBUalB3NWJrTWR6eVc3a3dVY29IYmc4?=
 =?utf-8?B?dGpqR0p0d1ByVG54TTAvRnVpTVNiRGR1SklkakVxdTA4eHRwbDNJVGJ2Mk5C?=
 =?utf-8?B?K3V1VGlZNG5NNFBwcFRQM3huUjczdEU2UE1OMmQvWW5iNzVNMDFCTDFqUEx6?=
 =?utf-8?B?UDdnUUoyOExyVDNTWC9XNUtyYklUTWN2bG5jSTFZSWpaK29RK3VUTzFJOHF1?=
 =?utf-8?B?NWtuaWE5Z2RFdzBkQkRZV3BNTDZ5STYvQzZnMFg4UzdYQllHQk55d2RsZ0NJ?=
 =?utf-8?B?c1lUYTFZNkJsNkNQc1YvTXBod2NmM2xZZnVFY0lWaW9VTWwzdFNiRDdlOUlo?=
 =?utf-8?B?WHNuSGF1UEIyZFpLb3dyeWhCRHcrdVZKMnFpdVAxd29WN2IyVDJCOXEyMEdX?=
 =?utf-8?B?YXk0aDVWMFNaVHF4Rm81UlViQzZ4U1dVcjY1U3YvcC9KUk1ZdWM3LzJHbmlD?=
 =?utf-8?B?OGx3KzVJTGVLNFhQOFUwRW9IUGIzUGFpajIzUUtiUlQ4UERIaGtvWVJHZ3ho?=
 =?utf-8?B?b0krTVQrZ20vNU1wZmZKb0tzbXVPTXJJT01zZXl1bHp4bU1qcC9GUXV4czVt?=
 =?utf-8?B?cDZyc05Pb3BSRTRMUEsxM0l1YkdFbUIxYjJ1ejFnZVRibXBmdmFIMVlBbXVi?=
 =?utf-8?B?RDNRUmRpUEdBcW01R0ZwOWtHRURXZk9tUVNtN25ZTTh2VHN3S2JjZDFDOWlw?=
 =?utf-8?B?VTh4QlJnTCtad1FLNjJFb2NmSmViUVRRWEg5dXlIditySVVvYTBKOWhHVE9y?=
 =?utf-8?B?YnZYZlYvdWlpM3I0SHFHZ0N1ZWJpZ0FtT2c2dXRRUmtzNE8rZXlYQnFTTzIw?=
 =?utf-8?B?Ry92SWJJS0hjYVEwZHB0ODRzU1RSeGFteEw3QW93ZmpXTGNYRnpCRGhKZm15?=
 =?utf-8?B?VytwamxaUEZNWUlSODh4eEpVWWZ0VXQwMStzdGJMeXltMGR5ekhkeTlIWUkv?=
 =?utf-8?B?enhuVVhYLzM1RTlvVEs1NzJYYTF3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wGFX+rgNt+X9snMohq+tE/aW/nEL78B2MUFyZxOIUSv85XY1BH4Wpria8Vii9gQDOw4hTyhjBQG3MIQLGPFrgiGICSs8OBvSYpxngZDoejLJQx34VjBPJ4GK9P6jxX96vhrMrwlk/Y8FzD1HWrsOJ6jr1/nPD3V2ilvXkq15MTx3rkSYsMcJRF2RadAQqFMO7tVQQv8QdmlOSKQn5r/+VoAW0CDA+mLJGBaR7l5nOnwfZXbAfF2wN4/iHMrRqXqUEWbERkBhvrhz3Pl30HB/rYkQsV02o0LvFvMKXUrQJExQsvia+ezL8eVKbLSw8XLjPm94uIl9or+bafGffuWz/0M8UpdqShW6UoWYTzIBGOmGFpBFZVfJCkdJOojA8ju9AUMsd8OiCz2myLgwfmFyaNEeGKPZ7DSP3yPHOM6yEwwotAoHA3Q1RFkHelSRh1R0mMKXwcnS9g5uvqkKsUeF+iGexzv50zz6Hve8ngWjt2uxhS85Qy/IA5fHVI20F9XnEcjBev+V2NbWYmXHVS9ptETqriuT1ObXMbNnDZqT2Qwn8R8AH01+3lXFseQjNE3nxtPaBmPj2FOLNH4q47rgTYuB3ZejUgNfrRdk/d2x/XOq2TEBDy8i5UluThrLZon+piGM7qi9n6I0vasJHPNvLX6/wvAkZU1xOHnwTKJ0+8SjLoJ4wF1ED25gvB06JvfLXksNH3M32Il9FhJiC+bfGw==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:32:44.9046 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d4cf20-8a59-460a-1fed-08de5f21bd73
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7817
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Reinstate missing SPL configs
 for DH STM32MP15xx DHSOM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,denx.de:email,nabladev.com:email,dh-electronics.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:antonio.borneo@foss.st.com,m:u-boot@dh-electronics.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A272AEF5D
X-Rspamd-Action: no action



On 1/19/26 09:50, Patrice CHOTARD wrote:
> 
> 
> On 1/8/26 03:16, Marek Vasut wrote:
>> Re-enable missing configs for DH STM32MP15xx DHSOM, to allow those
>> devices to successfully boot again.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  configs/stm32mp15_dhsom.config | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
>> index d5ecbac29e0..24420372e3f 100644
>> --- a/configs/stm32mp15_dhsom.config
>> +++ b/configs/stm32mp15_dhsom.config
>> @@ -38,7 +38,13 @@ CONFIG_WATCHDOG_AUTOSTART=y
>>  CONFIG_SPI_FLASH_MACRONIX=y
>>  CONFIG_SPI_FLASH_SPANSION=y
>>  CONFIG_SPI_FLASH_STMICRO=y
>> -CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
>> -CONFIG_SPL_TEXT_BASE=0x2FFC2500
>>  CONFIG_SPL_BLOCK_CACHE=y
>> +CONFIG_SPL_DM_REGULATOR=y
>> +CONFIG_SPL_DM_REGULATOR_STPMIC1=y
>> +CONFIG_SPL_DM_USB_GADGET=y
>> +CONFIG_SPL_HAVE_INIT_STACK=y
>> +CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
>>  CONFIG_SPL_MMC=y
>> +CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
>> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
>> +CONFIG_SPL_USB_GADGET=y
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
