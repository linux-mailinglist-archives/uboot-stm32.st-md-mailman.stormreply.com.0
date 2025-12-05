Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3753CA73CF
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 11:47:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70CF6C628D4;
	Fri,  5 Dec 2025 10:47:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2060C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 10:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ji1DBpnAGt1cOCwx0MRQgBl5le4HLSNskb1wjf8AzCx4qRdZhYVbPikkAUFzNoJ+1VXGGEfU9+9/pOI2fJD3LZYv510mJdGEV2MN/EogGhqEvmMwXhp920DBRfR58iSKptc4KK0s6+M0OmZ3tx5f3V4S7hg71eVOH6drxR61JkEw4HlB7olcJtWLuGA15Kvg1t8TmbLMBLnPMSRzOBeyDBM1jFapuYX7nSb2En5I2qsen9TMkH/nW5AFjKCftNDsBtKgrjViNsMMMAPojvzJGgodDSROXYh4rqEryJ+Ul2XcCA+q2zK76E7fnAzXkUDF2p8qqhmWSic3KXBQZN/Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+2PYkQ0XXv9Ep2ZdxigPJ1YWx0T+her2h5MbQZDFoA=;
 b=GQqD4DTM9SxXv8QrAeK7mPgPASw15pESKJgy/8qIRj3yfVB3L9P3czuc6CWIEzKBO2YxdAGxREBmhOXRumQT2CwChFfSs5lNhQPAbBZ/LQzeJBjz0LBiwGouJk/sm3PgDzY04frI3zPsS1AhJ10wCrvIsMAcYIqL/7AY+5R/v++MWdU0qKuLZb+vpoAInWDjkmA2FUyETPqbOzYzQQdPBEOHIvsWpy9AHzg5rPdy6K4yHZU8LvdBnju1j677EdWxV2kQaKAzAkp84M85r51aN8Iwq77O+d85YbNElyY8TmTxXK0q/6r30NgT2gW5LaHTABoeO7E+OmvV8BM2xr+g/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+2PYkQ0XXv9Ep2ZdxigPJ1YWx0T+her2h5MbQZDFoA=;
 b=BgwiXntZB9plRcCXl2sHpXP6fE97kJ1/XXqu62Ay5HtXBJL4yp8AoLtsc5mJPoxRUjEGVhPlO8pp86UkFeDvelaGMox0M4ubyHXG3aaY1JsK87IP9nMqBrgFq0gcToPZewFhaarBDC4Oj+pDLUC3aUVUrYQqdncrqgEFtSiFXN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8137.eurprd04.prod.outlook.com (2603:10a6:10:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 10:47:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 10:47:14 +0000
Message-ID: <57068149-e026-48cc-acfd-eb1097cf90fe@cherry.de>
Date: Fri, 5 Dec 2025 11:47:13 +0100
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-18-patrice.chotard@foss.st.com>
 <07a85afa-dccf-48e2-86ac-5fa91477806e@cherry.de>
 <9fd0a6aa-8201-4202-a1cd-ec27bc24c59b@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9fd0a6aa-8201-4202-a1cd-ec27bc24c59b@foss.st.com>
X-ClientProxiedBy: FR4P281CA0365.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: da71649c-f057-46b5-24b9-08de33eba6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmxLbFN6RVZmQUJQcG1KbTd4NzAzSEZ3aVlOR01hQ0RRaURxTTR5S1dCRHJ5?=
 =?utf-8?B?RnNmK2Vmb1paQ2xjOGlaYkxVa1RhblkwVE5zTDE5ek96dFZVY0R0S3JoMTVP?=
 =?utf-8?B?eWNqQkVDQUZ3OGlySXBmY2h2bUVmTEVrcWVUdVBKYmZCbHdEaERoWEZEYytp?=
 =?utf-8?B?NW9oWXJXd01yMy9xL2dCZHY1UGxzL2FabzBMN0hzMXdIbzVMei9tWng5elFV?=
 =?utf-8?B?WWw1cWEzME4xSk5yTEtSTmMwTkxCeUozNTVZalJMQThybWIxMnNXbkIwK1J5?=
 =?utf-8?B?WGRoRk9rOGp0RU5HYWsxeWxuc2x0Ris0RU1EQXU2MG1sWVJVQ2lqWnF0SGxV?=
 =?utf-8?B?ZmF3YXhTUEFmdUVLMGU5V1NrVTdBUGp6d1B4UnlWYXZhdm8yTllUSkFIM0tV?=
 =?utf-8?B?SUVadEtHZWNBTWlaQXRVR1ZFN3J0RDhCRGl3c1lqNHBFam43aHhOTWZKakVT?=
 =?utf-8?B?NGxsbkxpbHRCU3RzYXVzNTFFN2ZnVlVtRHVlSlIzd2dvQzNiMUJnRUgxNHF0?=
 =?utf-8?B?cGoyRW1wUnRFczJHL0loZUtHTi8xNUMxWWNwUlowUWZYSDhhNkt0azJML292?=
 =?utf-8?B?TEFJMmF2ek9SV3hSTC9iRnhhYU55eld4cjFpdm1qOXNPZTZKNE9EbnppcEJa?=
 =?utf-8?B?LzNWMUw1dHFBNGlqendtd0dZMTlOS01SZm1ueVVSM2VuejMyZlpBQTV1OWZP?=
 =?utf-8?B?dURmMGQrMkI0M0ZMT3BBRGQrVEIzd1BXaVpCNklBQWlXdnM4dEJGVk9BNEtL?=
 =?utf-8?B?d0x1M3BEeDdXaDJsNENadlZ3RlNBK1BpWnVmV250Q2xGNU5OSjdBdFA5MVNp?=
 =?utf-8?B?T0hNMVJNR1JTc3Jvc0s3MkIyaEsybnU5WUF5bEM2anh5K2srMFFjK29KcktN?=
 =?utf-8?B?V0k2SEtVTGYrSWdZWEVJRDEyY1RZYlgyb1RBOHB3eTVGZ0pZdDFtNFpXUkF2?=
 =?utf-8?B?TnFyeUUzQXpMLzc3Q2l4Ty9zUTg1YStoT0lET3cwTEM3R2xQNFNkOWNlaGVn?=
 =?utf-8?B?blczZytIUWIrcjRVQVFTNFdiSHhtRVhyUTJ5V3oyaFFtZWJmWG96eU1TZDhh?=
 =?utf-8?B?UVlWdFhaV1VjQ1pZQ2dJOUZFZmlRZ3JIQzIyQ1dIN2haTWh6YlMrT0YxcGFB?=
 =?utf-8?B?aVg3MDJJRHRXTDl6WXJNOXpzQUlGNXlSVVlEZEcyTUp5TFZ3QXpBclVmSEpK?=
 =?utf-8?B?dTNtN3NYM3dXZ1lNdnJsM29PSzB3ZXJ5azVGNldEak96Y0E0OUUreEsvcnJs?=
 =?utf-8?B?MStPNCtmcHBYWWkwcmN0djQ1M3NCL0t3UTI1MVExQlRGL0hQcDRCSUlvaHAw?=
 =?utf-8?B?ZVVISFRudVlLNVZiYm54Ylpnd05NZlkwMHBwTzJUTFY2YUo5RERzMk4rUWdp?=
 =?utf-8?B?dlk2L0ZGL0pzU1U1NlBzd3hRQjJVVUVVZWpZY2FLQ0Z2WGFwVE5hcG55MUdC?=
 =?utf-8?B?bnZmTm94Mno2cGZJOUNtOXVJUnZNRmUxSkszSGVORGxGY0lEM1huMFc5d1Q1?=
 =?utf-8?B?MTRESXZuZ29DMmxzVlZpSkJTcXM0TjdySlJndko0QmNtazZGeThnb1NzNjdz?=
 =?utf-8?B?RFhGMG9Ga2MweThUV2pETDhNeWhhY1c4ZkRDZWFFRG1WVktIbkFKcVo3SGJB?=
 =?utf-8?B?dzZ4dkpFQWJpK3RIbGhwdkVNYzkzQzFlVTh5UUdsa1FFZEkvSTZsQzZiTkpE?=
 =?utf-8?B?elUrQ05iK2RsTUoyZHd6ODdySkNmQVZEdFFybmVsL1hOM28rTHlncWY5N0Y3?=
 =?utf-8?B?VmhrWWJsSEp2Z0Y1NWFRVUVrZHBCUUwwbzg1bll2bDNYcDI5MWtDc0VtYzFm?=
 =?utf-8?B?clNZcEsrZTM1RnNFRVdTTitzeG10WmE2WHBMY1hZNFRmZkpPeWhTNGhDL01T?=
 =?utf-8?B?NU5yQjh1SGozazZLamx3TzVHWGcyUnJPQmNaSXlITXlvVXZOb2JQZjc5Smcy?=
 =?utf-8?Q?zxVg9Tn6T9ibTB00W1OPysUzrobhJ5nE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkUyQ25sUHNhWTFyYWhvMW1wcEMvVXBPbUY4S0RpN1gxYWZlYXVUSGo0ZE5K?=
 =?utf-8?B?UDlhSEc3TXkwMHptY1RVcEg2YXlpeG1pK2krZHRiNU9wQTRwOHNNeUlqeGEw?=
 =?utf-8?B?VlZmcWtSRjNJQTk1dTBwaWkyY0Q2a0o4bERUcXRpWFUrWit2d3pSejgzSFly?=
 =?utf-8?B?bk9qVkFDY1lJQndETnJoTko5OWQvUUJMTXRwK0J1SnFMVGJ3ZnRsWGVBYkRU?=
 =?utf-8?B?YUIwRmVXTTAvQUl3eTBUNTBDSDRyNVBDUFFLVDFGZTlGOHFCZ1N5eFhVaU5w?=
 =?utf-8?B?blNGMXFHUzJZdzB5YmVCWi8xR2hOcis0R2lQV1ZiQ0ZkMWpWRjdLc3VVNVAx?=
 =?utf-8?B?N3QzMWVSZjYwY3NwQ290Z0EwK1BqNlF2MlJoMk01VHkyZGFlNGVTdCsvZ3dz?=
 =?utf-8?B?RWM1UEl1NGxrZFl3eWxwVTczaS9lR0NENDZRaGlFR0RkdWhvRVBybG5KTEZT?=
 =?utf-8?B?SUZHSGl5QUY3RFpFVEcreWNNc0hhZUw5Zit2YmVPQzNKUVNiaFFzT3BGanVY?=
 =?utf-8?B?azNkaEh1bzVwdzVGbnRUYklRVVNaa0t3cGpGZXkrVTk0b29HMnc4cEZIZ1ZS?=
 =?utf-8?B?Sk81bkRZWEhISFpaaDVxSGxPdG15bkFJNTUvWHhaY3BnUXFnN0c1aVNtSnV2?=
 =?utf-8?B?ejc4Skp1YTFzNElaRWpDek9lM1Y3QWlZSm1FQlNBUzlGQXlRUWhNMEdXK3Vq?=
 =?utf-8?B?RWlEL0FlcWwrQ1ZmR0l3Q01XY3RYSmZ3cUVDSzdnalhoZkU1R2FncVZVQldn?=
 =?utf-8?B?d05Da3FzZ0w3WTBycURGU2dDS2hxbTVza01JTkNoV3p1ZXQ2TFh5MEl5NTJI?=
 =?utf-8?B?dTBRWEh0U0laQThPMjNqYjh3ajd6NVVxbjhPcGQ0dlY2Smd0ZUpzNjI0b2NH?=
 =?utf-8?B?d3ZaYmlocU9OMmVNVHRPVTZPNkVVMy9Eb09TeHErM3FPNlpzckxsbWZiNnBp?=
 =?utf-8?B?djlsb2Jka3kwd0VkWmZyemhaSHhZUEV1UHZKcDFWd1NhYW5KUkhZMk1wRys3?=
 =?utf-8?B?TjhYbXMvMUIvc2hJVUVTaUhpV1dQVzMwVkJwa2RSYzRJVVprQUM2c0hJWSt6?=
 =?utf-8?B?TVd0SjNtd09zZkRsWXBPMncrNUd0T25oV2pmVE9EWHQzcmlqNjM4aTFIYkh4?=
 =?utf-8?B?QVNsbFQ2aVVMQ1Q1SnVGMDRON0IzVTJ4RTJGZVhQcXFKSE1yTGtTOHNmRUpq?=
 =?utf-8?B?amJ4M09WMkRxY282U1NHL1lXRlcyM2Yyb3A1cUFTM0ZpMG5DaEZjUUdRMEdE?=
 =?utf-8?B?aDFjODBjL0Vzbko4N1E4aFdyT3F2emtoTXFGNEpRWTM4WG5nT1p4amlxSzVu?=
 =?utf-8?B?Q0doL2hHSis0K3NqbDF5dFpoOTVWV0hyeis2LzhEcEpsYW9heFhxRTdzUlVy?=
 =?utf-8?B?cVc0amxMSlZQZnhmTGhmWmpZaW9tWGs2ZXIzSzlpY3ZiL1VRKzZRNytodjEz?=
 =?utf-8?B?b2Z3M3FsTE1kVmVReFVRYXk1d21kWHZMdE40SG1QTWR6dzdmczlydEZKRXJP?=
 =?utf-8?B?QVlsMm1SREJ3Wi9CSzhOYWlSTER5a3FmbHRMVi9KVlhSY3lWY2R0VzNWRk50?=
 =?utf-8?B?MjFqTlJIcCtlaHNiVTQzc1d5alRKeVpFVndsODZTdTFwUzRjaE8reFZmWmly?=
 =?utf-8?B?b0lPZzZaZUErSmdPWWdsVmVDRGlVZ0RvVEo3eVo3eEpNeCtWUmQ2N0ordVkv?=
 =?utf-8?B?cklLZTA5MmNmYVJGeDlEUG42Tlh6a1JNU1dDWmtPQ0t2WFpIaFR2eGVPdzdp?=
 =?utf-8?B?bkZyUDkvSjlKT2Q0Z3czU0J6bjdxOGJlSWJIbmVjaDRSRDFGaXgxQWZwY2x2?=
 =?utf-8?B?enlEU2N2RHM3M0dVb1duMkxzTXRBcFVaYjZCUHJlanNTbDJ1dTZkZEFIQjZE?=
 =?utf-8?B?azZ4dVNGbjJhS0NMMGJOcCtHZ2l5K3JjSFRyUjBscy9ZSU11NHQ2SklodG1q?=
 =?utf-8?B?dk9ZQSthM2UveGFvdGNDMWFkVGlLSVZJM0l0S1R4Mk5qdGhnOTBTS0JUdXJa?=
 =?utf-8?B?WlF5ZVpoUWhmS1g1bWpZUkMwU0J2cGhod2RWbnhQS3BJeENWN3hWZFdvdW81?=
 =?utf-8?B?bG9CM0lxclNBNklja0Vob2pMMmpqbm4vYjdhckRKb0d6Y1J5SFFIQklCQUJi?=
 =?utf-8?B?WUgzUjYwSkwyK3VzaUdVcm5uSlR6UmR0aCtkYlQvZGZhdEFOZzNxL1NzWGdt?=
 =?utf-8?Q?YNFQshUwgEpAG6AahVSIbzU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: da71649c-f057-46b5-24b9-08de33eba6cb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 10:47:14.2835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dOl72H/09kfcl+oWqVwtYOz13e5PPtRh3NzEkd30k46FUYg53cmM4544tIrEw+rAqUwN46nbL7+pxUsfjVceJG6eMDXpmDz3YMgdCPqrNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8137
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 17/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp135f-dk-u-boot
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

On 12/5/25 10:45 AM, Patrice CHOTARD wrote:
> 
> 
> On 12/4/25 17:25, Quentin Schulz wrote:
>> Hi Patrice,
>>
>> On 11/14/25 5:23 PM, Patrice Chotard wrote:
>>> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
>>> from stm32mp135f-dk-u-boot.dtsi.
>>>
>>> Remove also led-red node which is now part of kernel DT.
>>> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
>>>
>>
>> You may want to wait for the DT to be sync'ed with Linux's for this patch so that the red LED can still be used with the led command?
>>
> 
> I will not wait for the DT to be synchronized, as the red led is no more functional since a while it's not a big deal.
> 

OK. Then this also answers my question sent by mail to patch 2 just now.

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
