Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F76D9B759A
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2024 08:46:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DB63C78033;
	Thu, 31 Oct 2024 07:46:57 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CDD7C78030
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 07:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlp8O9+a1zwosDUUfQEKUUFgjaiDbG0Z5hBQippfdDCi+j7wzXTyHD9U1V28XfsQ0MOv51irCP7zC+0zLVU1OA3gU9SayhbtwsDbmVp7C584Kb3ynBEuCGEJRPMAJkvsuC+Zwq21fZAxEzzsvzgcAeZwd2kCETY1NeVN7AzoZEj7hoOIc/4y3a28CMHy399DwHwgwf0/stj6kmznZrOwB1NdQqrAUj+xVFpfdePGi0SdgaegWQWhhmv/eElFfyyYyy1iP2Rr9nNMXxFoQ+vM8K0Yqah1C9scKU1j9Ksaj9+v4v2QvvMGGOBKNep/iHpGJ/BCWFaYQcNv91R68Yg7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ceoOqgy2UnKtm9rPGBY+8RP65Hv5i1bvc5vwRHAA54=;
 b=epb1MVqLP3uBAFz5xBFFtkiEwdvkXylmkDminQCpVsJWjYntQbjcMfizOw2xxGODATTapDUTwQeSsf/WH05XkOtdDx4o5swODaniTkfZLyhUiD7hSFb0g+hCQG4otcem7HY9W02C/nBAd9twWJ9XuFU+q7q9iU+mrpAiLLykbgZHpJfASuPrwq+dPelnUaDOxarx4JWxX/n01Q3gOrir/OuIesggftShQGMdb2DOb1KO4Y3pATXOe8HPG8B81w5ZyyYWqxIAy6O5vwNMhKyiJHHWrMKIqJayuBrMwGiilc3yxIj5lr5I0zsdhAWiNJ92pMKzSQV6yNLW4HMvuGIPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ceoOqgy2UnKtm9rPGBY+8RP65Hv5i1bvc5vwRHAA54=;
 b=ut1mkZE65OYRyzHrVSPzkNV9t8WAPtBHIpLygUvt9pTZe1h52IGgZv3vNFAWLVvXiw3G77oGGfPpNfl0+TeJVCOMVjDkK9OTSSOovLTBar0r8fJu0LrI5WQ3OU2cyAcNjXWZH/GCPIcxKYamx6N4hMNwl9+g1La57JDYguOnszw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 07:46:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 07:46:46 +0000
Message-ID: <8413c7ad-9313-46a9-9174-394435ff6fc1@amd.com>
Date: Thu, 31 Oct 2024 08:46:29 +0100
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
 <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
 <20241030165618.GP2558755@bill-the-cat>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20241030165618.GP2558755@bill-the-cat>
X-ClientProxiedBy: VI1PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::25) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DS7PR12MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a68a46-36d4-4b3c-cf7a-08dcf9802b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzkyOFVzWkp4cmNyMTJyOWVsakFmVDNvekF5a1MvNHliSSt5RWNKb3JaT0U4?=
 =?utf-8?B?MEswV3Z0OE84UzhHL2lqRTVFb3BYRGwzdlZkbWVKVFRJZXZqa3BDM3kxRk01?=
 =?utf-8?B?V0xzU1VBVEk0T0xRMWFFMWJsVHRYU2JINUM2U1pzbUN4amh2V0Q1NkNYSE9H?=
 =?utf-8?B?ZFhyZmcxV2p4QTQyaklrNFRSRHA4YktnMjcyVC8zc2lWelg0MXE4Snp0N0Za?=
 =?utf-8?B?REs1MGxObjZ3c3lUMnJ4SVlmdUExOHdDVEcvbWpjZm9ZZ0ZmdjI5Sk5lM3BQ?=
 =?utf-8?B?TW5Ea1RwZGU0em9TZzJyZDdiL2tpSldSR2Q2T2lFc1lBbldGVGFkaVM0RVJi?=
 =?utf-8?B?SDhYTnllL3F4Q2txQlNyUzBna0FtWDhweE5PVy8zbnVhV0hnOE1qYkptMW5P?=
 =?utf-8?B?Wmtwa2hDTEZQMm52MnpoWmNzWkNTV0RCcWdUMlY4Z3ROUzlOemRBdFI3Ukt4?=
 =?utf-8?B?OUlJekJMdi9PelZpODhaS2E1eXpBd2hkcnNMRFBrRGVHRTNuZjd0bC85QytU?=
 =?utf-8?B?bDJnWGNuR2plWXJtUmxRbW1vUHV1WElFUHFGSnFSK25LS2Foa0xVam9yZVFC?=
 =?utf-8?B?S0lPT2p4YnNObG5tVGV0QnpKencza2l4RkJoWG5yYWRLVHVwK0RGalhMODVz?=
 =?utf-8?B?VmhXWndnR0ExRGtsWG5NNHViWU42MmlIZCtkU1FrS1lsQ0hxUUZvYlJ1VW1Q?=
 =?utf-8?B?ZmxMODQyVFg0WGFCZHIvMkNyMTZQWWs0V0xXWlB1R3JOTlBlRU5Sb2p0ZzNC?=
 =?utf-8?B?d0Q4dlByVE4xbFdJdHc1NElQQVREd3dPRnlzNHhVQkdkQ0N5Sm9Za2drTVRV?=
 =?utf-8?B?RmRZQkNGVXM3OEQzV3JWcUNKL1piQ2h6M0ZIQ21KM2gzZDl1SVczVjlnTDBj?=
 =?utf-8?B?eVVDdUFqcFkrbW5CMXhSVHhrV0hkbkF1d0dCdjJVZUF3bjFxaS82OTV5dTVj?=
 =?utf-8?B?Y0NBODdUMjNzamNVcENkN2N4QkV3VWlnMFIxaFBlc0FFR2QxUGd6RXdPVkpv?=
 =?utf-8?B?VUhqYVlqdjMyQUtKVkJBZHhwNm03TzFTSCtSekE1MGlFRlNrV1B3UnhVRXNF?=
 =?utf-8?B?Q29pK005RTdEM3hVTVdZSC81dnB0cW5HeGt3SFRCOG5Pczhkam9jeGxTM1B6?=
 =?utf-8?B?ek9IRXp6clVDVmNabW51MG4zazVCaStkNlRrWnNLckc3K2QrRDdNTkovS25F?=
 =?utf-8?B?RkVpTDNqd2poWVJ0enYzWkIrS3BVbEcyZ0xLZVZwY1N5bmpjZzZRVmdQS3d1?=
 =?utf-8?B?cGZGVVRqNkdyeHVwWGsrNFoydVJvZzhHcFZleVJXWkhIK1ovWGVqcFlzZHM2?=
 =?utf-8?B?N1pGL3N1RFRXNmNGMHVLUWJUbFR6V2g5eVhWZy9Za09yNDBQeWxYTjBaVGFW?=
 =?utf-8?B?ckpud3EvSUVnMlZMRXd5QmZPdC9aK1V5UVNyT0Nvam1mNVpvam9ueGVYMkFl?=
 =?utf-8?B?UWNOaVBuQkRPekU4NElkdkxPYkNtQ3J0NFJhdkNrenhNL2xtWHVkK1BzTmZm?=
 =?utf-8?B?TWhYdjdPKzB0Z01MclJrbnZWV2tBd3htbm91MjlocVNmeXVpODB6a1ppR3lF?=
 =?utf-8?B?UkpXbDAwdXRic2lrdWtqalhDRUkvUU5XOXBYUmRNbWd1eTd5bUtuVk5BaXpp?=
 =?utf-8?B?d3d1QmZ3UG5wWFZXQys3SnNiazJaTmx3R2dpSVhRaGpGYWRFMUpQdGtIbjNB?=
 =?utf-8?B?UlRYa2JYU0xTNVVVWXNXVjhuMmEvMi9taDVUV0FwVm8xY3h5Zm1lV3NlUng1?=
 =?utf-8?Q?2bHWxLcn0VbtqNI4r9XwaJh8ApwMWMilRx3pc0I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG1UT0JxNGlNWndUcllNWWFjbTJCb29maGNHcUUwWTJ4aFJCVEd5SkNOY1h5?=
 =?utf-8?B?blgwNFo1M0doSEp0S0MrWmNEdXo1dUxsbGRpSTBPZmVPNUI1OFV0VEdZUmcx?=
 =?utf-8?B?b2ZZaGRqYkw1R0xtNDBtd21qMTVLdWNMRGwxTDB5VDgxSXlJZE4vS0FQbVQv?=
 =?utf-8?B?eXNSZHNaOHNaS0NFd251aHphcGxmVmhBakM5WWFUQjc1VC9ScVhnV3ZITDdR?=
 =?utf-8?B?MStLQjhOVkszdWJ1blVnUkVraFR2ck4wUVpBNW9nNkFrVXVybzV6VTBuNnBQ?=
 =?utf-8?B?UFlEZ3JXQmhaUWhFZEhQdmRqTDE1djk4T0NGNlc3bTFJNDV5MTl6VUxXRjdH?=
 =?utf-8?B?dnFQODFPcEE3UkpaM2pPclg2MnY2c3pBZE1YWjBhU0YreEJObTc4a2JwM3Rs?=
 =?utf-8?B?N0RaNHNsUm9sRFFJaXo3ZjlPWC9GUVhrQ0ZlZzlrVjA3RDU1UUlKT1NFUHlF?=
 =?utf-8?B?Wm0yaThtSW13SnJ1cENFQUF6c1Q0RHRnYmtic3BJNS9zTldOeWNhZFAveU1s?=
 =?utf-8?B?N0JSSFFHdjF6cnpxZjFWaTY1bWN4VzQwTFQ3cmNORjRCdW4yY1Zkdkgra0Rt?=
 =?utf-8?B?TnpJc0pjOVRWRVZpUlArT29rRUVpWG1XR0ZqcEVOUkhTNG8vMS9Lc0JXYmM1?=
 =?utf-8?B?dFlZRmt2YjRzYzhUTVUzYWxZRHhRZElqWWpLNVdxazNMM0NJanVCdVp3TFZB?=
 =?utf-8?B?bDZTamZTUmdoNVRkSldXeStuNWtnRm1POE9iMkNGR2RXQUhVMU1DRmhBUmtv?=
 =?utf-8?B?VHBHQlluZGUxZWhvUlVtSzN3SldISmZoNXNyR0xmTklqcEdiL2JITWV6UVl1?=
 =?utf-8?B?NVJ4eG9rNEtDMXU0TnUzQkRqa0lZQStqTDVNTmVVS1Vzemowb09KWWY0YmhL?=
 =?utf-8?B?SndnbS9kT3BNOXRWU1BHREIwUm0wVnlQOVQ4NU1GcGtoeVJick00WHQ1UW1M?=
 =?utf-8?B?TDllSFhzTlhKM2dzSm8wV0wrMXpVMUYxZ2pWejNHTkRTZ2J3enVTc0hLYlYx?=
 =?utf-8?B?enV3RkxaV1NlTEtOQmhBbW9MaFhiajFCc0Y3Skp3dDgreXBlaGxFTHAzemcr?=
 =?utf-8?B?VVd6TDluTWFQeEdIaU51R3l0Z3FqeFJjV3ZtYTJqK0lDMndPUElvMUUzRFR3?=
 =?utf-8?B?MjhKaHdCWXBTRE1nQk5JOFYvem5jNmhtcnowYUg5N1Y3QUl1STdBZkRhOFh1?=
 =?utf-8?B?ejFTUXFQZy9rbVgxQlJFUk1lbFlFTFBVUEY3YkIzYk05SGpya0xneGJkNzZV?=
 =?utf-8?B?TXA0aG5qRk1HcWh6YWN4ZFlNZll3UjVZb2lLS21Ua0ZJaUVTN3ZHQU5iVE0v?=
 =?utf-8?B?NXBJRGgxUU84MzF3M3FKaUFoamc4VUZ3WnJTOUNUZUQ2Tk5sS0lVVXZWeUFu?=
 =?utf-8?B?ejJFM1RCRXJYb2Zwb09NVGt6WmVVZHdZM1VrNlo1SWtSckE0TjIxWU52d0tP?=
 =?utf-8?B?VjJoSy9NdTJwblhmbGdsYzY2YjhXYUlETmxVYXlYYlp6UlF2NXZKVEZwVW8z?=
 =?utf-8?B?MCtWWURzdllIM3FJd01ONjVsY0lWTHErTGlzS09CNm1pU2g1WWVOeWUxMC9X?=
 =?utf-8?B?Qk9WQ1B1VEdqRGZac1p6VkhQOWxvTXZwRjU4OTZJUHVsMlRzdStOYlFxZzEx?=
 =?utf-8?B?UWZIV0R0dkdINm1CbzBLTFJZZXY2NjJWNUdONDJpN0ZQTW1lczFRYlh4V2Zn?=
 =?utf-8?B?MGpCbzZ2dzIvQldmYlYybUg5R1JPd0FXcGpHTmVwQThEZEdkTGtOc2N5QjdZ?=
 =?utf-8?B?OHlVcU9haW9jOGRGRUN2dWhEcXpFWGVnanRMUUUwZkhmKzA5NUxOdm42UXBn?=
 =?utf-8?B?VUpVdmhnMUZTeVdIZzB1MVlUemNkUnI2L2g5WXk2UThCL2YvSUxsa01IeEF2?=
 =?utf-8?B?RnRvSXdMM2tSRlhobENvaFlyRlBscE5KMThZdE85YjNVWU5NdGhPY1VWejZZ?=
 =?utf-8?B?OC93ZlAvYVpEQ0FEdHZNeTFlUjF6SFN1MTFPR0wxNi9DQjVZMkdjb3dYNGpm?=
 =?utf-8?B?Tyt0amc0T09LaGpObWErcEtsWm9md3ZlZUxqOGpIaWFCemI2VjdkZ0JnbW9K?=
 =?utf-8?B?T2RXYVhjb1lRTU43bThYbTVXQnRwQVR1K3VYalVNWFpxV3V2RU4zZVJkdTVX?=
 =?utf-8?Q?nibKzAV7u1GfyvuEAG1pGwb4I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a68a46-36d4-4b3c-cf7a-08dcf9802b4b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 07:46:46.0174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdOdGsLgmeZ7sgGBAV/8E/6vcR/GZ8zFSAF4/LM73Rgx9ZKednntemM/cZYphSAQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
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

CgpPbiAxMC8zMC8yNCAxNzo1NiwgVG9tIFJpbmkgd3JvdGU6Cj4gT24gV2VkLCBPY3QgMzAsIDIw
MjQgYXQgMDQ6MjA6MzJQTSArMDEwMCwgTWljaGFsIFNpbWVrIHdyb3RlOgo+Pgo+Pgo+PiBPbiAx
MC8zMC8yNCAxNTo0OSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMTAvMzAv
MjQgMjoxNyBQTSwgSmFnYW4gVGVraSB3cm90ZToKPj4+PiBPbiBXZWQsIE9jdCAzMCwgMjAyNCBh
dCA0OjE14oCvUE0gVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90
ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMTAvMzAvMjQgMTA6MzMgQU0sIEphZ2FuIFRl
a2kgd3JvdGU6Cj4+Pj4+PiBIaSBNYXJlaywKPj4+Pj4+Cj4+Pj4+PiBPbiBTdW4sIE9jdCAyNywg
MjAyNCBhdCAxOjQ44oCvQU0gTWFyZWsgVmFzdXQKPj4+Pj4+IDxtYXJlay52YXN1dCtyZW5lc2Fz
QG1haWxib3gub3JnPiB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IFJlbW92ZSB1bmRvY3VtZW50ZWQg
bm9yLT5hZGRyX3dpZHRoID09IDMgdGVzdC4gVGhpcyB3YXMgYWRkZWQgaW4gY29tbWl0Cj4+Pj4+
Pj4gNWQ0MGIzZDM4NGRjICgibXRkOiBzcGktbm9yOiBBZGQgcGFyYWxsZWwgYW5kIHN0YWNrZWQg
bWVtb3JpZXMgc3VwcG9ydCIpCj4+Pj4+Pj4gd2l0aG91dCBhbnkgZXhwbGFuYXRpb24gaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLiBSZW1vdmUgaXQuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIGFsc28gaGFz
IGEgYmFkIHNpZGUtZWZmZWN0IHdoaWNoIGJyZWFrcyBSRUFEIG9wZXJhdGlvbiBvZiBldmVyeSBT
UEkgTk9SCj4+Pj4+Pj4gd2hpY2ggZG9lcyBub3QgdXNlIGFkZHJfd2lkdGggPT0gMywgZS5nLiBz
MjVmczUxMnMgZG9lcyBub3Qgd29yayBhdCBhbGwuIFRoaXMKPj4+Pj4+PiBpcyBiZWNhdXNlIGlm
IGFkZHJfd2lkdGggIT0gMywgcmVtX2JhbmtfbGVuIGlzIGFsd2F5cyAwLCBhbmQgaWYgcmVtX2Jh
bmtfbGVuCj4+Pj4+Pj4gaXMgMCwgdGhlbiByZWFkX2xlbiBpcyAwIGFuZCBpZiByZWFkX2xlbiBp
cyAwLCB0aGVuIHRoZSBzcGlfbm9yX3JlYWQoKSByZXR1cm5zCj4+Pj4+Pj4gLUVJTy4KPj4+Pj4+
Pgo+Pj4+Pj4+IEJhc2ljIHJlcHJvZHVjZXIgaXMgYXMgZm9sbG93czoKPj4+Pj4+PiAiCj4+Pj4+
Pj4gPT4gc2YgcHJvYmUgOyBzZiByZWFkIDB4NTAwMDAwMDAgMCAweDEwMDAwCj4+Pj4+Pj4gU0Y6
IERldGVjdGVkIHMyNWZzNTEycyB3aXRoIHBhZ2Ugc2l6ZSAyNTYgQnl0ZXMsIGVyYXNlIHNpemUg
MjU2IEtpQiwgdG90YWwgNjQgTWlCCj4+Pj4+Pj4gZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6ZSAw
eDEwMDAwCj4+Pj4+Pj4gU0Y6IDY1NTM2IGJ5dGVzIEAgMHgwIFJlYWQ6IEVSUk9SIC01Cj4+Pj4+
Pj4gIgo+Pj4+Pj4+Cj4+Pj4+Pj4gRml4ZXM6IDVkNDBiM2QzODRkYyAoIm10ZDogc3BpLW5vcjog
QWRkIHBhcmFsbGVsIGFuZCBzdGFja2VkIG1lbW9yaWVzIHN1cHBvcnQiKQo+Pj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dCtyZW5lc2FzQG1haWxib3gub3JnPgo+
Pj4+Pj4+IC0tLQo+Pj4+Pj4+IENjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJt
LmNvbT4KPj4+Pj4+PiBDYzogQXNob2sgUmVkZHkgU29tYSA8YXNob2sucmVkZHkuc29tYUBhbWQu
Y29tPgo+Pj4+Pj4+IENjOiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4K
Pj4+Pj4+PiBDYzogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4gQ2M6
IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQGFtZC5jb20+Cj4+Pj4+Pj4gQ2M6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4+Pj4+IENjOiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Pj4+Pj4+IENjOiBQcmF0
eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Cj4+Pj4+Pj4gQ2M6IFF1ZW50aW4gU2NodWx6IDxx
dWVudGluLnNjaHVsekBjaGVycnkuZGU+Cj4+Pj4+Pj4gQ2M6IFNlYW4gQW5kZXJzb24gPHNlYW5n
YTJAZ21haWwuY29tPgo+Pj4+Pj4+IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4K
Pj4+Pj4+PiBDYzogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29t
Pgo+Pj4+Pj4+IENjOiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+Pj4+Pj4+IENjOiBU
dWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+Pj4+Pj4gQ2M6IFZlbmth
dGVzaCBZYWRhdiBBYmJhcmFwdSA8dmVua2F0ZXNoLmFiYmFyYXB1QGFtZC5jb20+Cj4+Pj4+Pj4g
Q2M6IHUtYm9vdEBsaXN0cy5kZW54LmRlCj4+Pj4+Pj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+Pj4+PiAtLS0KPj4+Pj4+Cj4+Pj4+PiBJcyB0aGlzIHBh
dGNoLXNldCBuZXh0IHZlcnNpb24gZm9yICdwcmV2aW91cycgcmV2ZXJ0ZWQgc2VyaWVzPwo+Pj4+
Pj4KPj4+Pj4KPj4+Pj4gbXkgMmM6IEkgdGhpbmsgSSBsZWFuIHRvd2FyZHMgcmV2ZXJ0aW5nIHRo
ZSBzdGFja2VkL3BhcmFsbGVsIHN1cHBvcnQuCj4+Pj4+IFRoZSBvbmx5IG9uZSB0aGF0IGJlbmVm
aXRzIG9mIGlzIEFNRCwgd2hpbGUgYWZmZWN0aW5nIHRoZSBjb3JlIGNvZGUKPj4+Pj4gcXVhbGl0
eS4gSXQgYWxzbyBzbG93cyBkb3duIGZ1cnRoZXIgY29udHJpYnV0aW9ucyBhbmQgSSBhc3N1bWUg
aXQKPj4+Pj4gaGFyZGVucyBtYWludGFpbmVyJ3Mgam9iLgo+Pj4+Cj4+Pj4gSSBkaWQgdHJ5IHRo
aXMgYmVmb3JlIGFuZCBpdCBpcyBoYXJkIHRvIHNlcGFyYXRlIGZyb20gdGhlIGNvcmUuIGFuZCBh
dAo+Pj4+IHRoZSBzYW1lIHRpbWUgaXQgaXMgaGFyZCB0byBtYWludGFpbiB0aGUgY29yZSB0b28u
Cj4+Pj4KPj4+Pj4KPj4+Pj4gRXZlbiBpZiBJICh3ZT8pIGhhdmVuJ3QgbWFkZSBteSBtaW5kIG9u
IGhvdyB0byBiZXN0IGltcGxlbWVudCB0aGlzLCBpdCdzCj4+Pj4+IGNsZWFyIHRoYXQgaXQgc2hh
bGwgYmUgYWJvdmUgU1BJIE5PUiB3aXRob3V0IGFmZmVjdGluZyBjdXJyZW50IGRldmljZXMuCj4+
Pj4+Cj4+Pj4+IE5vdCBzdXJlIGlmIGl0J3MgZmluZSB0byByZXZlcnQgZXZlcnl0aGluZywgaGF2
ZW4ndCBmb2xsb3dlZCB1LWJvb3QKPj4+Pj4gbGF0ZWx5LCB5b3VyIGNob2ljZSB0byBtYWtlLgo+
Pj4+Cj4+Pj4gSWYgd2UgZmluZCBhIHdheSAobm90IHN1cmUgaWYgaXQncyBwb3NzaWJsZSkgc2Vw
YXJhdGUgbGlrZSBhIHdyYXBwZXIKPj4+PiBvciBmaXggdGhlIHRoaW5ncyB3aXRob3V0IHJldmVy
dCAtIHRoZXNlIGFyZSB0d28gcG9pbnRzIEkgY2FuIHNlZSBhcwo+Pj4+IG9mIG5vdy4KPj4+Pgo+
Pj4KPj4+IFRoZW4gdGhpcyBzZXQgc2hhbGwgaGVscCBtb3ZlIGluIHRoaXMgZGlyZWN0aW9uLiBT
b21lIGludm9sdmVtZW50IGZyb20KPj4+IHRoZSBzdGFja2VkL3BhcmFsbGVsIGF1dGhvcnMgd291
bGQgYmUgbmljZSBoZXJlLCBhbmQgc29tZSBjb21taXRtZW50Cj4+PiB0aGF0IHRoZSBjdXJyZW50
IHN0YXR1cyBpbiBqdXN0IGEgdGVtcG9yYXJ5IHNpdHVhdGlvbi4KPj4KPj4gSSBob3BlIHRoYXQg
YnkgYXV0aG9ycyB5b3UgbWVhbiBTVyBvd25lcnMgbm90IHJlYWxseSBIVyBhdXRob3JzIG9mIHRo
aXMgd2lyaW5nLgo+PiBKYWdhbiBpcyBhd2FyZSB0aGF0IHdlIGFyZSB1c2luZyB0aGlzIGNvbmZp
Z3VyYXRpb24gZm9yIHF1aXRlIGEgbG9uZyB0aW1lCj4+IGFuZCB3ZSBhcmUgc3RpbGwgaGVyZSBh
bmQgbm90IGxlYXZpbmcuCj4+IEFzIHlvdSBrbm93IEFtaXQgaXMgdHJ5aW5nIHRvIGZpbmQgYSBz
b2x1dGlvbiBpbiBMaW51eCBidXQgbm90aGluZyBoYXMgYmVlbgo+PiBhZ3JlZWQgeWV0LiBJZiB0
aGVyZSBpcyBhZ3JlZW1lbnQgdG8gc2VwYXJhdGUgaXQgdG8gb3duIGRyaXZlciBvciBzbyB3ZSB3
aWxsCj4+IGJlIGRlZmluaXRlbHkgd29ya2luZyB3aXRoIHUtYm9vdCB0byBnZXQgaXQgdG8gdGhl
IHNhbWUgc3RhdGUuCj4+Cj4+IFRoaXMgcGF0Y2hzZXQgaXMgdXNpbmcgdGhlIGxhdGVzdCBhcHBy
b3ZlZCBEVCBiaW5kaW5nIGNyZWF0ZWQgYnkgTWlxdWVsIGFuZAo+PiBpZiBuZXcgYmluZGluZyBp
cyBhY2NlcHRlZCB3ZSB3aWxsIGJlIHdvcmtpbmcgdG8gYWxpZ24gdG8gaXQuCj4+IEFsc28gaW50
ZW50aW9uIGlzIHRvIGJyaW5nIHRoaXMgZnVuY3Rpb25hbGl0eSB0byBjdXN0b21lcnMgYW5kIG5v
dCBicmVhawo+PiBvdGhlcnMuIFRoYXQncyB3aHkgdGhlc2UgcGF0Y2hlcyBhcmUgcHVsbGVkIGlu
dG8gcmMxIHRvIGdldCBiZXR0ZXIgdGVzdAo+PiBjb3ZlcmFnZS4KPj4KPj4gQW5kIHRvIGJlIGZh
aXIgdG8gc2F5IHZlcnNpb24gd2hpY2ggaGFzIGJlZW4gbWVyZ2VkIHdhcyB2MTQgYW5kIGFueWJv
ZHkKPj4gY291bGQgY29tbWVudCBpdCBiZWZvcmUgYW5kIHdlIGFyZSBkZWZpbml0ZWx5IGhlcmUg
dG8gaGVscCB0byByZXNvbHZlIGlzc3Vlcwo+PiBvbiBvdGhlciBib2FyZHMgY2F1c2VkIGJ5IHRo
aXMgcGF0Y2hzZXQuIEJ1dCB3ZSBuZWVkIHRvIGhhdmUgaGVscCBmcm9tCj4+IG90aGVycyBiZWNh
dXNlIG9idmlvdXNseSB3ZSBkb24ndCBoYXZlIG90aGVyIGJvYXJkcyBhbmQgdGhleSBhcmUgbGlr
ZWx5IGFsc28KPj4gbm90IHdpcmVkIGluIENJLgo+IAo+IFRvIGJlIGNsZWFyLCB3ZSBuZWVkIHRv
IHJlc29sdmUgdGhlIHByb2JsZW1zIHRoYXQgaGF2ZSBzaG93biB1cCBub3cgb24KPiBhbGwgb2Yg
dGhlIGhhcmR3YXJlIHRoYXQgd2FzIHdvcmtpbmcgaW4gdjIwMjQuMTAuIAoKQW5kIEkgaG9wZSB5
b3UgdW5kZXJzdGFuZCB0aGF0IHdlIG5lZWQgYWxzbyB0aGF0IGJvYXJkIG93bmVycyB0byBzdGFy
dCBjb29wZXJhdGUgCm9uIHRlc3Rpbmcgb24gdGhlaXIgSFcgd2hpY2ggd2UgZG9uJ3QgaGF2ZSBh
Y2Nlc3MuCgpUaGFua3MsCk1pY2hhbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
