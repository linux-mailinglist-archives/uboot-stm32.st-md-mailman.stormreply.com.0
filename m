Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA478CA4664
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:05:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75324C628D0;
	Thu,  4 Dec 2025 16:05:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B3A9C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:04:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZYv4wW9cyH56xGF5/8u9u88VIhsNvnovGWSSijmQ6nO/VpjWw9hkN6vo6WOvZZqh8SymYs3JUE0zy8qUMOg2cdvgjD3i04OmXWqFdyzHnuPp9xAiTAL2pdWMjQ+3cTGCmDsPLl/ULRkwM1zIDiBmuSlgc+3RIZQi/OpKsPbC+2ovt9ATZHGkxokru3qZ/1nM4R05qySgE99vBYm8xGPgdNvEzwRoAVSPdjFxeqrN3aE9uIfqCxggMGNQtR9XFLbvo4+UeReySnwILzHs35ymoB1FypeOdzraaOiShauUaxnhOm3d6u5fruE1hTPaz9jSbJ8KwAW7ZErEojOK18mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=TIfDR19MW9EfSgMC+LtTwxLueci0y2LPzow0cFq3WH0ZqcQhbl+dy4HcpEcZzk9SzFC1JGhbC8sXNf8M/murJ06Twdx5lbEHsB2wETmL4XrzV9N/LPX2xcKC52kOAlbtXcv3afxJa7+tpxnljLkAB8vJh7BY4zIC5hhSAqb6dFe5nThl3AaqzIQHspu9njZiC449DiRTkabr1Us4OWhewQQPGag+wLtr03/y5mW41Q1Zf1rOA36A8NFZsLJKgcXksWqYtvyGJImXphwEltPuq3AJL+YhYbwcpKkGpHUOud8fLtntYWKgbYzFy9SBL/fBUwpXP9nM+4sl5gRK/cyQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=VooBFMcgrJZRntMoyJ8mjiZs17o8lhFkZrbRTXdtQXHLWEyXzPxoMd+OBT1PcHc1RRhmrbZU/iy0nksdGnb/OuIE0Le9vX/bURpWS31KZMl2/U44UZBxmDCC3Lhbq4nrWxF7TNyylTp2sEz74o8psAOrtrD2+G4e5o2OFzZqUzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB11585.eurprd04.prod.outlook.com (2603:10a6:150:2c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:04:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:04:55 +0000
Message-ID: <fb43fd25-5082-4f28-a5f4-18093d313fba@cherry.de>
Date: Thu, 4 Dec 2025 17:04:53 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-11-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-11-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB11585:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bb8016-e721-414a-8d0a-08de334edde9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3IwMjRLZEdoSXB1QmdDTUJQOGo5QmQwQUdoWEtMcnJiRGNjQWpQY3pLRzlT?=
 =?utf-8?B?NzJacTgrV0dQQnAvZmlyZUk4KzBVOW9VcG5sNXVFUm1PVDlHdy8vOWhEK0xr?=
 =?utf-8?B?dVA2aFVPYXNCTi9IbmMvOTFMSHo4U0ZNN2Vkb0dxYzJhR2djRjdXOXRXN3U5?=
 =?utf-8?B?Ymk1TWU2aTdxN3NhYll3MWNKVFVtV2kyNm42OGtwWkRPQUFIWkVBZEh3cVFR?=
 =?utf-8?B?b05OVXZpcDYwTktVZUZ6SEpSN1d2YjRRU0xmVnFLWmZQRVVaN0lYbEJMa2FL?=
 =?utf-8?B?Mkg2T1VJWm1KS3NYK1UyU1lETkFnU0srdTJaNkxJTVdvKzlwbEdKR1JOc2V5?=
 =?utf-8?B?dHBHamZFMEtnNis5aDBpQVdjb2dlUEZqSDhKbk0xQ1RXc3EyMTlacW1JRyth?=
 =?utf-8?B?R3dkK1pQSEpYeFZ4a0VZNC92TUVYTUlTUUU1eGJET3lGQWZLNFIrZGJCUXFy?=
 =?utf-8?B?OXYzL3NyaW9NeTVBUU04R080TUJqdmpQUjIwbEYrZW82ekRwaC9BaUFXeFhN?=
 =?utf-8?B?OUptVWxrTnRFVnE1WXFaK2RNdS9NRmNXMDFRV3hGNHNuQy9pYjcvOWNXUGJh?=
 =?utf-8?B?QkZJTlRtVmZYdXA4Q3J5T25TVVNvY3prejgvT3RzZFk5NXNBdUM1ZWNCS2hB?=
 =?utf-8?B?WnJpT01BOVpBYVhST2t0UXFKNzJtdkJKbUZBSFR3bXdwOUhUSjJtNnNTTzRr?=
 =?utf-8?B?Q3IySkpJSUlTeTBacTVEMGxiV20rbU1COVpRR1h4azl0d2FMUm8vKytaUWZ5?=
 =?utf-8?B?WXdKSWEwKytaL3BjZ2h1MzY0dDBGaGgwYWRZaHlPMGpuSENaZkZLQWhTVmlV?=
 =?utf-8?B?TXZiZDYyUjNZTVJxaExwemNGOXR4LzZEQ1BTazQyUlJ1MDV1Z1BKK2R0ZWwz?=
 =?utf-8?B?NjF4ejYyOHQxK1luQ0dxRWx6eExadTQwVzB6a3dDN0EzK1BZampuVytST0Ur?=
 =?utf-8?B?Rm1zL2EzMFdPVEsrOTFTbzhUNk9hcDg0cUJtZWovLzdxSi9SUWRRS2phWVZC?=
 =?utf-8?B?ZlBkSGFMWXFWamhBVGNYZTdMMnlWSWlUZW5MYXdxYVhtOGVIWWNrYlZCcE9u?=
 =?utf-8?B?V1JGR1lndkxON0RYVDBCU0pOdUI2dFUybXJleU42bU4vR1g4TllRc1FLZUZV?=
 =?utf-8?B?NStBWHlobXpWNjdIVW5PcWhnMlltMkNFYmNRS0kvOWxFcHJOcFhBWUtyb3Zs?=
 =?utf-8?B?aGZQdmcvQTI5eUZZa204VktIWHg0UHNXK0FVL1RrWHcxaWNTMm9obzBUZXps?=
 =?utf-8?B?Mjk3YlNUUnBadTJseENENzJlTWV3UG5NU2RacEpHSi85b2wvZFJ0c2N2MDgy?=
 =?utf-8?B?cFE3OVB5RTJVSVlKTng4bFpRK0NLekVITG9OeEtneVFiYnhCOTRYRE4xdW1s?=
 =?utf-8?B?N3MvRzNOU3Rxdy9NRkRXUWRUdmE4d2ZNeTBmWUFIZ29MaEZudCsxTXVCVEFt?=
 =?utf-8?B?NG9xbExUNXk4R0UrdVFOSXNsN0lTNDR4V282YmkrU1M3V2hjMStBQ1lXdTkv?=
 =?utf-8?B?NXpiQm9jUWtScGhpTUw2bU81OWZ3ajc4bVYxYjhveGpHSnI1blJYMzJVdEsy?=
 =?utf-8?B?RnF2azNWWWxDU0dmcHo0Rm01ZVhQaTBOZ25ZaStrYmdLWENHSTNMSUtJc1VY?=
 =?utf-8?B?bEZTZXRydldZN1FiUjZ3K1VUTGVmdHlJVzVQNkVabUNPSlJFV0xNdUZ5QUIy?=
 =?utf-8?B?aklYTHoybmI5SHJQcklYbzErU1M3cEJISW84WTY5L3Yzdm5Ea3NmNzBYc0hG?=
 =?utf-8?B?c00rSm0vRUQ3QVFjVmtDMEIybTgwdzM1OXpkMXA4TzM0cGtPMk8weks4MXhR?=
 =?utf-8?B?dlNXcTNuOUhJUGlTWEpGdGdYcWE4NXZwZG01Nnp0WjBmc3RsWEJIaktFejZy?=
 =?utf-8?B?UXlDU3FPeFQ4VXVLME53UENDc1I0RWFYY1kxaHNpNVNsV2hKQnNuK0sxSTRG?=
 =?utf-8?Q?FEvHDibJyhtt8WDBIXew4k1/eCoQYzt8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkFpd0FIWnpVTUhad1dkejAvYWt1Z2xNZUtEdjhvM25VS0NwdHdDbVRka1Uw?=
 =?utf-8?B?MlNGYWlycW9Fc3lobE5JQUh1WnU0TzV2YUU3eWh3cVRqbm1idFJlakIzdVZy?=
 =?utf-8?B?SXBrNi90YnBXUVJaME0xQVVwbnNwZk9jMlFFbGt2MHJUWmJDSzRkK0FWTzA3?=
 =?utf-8?B?eU1KY0hPN1BrdHF6cElIQy91dnM0SE1TQTRhWjhvZUVvYVp0L3kzd3k4a3ZS?=
 =?utf-8?B?MFd6dkxuNkRaKzV6cnUwK1JJaVFSZ0pTNjRpeXBDUmJhMzh4TGRkTVppS2Jt?=
 =?utf-8?B?NWgzTWxlUTRZM3VPRUNPVE40V0FUOFc2TWJ1TGhqTDBRVE5NNGI5cG1sTFlN?=
 =?utf-8?B?L2xWVWNHMGV6czdtVEVldFROTkZ3U1lsck42MnFaUnhYQVZTVHJKM3BTWXNz?=
 =?utf-8?B?UHgwVjFOeEVpYkpVYnBUSmQwYlh2TmIvVTJRRTdpZGY2VzJrN0dXMUE0UXJU?=
 =?utf-8?B?R3owVnNpYmxMV2RhZ2Jqdm5iMUUxZkVkTHdhWTN3MURZdzZZR0Q3Tm9PTjg5?=
 =?utf-8?B?djBxT0toOCtYcFc3Z1dOUXlqZjNnbFdNT2NiQ2Z6WTVBZFkyUGlKQzNxd3Bl?=
 =?utf-8?B?VUVzZEtLUlJITmErOTlJeTBFcEdyVEszWmx2RUU2Sm81M092bUVJVS9WQlRy?=
 =?utf-8?B?Q1dTV1N0S0VzeUdGNXF1WERSd25yNmdacTBOenVBMWIvd1hNOVpzNFprU2E5?=
 =?utf-8?B?cENWSlZvbERSTzhHenlwU081SmdHdFU5aHpnOHp0S0xOVVdUR0NKbldPOGVx?=
 =?utf-8?B?dHl0RTVGK3pUZDRQQTRFOVJZSnQzNWNzUmRyaHAxNUxETThYVmgrY3FSdXNZ?=
 =?utf-8?B?RitNWlV1S0V5dXBpK2NGMFlvTTFDS1o3K0xFZldTU0hldnhlS20vVEthUGtr?=
 =?utf-8?B?bGphS2xKaXZrb1VLV0NocFE5TndGMDFxRGp6Y3hXeHk5SU1RNmlxS3FuUjhJ?=
 =?utf-8?B?eFNER0ZpUHhEYW00UUFPVktsRnRhTisrTGF2aXFZT2Q2eXlMb2RoTkdMeW5x?=
 =?utf-8?B?Wk4xc3A1VTk1VmlMRmNiZjhiYlRYWjhtSDhtczJkOENybjVVRWNxRGY2OWNx?=
 =?utf-8?B?NDRPVVBDZ0xWbkZGQTc4ZWFINnRQOEs3Z1diVHI1Q2M4cEdjajI4ak9ZVmx0?=
 =?utf-8?B?S1pOMFd3RExkeEE5T3h1SGVnSTVCdFp3OGROQXYwRW1uMFpJMkhzdTVXdXZv?=
 =?utf-8?B?TEwrdjNrdUt6UjU4WjByenNDUUVhejdmUFI1b0tUVjBMbGs1ZDVjZXV2dWxJ?=
 =?utf-8?B?RFR1bXplN0R3ejBFK2JLcWkwSUVrcng0K09CTnVWbjRoeWtJTUdLaWZkRlZU?=
 =?utf-8?B?cVBoaVAvdFRwYzBMTWlzU2FvV1B2ZzNKa3VNaUdJRi9Gc0Z2czNURFhwMTNH?=
 =?utf-8?B?NnZ6RE1jWUhvNU1iYTljcGd4OTJxNFlxSlVkbzZzcm1BNDRyUkRUL09nQll3?=
 =?utf-8?B?WkR3T1BuUXhMd3RPeUVxWko3VU0vRk1wMWszejByOG42RzJvR2orbzg2Y3pm?=
 =?utf-8?B?QnJ5bFBHRUsra1BzUkc4S3k3S0FUdVFSM2p3a2FsMmpKS204N29Gc3phb1Ru?=
 =?utf-8?B?d2xjZm9QWS9NZ0g5Kzk1UDRwRThuS25wR1EreG9tZVlzQW02S28vQ0NCcDVG?=
 =?utf-8?B?czF0aFkwL01hVmdTUG5QWUlUc0RKVnFwUmE4NWZDV1YzRDZmbWFGNDNNVDc5?=
 =?utf-8?B?Nk5qaWIybmpieUVRUWdpWG9wQ201b3l1UG1STmVIbFo4OGZnTjZkVWJsT3VJ?=
 =?utf-8?B?dlBCQUREbUVYVWhqc2pyYU4vNUV4WllQVlVFeHdJRm1Zby83N0JtWWpQdWEv?=
 =?utf-8?B?d1hBUHQyUnR3M1RhUk04UjVYTGoxb1JaUnZvN3lTN3J6SFpvaW9qK243ZG1R?=
 =?utf-8?B?MjF1RnBLRnoxWWZkVUZ1RVp0UHZaRGVZbm9jYlZlemVRSCsvOW5EMTl3Q1di?=
 =?utf-8?B?RXhZZzhyeEs0Nml4eUJnQmw4MEp6QzBMQlJVaEZXTm9ETWgwL0lGWE9OenRi?=
 =?utf-8?B?ZHlnWFVkOFdBbFpjMlZZZUcxWW5NVmRMV3RIYUxzWFAzSURrWEVNc2c4T29z?=
 =?utf-8?B?bVNkbUV4S0lOdWxISlhNMVFGeFZ5aXJ6SHFxdE56NXpJK3FveE84NUVUbHNw?=
 =?utf-8?B?eHdzZ0prdlNpemRJMTI2ak1ZS3VMSk9vai9ZK3VnSmp4MUpSUjZHSE1FclU0?=
 =?utf-8?Q?MlXNDvL0xFRoYY6lf0wjff8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bb8016-e721-414a-8d0a-08de334edde9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:04:55.9266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xewZGJlyqL9oAKQxrL6dPw6kzhvboQIQv2tSYgBJFrvusNSCEwQ/mc69ojlzdkIW0oxjOnxPoMrZzu+cpLpS2TfNwUWsPzZ3UNHjM+m2MeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11585
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 10/23] configs: stm32: Enable LED config
 flags for stm32h747-disco
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> Enable LED, LED_BOOT and LED_GPIO flags.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
