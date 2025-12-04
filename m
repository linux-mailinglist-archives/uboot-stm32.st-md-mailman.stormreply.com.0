Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12072CA47AE
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:27:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0E44C628D3;
	Thu,  4 Dec 2025 16:27:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B932C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0MCHP/07uBJ0NFO5zWqjmE9bNCGevCn3vLON/OXklkv+OCWzNaRlyIHfTGZf3gNV/+916/OatYog4NqicOjXNqeWnLf3eX3vNB/vj9tF2m7OWlalp/jcw2cOwLeBK+ASmaqfzDlW06KaLU3b/IEhoZuTuCEfVg3Q+pE/qR3yrEVo8WgI6+eBrh9bZLaapa2TnNm0l1mM68v30qN5meITgWth7qkBMuVQgoMIHs/QMv6ZQBgi1EGQVutmJwIYBqS7aao6Jba0TKYQsv2kmB+4OFi1YQcVblGjdKO48vRvU8RItIfSQP+rVWc6TqCZHHKfHUIAun66AW4nTQ/Ul3Dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjsARAPXWqkZ+C2vHnqLhGckxkdvpvAPPYrxvRbpu7g=;
 b=TZOIri2Sn9hHztyNYk4b0rhZVFFNbwmbnDRtoSsxXXaklHQejlM26MJJWZKTHI4hjB1FSLhCzC8sU9eiZly+i9Tnk9iGi6PPp3VjOVi5dNFq08C/0rwLMKhSbS+udQyR6DpKxZU5Z0AMYERFs2x3IEs4T7W7QvUuyCOgzSqVZ54xxWKmko+3KurKzV9wWhIGZrnUJlWou7lO2MquxTy25h1M0jSMNz+WqFmhKy1cufB7I+onT3gaFntJPdLly1wtMGx7WGV9BSjYxom5GzXadbxfr7qQBZpxlsLptRToaRlBLdvlBzdiGmzh245nBL24ybUvcZnXSbzNkMOWN5XCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjsARAPXWqkZ+C2vHnqLhGckxkdvpvAPPYrxvRbpu7g=;
 b=WsWDAMrDPfbaTwPgyj/Wr/KHChvZXuHOphwjU8Aw6WmnzE4LG3cz2CYrJbJXZJtYuJJhCIoO/3c5EE+XkDDHfDAM68u2ZoIhk2GbMpSC/aHbI0Q/vrq+TgxP91G+jJt2a8/QDQnQbglY8ZvDZ0ICN96fPhpnW7FAmKuvrnsme4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:27:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:27:18 +0000
Message-ID: <2a6ec4b2-fb9b-4679-8aac-a5a6b7c02cda@cherry.de>
Date: Thu, 4 Dec 2025 17:27:17 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-19-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-19-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 65404f6f-a9d7-4783-7aa8-08de3351fdef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TktoVmVPUExPQmlhUUNVMWIxbUpaazhDRVhOWis0d1FLNHp1STVibjhEUTFi?=
 =?utf-8?B?eSs5QVB6MENaSndDQUVPcmVyOURkZE9YRU0wTTcvMEgrc0wzeTdNbFRkMmdt?=
 =?utf-8?B?NEtFVFF0NFpqZ2NlZ0FYa3NlQkVvaTIrRG5wdHpGbUVPdm9NTzE0bFRlWXBJ?=
 =?utf-8?B?cW5JU2V2TTRtbnZJQjlLNWxPeUdRS3I5Z3I3cTdUamIzNkRZRm56N0xHM0Mw?=
 =?utf-8?B?QTZJR1RNMnFWMzJUcUVjWGR4MVJHaDJ0ZktsWlFRWGttSnB2UXFVVjgrMWdz?=
 =?utf-8?B?ejR2dWRqM21nK3gxbnNnVmloa1F4N01VVTlxQ2hIWldJMFFSaFRUdVVTb2xv?=
 =?utf-8?B?Y0hnVTdzOXVVSWh6Y25wZVlwRXc0bjJyeVRkc016MndBTG9VRk9pWEg3Y3Fx?=
 =?utf-8?B?aTBRSzZFVDZMb1FUTDhHeGJxYU1qS0VUZFBqeVdZamM3Zkx0dUpsZHEvcHBa?=
 =?utf-8?B?UjNJMlVyOTc2eUs5cVpmUGM5dmtKU21aMWQ0WmNjbmxIM085SE82dWxkTENi?=
 =?utf-8?B?QTJhOFpnVWd4Zmpwa3lxN2R2dXFtd3lwL0J1bC9lQ2svWG5kdDJNRGQwZzdJ?=
 =?utf-8?B?dkJ3SllBM3NxbXFTV3JiVVJwNEFFNVlRU0xialVTbSszTEtXYldRaUdHMmZx?=
 =?utf-8?B?b3YyMjU3RlAvYzEvU05hQnA0SXh1dnZkMzI4T0t3cFV4d3pRbUlVbE9vWEJZ?=
 =?utf-8?B?WEhGRnhZWjJJR2k4SGQ0dkVEYkFYTHpPOXNrNEJSUGpoeFVWN3pGVmpFTE4w?=
 =?utf-8?B?Y3dCd0RzaEc5QytPbkNFYlJyRXc5OW5JOXArOGdHVzhFZFNvc1F1RCtuVUg0?=
 =?utf-8?B?ZG9jM3E1ZHpXRm1rSC83NUNNT2F5allubEExRUgrcUh5eHNSNnl3UGVtcFhx?=
 =?utf-8?B?SHJSa1o0L3FHbCt2NE1hMVQ4alVLWkM1Mld4VHJsZFpWNHVsNlo0d1B3NXNS?=
 =?utf-8?B?c2xHTlNVNUVUZHBrV1EvMHBqSlEwTnMzWUp6VHR5dE5lT1ZFUmx6M2QzMWV4?=
 =?utf-8?B?RStXMTIxTEcyQllKR1lydjEva1UwcXhuQUZZSmdZSHJXaEwvMXN1L0ZzOFg4?=
 =?utf-8?B?SWFSNG1peFJXVWN6ZE8xQS82WVlqTkVHODJhanlwajBUSVpnYVhZdlo2RUJw?=
 =?utf-8?B?OFdqNDljMjJ4UkFSdlhVTTZveTA3RG1aTnNOaERKd1NBR0lDZmFDVldhZEE5?=
 =?utf-8?B?ckx4MzJScXp1L1M5WnF6QSsyL21weEVJT21VWSt1cWpna0w1MFdScWM2OTlZ?=
 =?utf-8?B?c21aK1dGSWtuQjlEL0c1b0JNazlMaEVQNFJIaWt5NVRzd2lTNFZWNTNJSEdk?=
 =?utf-8?B?OE9qbXI3bEdnOHgxdzNDbWZGeEJmY1E2bDRlYXlIdzJxaUt5cU9VMTZ0RkdJ?=
 =?utf-8?B?NE9lRWJCd2Z4NklOMGNMU3UwUnFwb3QveFFLUWhNeUhWcjJLSjZKSExuVWRR?=
 =?utf-8?B?bjJjTVZ6UGFGSkJrTEh1N2ZUR21OTUp3eGRTS2d1SXZhSjVxenFFYlpmZU5K?=
 =?utf-8?B?cEpkUWlDaG5mU1A4Y0RyUGJrQ2JBQ3U4MUFMT2E3Ym5LUWlnc2ZBMG5NWENi?=
 =?utf-8?B?dEhqbWNVc2xQMUcyMU1TYVNZUEtYUEJOZWZMY2diejk4ZU1pUksyQU83bGRp?=
 =?utf-8?B?R2xLRFZBRTRsNHFjOXJrR3dGRTJ6N1ZGaE1NM0RHb3FzQlVGZ0tNQkxSZ29v?=
 =?utf-8?B?dTZaVXo5MVhMejIyc0Z1MWFwQUNCWm13UjZaK1pYazZobklqUmlTb25ZUSt3?=
 =?utf-8?B?cmNjKzY0ZHRPTnlqeHQ3SlQ4N1hpSUR0Ykx2eWxtNGtzc2hTckprRnR4cjdp?=
 =?utf-8?B?WDB2Rk1yRzBsTElaWTFEaTR1OW5zdnBmNGdaQjAydnlQc0VhMDgvUlhZd0lU?=
 =?utf-8?B?RmJNSlNpaFpBc1p4dllpWHlRM0s5YlhOM29uK05NYUxnbWpjeU1SaFpSaDhm?=
 =?utf-8?Q?h1Ev0TCO1whhMlCp4S9Ozcu+DsIuPIvO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWIzR2dKTWxRbkN0Q3dQTklMMTRIajd0b1RCKzZLT0dwcTl4UUwyRDVmL3hy?=
 =?utf-8?B?NURjSEhCbWRQUC9MMG9Vem9jVUVYcEVBbEtYclIwd2VXdlFNVVBwWER5VlFu?=
 =?utf-8?B?elBhS3llVlhFWVBFTzlJVXRjeWsxY3dJMEV0eXRQdXpmZ2xQN1AvMHZBVzJU?=
 =?utf-8?B?MkZIRGJsM0I0R3BReFllS2Rua0huOGlBQmNndjNWM1JtdUdGQ2ZHNlN6T2pU?=
 =?utf-8?B?YVlhN1hscitzdENRRGhZOHRrcW9nRHFvbllxeFhxUk5RR0J5cmY1dXlocUp2?=
 =?utf-8?B?UXNpbUc3eW94SDRjNk5BNWdpbVQxbnZjdmVjUXVIU2t3RWdhc1BxeW1UbTda?=
 =?utf-8?B?NngzNEtEa25QOU92WXRtTlVPV3lxZzh1YytvZDJ2cU1Wa3V6dlIvVGl3N0pw?=
 =?utf-8?B?QTZtNi8xdmdsRGxhQXRRWjFWWXpxTy91QlJ4eUtMZ1VCRU9lOGFmWCtPM0lZ?=
 =?utf-8?B?NVFKQXY4aVBVNXk2TGlvdzRQM0V6UStTejV4YUVyK21WUFdhUjFRQnFXZE9v?=
 =?utf-8?B?eHMvdElMbEdZSzlCYWl4NGJ6L1pmUGdhQy9YbzFtaUtXc09ibnU3ZTlMOWlm?=
 =?utf-8?B?NlYrMjdDU2FUSm9hWFZENGVVWk9BUHFSMVNGVVdqNWk1UVVFZkNwKzZwU3N0?=
 =?utf-8?B?UU9lTDM0bG9sR0ptWStCQ2ZSVTJiYVB4bkY0RzJpNnpjRks2dzhDVWFWSERH?=
 =?utf-8?B?TU05L0x3U2tVRmV6ODdleGVjd0MzNWFKS1ZFQlFQbHBWYkR4VlVmOGI5VHdo?=
 =?utf-8?B?M1JNRDZ6a28zL0w4YlF6V0pVb2lsNVlkZ2thSkJ0OFlqbEdTcXI5eldPMUlG?=
 =?utf-8?B?WnNwRVcrYzhJRUlDNTgvd3ZRcEpHRTA5UUlqVjEvVzluamVkOGkrZldiL2N0?=
 =?utf-8?B?bUx1dldhbHdXUnVVK2ZjVWlJUDh2RTFOSEhBZXN5MWNmNzJqMTVQNHJxMW9l?=
 =?utf-8?B?Z05TeVRPRVZEK0d3SmVFR0RIaEx3TWxNWmlONEtUOVpTaEJ5SFBCSmxwRUR3?=
 =?utf-8?B?SGJ4L2h2K0NtcmVoamRxQXVpbitQYUpVS0dMVThUdE1zUm5rczRxZUozc0R2?=
 =?utf-8?B?SnowTTJEQmh6dFB0bGlmbGMwUmhRd1FIck5MTEpQSHVaMnNVYmhwdjRYZEhy?=
 =?utf-8?B?bm1KcTN5QWE4SjNYaWg5UGlzRXMrUnJuMkNvb2ttcEdHc0NtemJrSldOSS80?=
 =?utf-8?B?SzlZbzRxTGtNZi8xV1pQTExDbnEvYkdJMlJZSkpEbUlZeW92UVhnY3RuQUdV?=
 =?utf-8?B?RTN6U1VnbEpwKytXMENsdWs3Tldyd01Ta041bWk4aXdxZk9kS25kVmwyYVAx?=
 =?utf-8?B?SWMwb05ldkE1RXFld251UHVQQWltci9zWU1XSFc1aDVWWnFhbWZ1T1BGTDVw?=
 =?utf-8?B?a1ZMU0hWWnUyV29DYjNVRnpNUXJjczNleFNyZDQrUC9Zak9hcHlGcC94UDRB?=
 =?utf-8?B?TlJSZVk5WkFBM0hmWTVzL3g2RFMzWXpWckt3NDludnMwNlNVbmV0czBudVYx?=
 =?utf-8?B?MCs0R1FrZ0FMcjZwU0laV3lZZmVJTk52SXhnb0o1dUZLUDFPYjd2MENrUjU2?=
 =?utf-8?B?WnFGclBuMXBMZUNyQUVZY3FVZmd0WDAxSDJiRzRKWFpKaTgyNWRJdnlNQ3JM?=
 =?utf-8?B?bDlBMWE1UWhlRnpUV1VleVQxaVVRcEs4UGJlSTY3ZFA5QUxnekF6YXh3bW9W?=
 =?utf-8?B?YUwrTS8xbS9tbC9BVWh4K1lobTQyQksvZzBwK3lZekl3UlVIdjJhTWkyUzhu?=
 =?utf-8?B?R1dZajdDeVFzSm9NMGh6YXl1cEZVMDJSRTlKRGpUTytsT0Y3akFwc0tSTjda?=
 =?utf-8?B?SjB0YzlSVkFBTjBWbW9KNmx1N1JOTWxiNFFhaDVOQTliWXBISmlCRUdUMHFU?=
 =?utf-8?B?VlZ3dmI4MFRhYnJFeXBqcUpmWk9jQjlleFVsTDE2OE11SU5jNXJpdHIwM3lp?=
 =?utf-8?B?dGlrN1UyRjVpUmlvSDFDdUYrRmZGa1I2UXdVZm4zY2djekhXK0RNWHJQSkJu?=
 =?utf-8?B?bzdQbDRZZ0lUUFFJNENUam9xZHdyMGNZengxM0FueGdGVXRxd2NWb1FiQ0Fi?=
 =?utf-8?B?ZmdIUVY0RnhEcUdOZ1BmZVNjSjhoaHdRaFE5d0ZnZ1VVVkVOOEJGOTVMV2pz?=
 =?utf-8?B?aHlzK1VySTFreGtZd21GQlNnT1VGcy9FV2FLR1JvNGtXQS84ZXo5Nnp2WjU2?=
 =?utf-8?Q?l7qpBGcSb7QHhneMS8IUuZA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65404f6f-a9d7-4783-7aa8-08de3351fdef
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:27:17.9964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onuTjQykaWUPUqBZhP1YQjhSdgnTo6Si7D35vkiXO4JM5YVRbs/C1KKBHeoh8U5P+MUXdDTTS/dpH66o3OdqoN1/BgUuOfx7JUIPHUpMrGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 18/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp157a-dk1-scmi-u-boot
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
> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
> from stm32mp157a-dk1-scmi-u-boot.dtsi.
> 
> Remove led-red node which is now available in kernel DT.
> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
> 

You may want to wait for the DT to be sync'ed with Linux's for this 
patch so that the red LED can still be used with the led command?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
