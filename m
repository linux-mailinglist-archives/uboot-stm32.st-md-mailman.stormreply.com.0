Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA49B677B
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2024 16:21:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27C33C78027;
	Wed, 30 Oct 2024 15:21:00 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78622C78020
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 15:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwRxVmuxRH2FRO1nq+ZO2oKEnroeKbwU7jx4+22pmu4a3bsnzJReFB8zAythxUaM/RVLIvrcJ5+Xg+jkFH+ssLnk2aSWSNYkiVXPtFnRwib5nmOL1wg0ZTPHNZS5pVYDL4h2+DPAh5QAxBUCK3driI9e+rb1aVv6Xrw+meCooNdRKeHhqhuDLORaybd55djYZDY9JXlyM1ifnhkJJxx2fx9Vmo0qNZRd0vr6MOxC0K7nQ+s+ke82g942NU9Gegs1f83yrXPQGmMmUGm39H5rZRErXjCWrTjgMbjD+LmjuALgnrTlTw1E6dtcq03qhGB7Oi9ibGcgd1ctajuorL7Ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d1463sYR0Myuu5B0Q1FwiTOq7Ep9dM9PxeDKW/1NIA=;
 b=gEmghIoBvkBYqkSMcEzEr6sBMYhi2ygsnxee+OHLNWP5jpfswxRX2AvqxH93DyT/+zV3siS2KY/h8pYFtJXNO+9M0yoQ/SPRKYO9rCkcnu9l8NMOSChmsginbPzvSlLkz9lTU1o5M36lbkUqSm0Q37Eo4SFHv3vMTPS0xxlDYEAKHpxBeJDXmluF8l9iJbkwmqPsjd7MU5Q5MHsLV5kR2sfC3b0DOvvJl9rmobD0ZgrVHd4l6MZYLWNF2Gt7vbOIUPv/O8tBcMdJEg+D3iKC8sooQv9G9d5zt++1O2msuHoj0IgpwRTBM1hUZfnrjf2DsK01RpKtGKK7EcviElWDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d1463sYR0Myuu5B0Q1FwiTOq7Ep9dM9PxeDKW/1NIA=;
 b=OS3ce+SeieRx5UoJSzlllZG+ZnBre+azN9QQqGEOkHkrJUYB9YKq4yJjBe1H42N9kvVkvzYutIicUG3U2eaB9n+fgVzZlM/loi/fuaQTQM4GK78WxsDj8FnRbTg7rXfVRdo1PaJKWkDacYKLObEnbBzKJ1wCZuAW/1r5Uf5at9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 15:20:48 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 15:20:48 +0000
Message-ID: <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
Date: Wed, 30 Oct 2024 16:20:32 +0100
User-Agent: Mozilla Thunderbird
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
X-ClientProxiedBy: VI1PR09CA0162.eurprd09.prod.outlook.com
 (2603:10a6:800:120::16) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 886e23c2-57bf-419a-ce86-08dcf8f66eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SCtJSzFzMVFsU2M1VkxBK1pGQlcrcGpZaEt4cUhlcUlhbDhaWU9YZ2ZOQTd4?=
 =?utf-8?B?R0kwZ0cyeHZlbzJuUVAya013NTVwNUlERVZSTDA5R1UzWW4yTEpwK0EvV1Vw?=
 =?utf-8?B?cmpXSnR2dUZqVXRlR0xJZ3J1SGFhdFY1eTZ6TUpKRmJFR0U5NnNrTzZ3MVpj?=
 =?utf-8?B?QzVqOFFEbW9qZHN2bjdNZ3g0N2tRRVFtMUVDSiszeHc3U0R3VmZKTGtNSjZ3?=
 =?utf-8?B?TC9OSTV0emlMM1U5OGRaaWNxbVc2L1piYmY5c2hiVTNEN1BZektzL3d1UHRn?=
 =?utf-8?B?ZzdEQnFHSkt0UnY5UlhYekMxV0ZTd0tCOUxZQnBqVUptWWFDVitWOTJKY1l1?=
 =?utf-8?B?Y1M3Wk0yeTRUcUhNeWRkZHNvd01RQkdYUUs4azNjVlJoZjF3aTFoRlFKQ1dG?=
 =?utf-8?B?ZlB5dkR6M0dRUHMvVjc1TzRBOFdHRzU5L1JTVVBoZ3g4VngzSVU0WThQVjVG?=
 =?utf-8?B?eXUwUDBpMmRnTHpPNlVyNm1aMkVibXJLMnhaOVlzRlo1NW0vMUpoS3FIL1pV?=
 =?utf-8?B?ZlpBazRFeDAwenFIM2JhL1p2eWd2Y0dYdjdzaXd0NEtHKzdJam5rYmpRd2J2?=
 =?utf-8?B?QytlVG4reEFZek5CNUxoQ0VRZmVzTTZycWszTDlRbXBTMlBEVEhUcWlLMjVG?=
 =?utf-8?B?emgrNFhESVZnK3h0RmhNenRYY3d6NFFSZWU1Rm1nSzlWNnh4ZWNQaHBVQkh5?=
 =?utf-8?B?a1BzU2YvUGZXQUFZZzZTVG02Y0dVRXdyWGFUbVhVd0dXaGVHNGp3Qmt5L2dN?=
 =?utf-8?B?c1g3ZFNWZTQrMDNhdFVic09ValVKUHV4cXA4WDVhQXlleWR6Sms5dGhOUGtH?=
 =?utf-8?B?ZTJKSHZzV1U4VVZiYWtQdVJCM3NKVmFiYlBBOGw4cTZ4NHBMeFI3RDN2UmxX?=
 =?utf-8?B?QnljRk85VEhlc3BBWlByN0xZSytSSFA4QlJTQWU0TVV0T1NrcUFjQTJJQ0Zv?=
 =?utf-8?B?UlFqNjIrZTNFeXJRMjU0NWl1dUVnellYZUcxZFBJalZqSmRoUTRBTXV6Y1k2?=
 =?utf-8?B?UjZDMisxbXhJQWlucDczUXJQanlEdmx3QmRDVUtobjVPd3JDS0swWXYwK0FY?=
 =?utf-8?B?eEpXL0hhT0NGcDQ4Rzc5em1lTjRiY1R2cEVYYTJOR205R2pLVWlRc2VCd09Q?=
 =?utf-8?B?NE5BeXZlRldSRzZtbGhOL3RpUmNXSjlQcUcxa0ZUZXhOSVNBb3BpUFBwMHJ1?=
 =?utf-8?B?N29HQVlsd0VFYlN3N0VadHUyRy9zU1RHZGJwNVlKSnBLUHY3MFh0dElmQStF?=
 =?utf-8?B?ekVTYUxkZXdiN0thQVE3UVllbG95b0FJVGthdS9kUnBrMVU5cEloYVAyUTd3?=
 =?utf-8?B?cGRNVnArRG44WlZVR09memJOMkNYN1FvK0tseUxTdkZBTno0MFYyYjRwOHRD?=
 =?utf-8?B?VWY4dVdBVDIzS1JtbW55andIRVlmM3NvUDNpK0NHWkcvWDFNZVRJS2NHUWMr?=
 =?utf-8?B?MVN4WGJReGtBNlJJcWNXQ2M3Ny9BUVF2azZjZU4rWGJpOVNWVzBzK09PMU1m?=
 =?utf-8?B?WDZ2bStvSTBURmovajF0T0RGa0ZFWFQ5V2t5Y0lndUE2SFdLeElvbEEzdjZH?=
 =?utf-8?B?RjhicUpHc3dVdDFUOHZBZ0JyUzdCUUJPRDhPS3Ayd0VONUkzeGd2djh5bmJR?=
 =?utf-8?B?VEMxSElzOXM2UVpOa1dzdlVxcHpCTTNsTjlKdDhUanRNQjBTbUtzZWpkdE9o?=
 =?utf-8?B?Q0Y1WVNzd2l3YW1QWmlxWWR1VjlZR3hNRFpkNTVkempHWFFIVFdteFAzMlVB?=
 =?utf-8?Q?PEST+xDlVTMaOzD6LPSRlSCMuek6Wqy6aiiPihd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEgvU3FKTjI5VkRFMGJPenRCdGRnbEF1NGU3V01hL3hhd3luNEwwTDBCWm1E?=
 =?utf-8?B?M1JtMHBzV2Q1WC8xRFAyak1TeUFUak9CK3BXSFVuZGlsZ0tIZ0NrSmJwVlNj?=
 =?utf-8?B?cG5WSDFnVWsxNWZJbXp0R2FKTThSWUViMHNDT2FMUXhlWHVObkd4VzNhRFlz?=
 =?utf-8?B?Z0llMW5ZRzBxRTc3blQrNFhqM2lmY2l2S2JRTkZXMG91VTZqSkdjN0VIbzA0?=
 =?utf-8?B?Z01qcndocC9tOHJKczNhU1g1am8zVHE0UGtHdTJMM2QrRGtKcGhQLzdINkpu?=
 =?utf-8?B?TkdOUnAyZTcxV29ueTAyUUozK09hY2VDcWhYcXlOL0F4NGpQbFRFMUQ0WDMv?=
 =?utf-8?B?aVJDcFh4RlZaTTFla2RDRHpQSEVnRGdJL1F1WjAzbml4WndiMFB1R2hZR3py?=
 =?utf-8?B?c3VMS1R0VVpJNlQ4cFpXaVpDaU1ZcHpvUHVyUTB5b1pROExrWk93TnVPOEEy?=
 =?utf-8?B?VktCeno3YXRCT0R4dEJja2FNeEQ5M0xBa3NvbEFsM0E4OFRQVGkwYWtscTgw?=
 =?utf-8?B?R25CeWtLc3ZTTFJDU2hDS3BNMWlHNDUxbWE2bzY4YUVZcThDdnNDckpISElX?=
 =?utf-8?B?QVQ3bzQ1NmdFbEcra3R4SmZOV0VVYXg0VVNwZ3ZnVWt1SWYzSlpUSkZDNW5v?=
 =?utf-8?B?OUpBQlI2VnhxYmx2WlVHemh4RDhicEVaeFp0TjY1SFV2N1ZMZHFxZ1NHdHg1?=
 =?utf-8?B?N3VuTG9GSFJvaDhTTVBDbnZFRnYyNHdoOFNYUjloMDRyTzF5M0lnNDYzM2ZY?=
 =?utf-8?B?NUVNcEl4RU5TbDE0S09lV1hYYkNoMzNxdDF5Nm9xbEpiNFpmaURCeGlHSE5n?=
 =?utf-8?B?Zi93UndtN1hpZmxTZ0haV20xZU16dEZsSitXbmJPSGo0cGYybVl4MU1FZ0Ez?=
 =?utf-8?B?RW55RkY4U0szZXVhT3BpZGREbzU4eldQd2czWXVPeWUvRk5IUU9BU1RBTnNN?=
 =?utf-8?B?Q3l3Wi84dUdHV1VScmlYSlpFeHpFdENjVVhrOXgxUXFjeGJSWXNCa204QWZ2?=
 =?utf-8?B?R3JnSk5QcnJyTUwxa2Q2UDlpeWpCNVZ4TnFjc1FiVnVFU3JKb1ptL09KVFZh?=
 =?utf-8?B?blFrekw2dE02d1lMclFSRGhSTHlrUzBtRGxUc1U0aHRCdTJ4V1h4NkN4NG5F?=
 =?utf-8?B?Ymw1Y0FFdzU2NnlCZVBwZXFiNlZlenRRRHNpVjNTNmFBd2QzeHhka1Bpc3FG?=
 =?utf-8?B?Z3pSZ1hGZXNlZjNIUzhnbFlFTDB2ZUkzVGdqT3NXUGRuelg5aHRuZ285NUxB?=
 =?utf-8?B?SmQ1YU5pYUpVTDR6cktYcGUvYW5LVUx6UzJzUjkyV0JPWkNXcURpL0RIOVZC?=
 =?utf-8?B?RlJNVTJhZWd4aWFHZ2RDM3dWOEY2S1NrdFlON3JHdUdsK3V6ZG4xNjdhenA4?=
 =?utf-8?B?dXpxaFpyeTc2Sm5VT2lacDkxSUZsWnlsOER5Rk9HVDdHNW5HTGI1WWhrcklw?=
 =?utf-8?B?WG9uVVJHM2t6UG5TczJiVzQ4TU5OWk5BTmpaSVYzT1dXRFRVYTZQK0dzaTNp?=
 =?utf-8?B?WmZ6eW9HREl5dklOVWdvZEhyQ2VqYXBxMENURnlvajU0WVV2U3dYcGdyQjQw?=
 =?utf-8?B?Ymc5MWRIRS80K1JyYTd1OWEvcjdzZFFHSGFRampCV2syUGoxUFRmSVAvWlVw?=
 =?utf-8?B?eU8yZVRXb3JUNlBTeTlJQ0hmKzE5MENMYjBnTzAyRm1FTi9FMjcvSi83U1NW?=
 =?utf-8?B?ZGU0QXgwSFpYdjdRWkgxZkd0V0phaGxUNFIrWUU1Q3czZDMwYnl3UnR4RURv?=
 =?utf-8?B?Nnk5NExVRHkreHp2cU5iQUVCeERJZmkwdG5UVDJTcmRFRUpaYzllTWczZWNp?=
 =?utf-8?B?SG9RUVB4d2hiMk5ERC9DSEJSVkhzVjJrV3I4WDlkSUtqY0NiSFMwTWp4WHJz?=
 =?utf-8?B?M3FiRDcwb2hLblRNL2hHZEdYbENFRWVhTVdnUzhSRXplaUhDRUZvRzZ2VDBw?=
 =?utf-8?B?MjJpbm9ZYWFaeVUzZ2FWRFVsVnN0aDhnSmdzOTJuOUZsbHNmQm9aL2JsZUF5?=
 =?utf-8?B?TGdEdHNWUDVhMXdubzhUaEw1bU02YndFV2xkdUt6d3NLdDNzQlFpMHV0a3dx?=
 =?utf-8?B?NUo4ZzVjMXlaS20reUg3SnZYL1k1UlhCWFBaQmJYdm5FK2FaTVJ1bjZVSHhS?=
 =?utf-8?Q?1pZceirtjuKerBQHO0Wu+Lngd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886e23c2-57bf-419a-ce86-08dcf8f66eb0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 15:20:48.3675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hr/l4RvFcCxlLrByUs4W6GveP/S2kamHKq/v5Hc7oHpBRpy+Ib2wRC2MaejwGE18
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

CgpPbiAxMC8zMC8yNCAxNTo0OSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiAKPiAKPiBPbiAxMC8z
MC8yNCAyOjE3IFBNLCBKYWdhbiBUZWtpIHdyb3RlOgo+PiBPbiBXZWQsIE9jdCAzMCwgMjAyNCBh
dCA0OjE14oCvUE0gVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90
ZToKPj4+Cj4+Pgo+Pj4KPj4+IE9uIDEwLzMwLzI0IDEwOjMzIEFNLCBKYWdhbiBUZWtpIHdyb3Rl
Ogo+Pj4+IEhpIE1hcmVrLAo+Pj4+Cj4+Pj4gT24gU3VuLCBPY3QgMjcsIDIwMjQgYXQgMTo0OOKA
r0FNIE1hcmVrIFZhc3V0Cj4+Pj4gPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+IHdy
b3RlOgo+Pj4+Pgo+Pj4+PiBSZW1vdmUgdW5kb2N1bWVudGVkIG5vci0+YWRkcl93aWR0aCA9PSAz
IHRlc3QuIFRoaXMgd2FzIGFkZGVkIGluIGNvbW1pdAo+Pj4+PiA1ZDQwYjNkMzg0ZGMgKCJtdGQ6
IHNwaS1ub3I6IEFkZCBwYXJhbGxlbCBhbmQgc3RhY2tlZCBtZW1vcmllcyBzdXBwb3J0IikKPj4+
Pj4gd2l0aG91dCBhbnkgZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBSZW1vdmUg
aXQuCj4+Pj4+Cj4+Pj4+IFRoaXMgYWxzbyBoYXMgYSBiYWQgc2lkZS1lZmZlY3Qgd2hpY2ggYnJl
YWtzIFJFQUQgb3BlcmF0aW9uIG9mIGV2ZXJ5IFNQSSBOT1IKPj4+Pj4gd2hpY2ggZG9lcyBub3Qg
dXNlIGFkZHJfd2lkdGggPT0gMywgZS5nLiBzMjVmczUxMnMgZG9lcyBub3Qgd29yayBhdCBhbGwu
IFRoaXMKPj4+Pj4gaXMgYmVjYXVzZSBpZiBhZGRyX3dpZHRoICE9IDMsIHJlbV9iYW5rX2xlbiBp
cyBhbHdheXMgMCwgYW5kIGlmIHJlbV9iYW5rX2xlbgo+Pj4+PiBpcyAwLCB0aGVuIHJlYWRfbGVu
IGlzIDAgYW5kIGlmIHJlYWRfbGVuIGlzIDAsIHRoZW4gdGhlIHNwaV9ub3JfcmVhZCgpIHJldHVy
bnMKPj4+Pj4gLUVJTy4KPj4+Pj4KPj4+Pj4gQmFzaWMgcmVwcm9kdWNlciBpcyBhcyBmb2xsb3dz
Ogo+Pj4+PiAiCj4+Pj4+ID0+IHNmIHByb2JlIDsgc2YgcmVhZCAweDUwMDAwMDAwIDAgMHgxMDAw
MAo+Pj4+PiBTRjogRGV0ZWN0ZWQgczI1ZnM1MTJzIHdpdGggcGFnZSBzaXplIDI1NiBCeXRlcywg
ZXJhc2Ugc2l6ZSAyNTYgS2lCLCB0b3RhbCA2NCBNaUIKPj4+Pj4gZGV2aWNlIDAgb2Zmc2V0IDB4
MCwgc2l6ZSAweDEwMDAwCj4+Pj4+IFNGOiA2NTUzNiBieXRlcyBAIDB4MCBSZWFkOiBFUlJPUiAt
NQo+Pj4+PiAiCj4+Pj4+Cj4+Pj4+IEZpeGVzOiA1ZDQwYjNkMzg0ZGMgKCJtdGQ6IHNwaS1ub3I6
IEFkZCBwYXJhbGxlbCBhbmQgc3RhY2tlZCBtZW1vcmllcyBzdXBwb3J0IikKPj4+Pj4gU2lnbmVk
LW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+Cj4+
Pj4+IC0tLQo+Pj4+PiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+
Cj4+Pj4+IENjOiBBc2hvayBSZWRkeSBTb21hIDxhc2hvay5yZWRkeS5zb21hQGFtZC5jb20+Cj4+
Pj4+IENjOiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4+Pj4gQ2M6
IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgo+Pj4+PiBDYzogTWljaGFsIFNpbWVr
IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KPj4+Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmlj
ay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+Pj4gQ2M6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2
QHRpLmNvbT4KPj4+Pj4gQ2M6IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnku
ZGU+Cj4+Pj4+IENjOiBTZWFuIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT4KPj4+Pj4gQ2M6
IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+Pj4+PiBDYzogVGFrYWhpcm8gS3V3YW5v
IDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+Pj4+PiBDYzogVG9tIFJpbmkgPHRyaW5p
QGtvbnN1bGtvLmNvbT4KPj4+Pj4gQ2M6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGlu
YXJvLm9yZz4KPj4+Pj4gQ2M6IFZlbmthdGVzaCBZYWRhdiBBYmJhcmFwdSA8dmVua2F0ZXNoLmFi
YmFyYXB1QGFtZC5jb20+Cj4+Pj4+IENjOiB1LWJvb3RAbGlzdHMuZGVueC5kZQo+Pj4+PiBDYzog
dWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4+PiAtLS0KPj4+Pgo+
Pj4+IElzIHRoaXMgcGF0Y2gtc2V0IG5leHQgdmVyc2lvbiBmb3IgJ3ByZXZpb3VzJyByZXZlcnRl
ZCBzZXJpZXM/Cj4+Pj4KPj4+Cj4+PiBteSAyYzogSSB0aGluayBJIGxlYW4gdG93YXJkcyByZXZl
cnRpbmcgdGhlIHN0YWNrZWQvcGFyYWxsZWwgc3VwcG9ydC4KPj4+IFRoZSBvbmx5IG9uZSB0aGF0
IGJlbmVmaXRzIG9mIGlzIEFNRCwgd2hpbGUgYWZmZWN0aW5nIHRoZSBjb3JlIGNvZGUKPj4+IHF1
YWxpdHkuIEl0IGFsc28gc2xvd3MgZG93biBmdXJ0aGVyIGNvbnRyaWJ1dGlvbnMgYW5kIEkgYXNz
dW1lIGl0Cj4+PiBoYXJkZW5zIG1haW50YWluZXIncyBqb2IuCj4+Cj4+IEkgZGlkIHRyeSB0aGlz
IGJlZm9yZSBhbmQgaXQgaXMgaGFyZCB0byBzZXBhcmF0ZSBmcm9tIHRoZSBjb3JlLiBhbmQgYXQK
Pj4gdGhlIHNhbWUgdGltZSBpdCBpcyBoYXJkIHRvIG1haW50YWluIHRoZSBjb3JlIHRvby4KPj4K
Pj4+Cj4+PiBFdmVuIGlmIEkgKHdlPykgaGF2ZW4ndCBtYWRlIG15IG1pbmQgb24gaG93IHRvIGJl
c3QgaW1wbGVtZW50IHRoaXMsIGl0J3MKPj4+IGNsZWFyIHRoYXQgaXQgc2hhbGwgYmUgYWJvdmUg
U1BJIE5PUiB3aXRob3V0IGFmZmVjdGluZyBjdXJyZW50IGRldmljZXMuCj4+Pgo+Pj4gTm90IHN1
cmUgaWYgaXQncyBmaW5lIHRvIHJldmVydCBldmVyeXRoaW5nLCBoYXZlbid0IGZvbGxvd2VkIHUt
Ym9vdAo+Pj4gbGF0ZWx5LCB5b3VyIGNob2ljZSB0byBtYWtlLgo+Pgo+PiBJZiB3ZSBmaW5kIGEg
d2F5IChub3Qgc3VyZSBpZiBpdCdzIHBvc3NpYmxlKSBzZXBhcmF0ZSBsaWtlIGEgd3JhcHBlcgo+
PiBvciBmaXggdGhlIHRoaW5ncyB3aXRob3V0IHJldmVydCAtIHRoZXNlIGFyZSB0d28gcG9pbnRz
IEkgY2FuIHNlZSBhcwo+PiBvZiBub3cuCj4+Cj4gCj4gVGhlbiB0aGlzIHNldCBzaGFsbCBoZWxw
IG1vdmUgaW4gdGhpcyBkaXJlY3Rpb24uIFNvbWUgaW52b2x2ZW1lbnQgZnJvbQo+IHRoZSBzdGFj
a2VkL3BhcmFsbGVsIGF1dGhvcnMgd291bGQgYmUgbmljZSBoZXJlLCBhbmQgc29tZSBjb21taXRt
ZW50Cj4gdGhhdCB0aGUgY3VycmVudCBzdGF0dXMgaW4ganVzdCBhIHRlbXBvcmFyeSBzaXR1YXRp
b24uCgpJIGhvcGUgdGhhdCBieSBhdXRob3JzIHlvdSBtZWFuIFNXIG93bmVycyBub3QgcmVhbGx5
IEhXIGF1dGhvcnMgb2YgdGhpcyB3aXJpbmcuCkphZ2FuIGlzIGF3YXJlIHRoYXQgd2UgYXJlIHVz
aW5nIHRoaXMgY29uZmlndXJhdGlvbiBmb3IgcXVpdGUgYSBsb25nIHRpbWUgYW5kIHdlIAphcmUg
c3RpbGwgaGVyZSBhbmQgbm90IGxlYXZpbmcuCkFzIHlvdSBrbm93IEFtaXQgaXMgdHJ5aW5nIHRv
IGZpbmQgYSBzb2x1dGlvbiBpbiBMaW51eCBidXQgbm90aGluZyBoYXMgYmVlbiAKYWdyZWVkIHll
dC4gSWYgdGhlcmUgaXMgYWdyZWVtZW50IHRvIHNlcGFyYXRlIGl0IHRvIG93biBkcml2ZXIgb3Ig
c28gd2Ugd2lsbCBiZSAKZGVmaW5pdGVseSB3b3JraW5nIHdpdGggdS1ib290IHRvIGdldCBpdCB0
byB0aGUgc2FtZSBzdGF0ZS4KClRoaXMgcGF0Y2hzZXQgaXMgdXNpbmcgdGhlIGxhdGVzdCBhcHBy
b3ZlZCBEVCBiaW5kaW5nIGNyZWF0ZWQgYnkgTWlxdWVsIGFuZCBpZiAKbmV3IGJpbmRpbmcgaXMg
YWNjZXB0ZWQgd2Ugd2lsbCBiZSB3b3JraW5nIHRvIGFsaWduIHRvIGl0LgpBbHNvIGludGVudGlv
biBpcyB0byBicmluZyB0aGlzIGZ1bmN0aW9uYWxpdHkgdG8gY3VzdG9tZXJzIGFuZCBub3QgYnJl
YWsgb3RoZXJzLiAKVGhhdCdzIHdoeSB0aGVzZSBwYXRjaGVzIGFyZSBwdWxsZWQgaW50byByYzEg
dG8gZ2V0IGJldHRlciB0ZXN0IGNvdmVyYWdlLgoKQW5kIHRvIGJlIGZhaXIgdG8gc2F5IHZlcnNp
b24gd2hpY2ggaGFzIGJlZW4gbWVyZ2VkIHdhcyB2MTQgYW5kIGFueWJvZHkgY291bGQgCmNvbW1l
bnQgaXQgYmVmb3JlIGFuZCB3ZSBhcmUgZGVmaW5pdGVseSBoZXJlIHRvIGhlbHAgdG8gcmVzb2x2
ZSBpc3N1ZXMgb24gb3RoZXIgCmJvYXJkcyBjYXVzZWQgYnkgdGhpcyBwYXRjaHNldC4gQnV0IHdl
IG5lZWQgdG8gaGF2ZSBoZWxwIGZyb20gb3RoZXJzIGJlY2F1c2UgCm9idmlvdXNseSB3ZSBkb24n
dCBoYXZlIG90aGVyIGJvYXJkcyBhbmQgdGhleSBhcmUgbGlrZWx5IGFsc28gbm90IHdpcmVkIGlu
IENJLgoKVGhhbmtzLApNaWNoYWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
