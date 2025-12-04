Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6956CA4557
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:47:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B17EEC5F1FD;
	Thu,  4 Dec 2025 15:47:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59AEAC58D77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOq5elSvvxWiwco+V9q3dwHQ7QUXJT7ls/Ifo5kWwspWs1mkjTtM3igGpDcUqjueHML1fxV2z2AvVzELwvOKFtR0d6fZVFOGAAJSUqdkxH5mdaNRmLH0pQcLkWo1V1Nvla0XDM0Bt0Kmn/b3SV9uDWwm+zTnZ9HrzFBjtOLKK0A3slTWW+9NmxeZNueYqqoWd3FDzEZYbFLrrczrV/BNy0uCkh8wh41/oOh7Ja/dlTwjhxKnVoMmrPfE7p85ILiXSzqu1ERDwfvjtAzVPhSG2Mf3mbwrLABteUzXt8Rq344Nx4pMgATxRxkSgbwAkRGeD/bY6bDhySt0nOf7Qu17OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=uya81J/HW4x6stkBYwkWr0ClKteqfZupKLssOlR+g2EmG3gxLWc/jDUpB1Bhdu8j/AoFgZRdhV/T93Cw/cNaBBmVmIdKkTm9U3w8Nswuf7FhbcAv+VvaizKloWGJRb1L4mysP91v9SPb1mnGs56RdoXNrD+BTUNpOkwmWEg78ZHr2BI0CFFytBE4f4qcTA73I5SmimUMWGgTfattI1Xbjgoyl9KqDAC3Dll3mZO+SSAkrauj9PUudIClhF30K81cEn48hxGjOonzK1huiVyqiAJZj+qfuWcBh8vJuQkqjoP1T5fj29CCdr4qA45QhOZMs/LOalhG9i2WeT3C5+8Dxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=GTZZ/0MhyL+TxXAG/NDApc6NzPPx+TwOSuQ/yzFPpDHAhBEmP2MK3JiCpwR4xAj+Z/E4rniHl/flgRxgXnrFjDm6DOXZ1yc8Wd/Ww5exs0TMLcsNdLRTyw3guqhl3GF++0RcVTrfVZEn28KQxJ2lpP5gobUnSqpRQnpbXYiJIyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB11453.eurprd04.prod.outlook.com (2603:10a6:102:4f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:47:23 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:47:23 +0000
Message-ID: <4f8e991c-b93a-4e05-8937-d3741c2ac159@cherry.de>
Date: Thu, 4 Dec 2025 16:46:51 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-5-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-5-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB11453:EE_
X-MS-Office365-Filtering-Correlation-Id: add054e2-2b39-4708-b426-08de334c6aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkRxQTFPM2g5elBsYzYyakxNU1JpLzA3b2V0cjBBY0J6dGIvcDFFM3JRcUhG?=
 =?utf-8?B?RDljRkpKU2RBS0NJMEFqWTNOaGFscWZ2Vngwb2NHanRKNXNjTGNOYkVZYjI0?=
 =?utf-8?B?V0N5TEhmUUZDOW9KSGVtcTJwNnY3WCtSVW91MFNDSmgvN1Vxc3BCMlBsdTNR?=
 =?utf-8?B?WUEzbGlqaHpmaFd4R3JrR1ZqL29hVGZrVzZ0ZjNYOElIRjU1bmQ2NDI2MWxU?=
 =?utf-8?B?WXJhYmJWZ3EyZVNYb0hDdllwa3hYSjlWVXJ4R2JZR0V0T21CaEtDbDlQYXpP?=
 =?utf-8?B?amRzN25IUE83MFBZTVhMTjRydDdFWUxZOEFWNXpUdktwZFQ2MWZmNzZlUVc3?=
 =?utf-8?B?dEJHRjZLYWtzWTA1dWV5ZkNqaDFCVjMyVmVydDR4V1NiUFdVZEhyaWtzUE9P?=
 =?utf-8?B?ZzF1SVUxQWhqOXhXR0NzWVlhRkMzWU5nMXJaQVNnaVoyM1pBQXUydmpBdFFa?=
 =?utf-8?B?VHNvZk1nelpad1FFNG1BVDgraDkraDU4N3NKM1JEZXIwcU1sK0NyNkV5S1Y4?=
 =?utf-8?B?eDVIb2JaSFRLNkF5N055RTdlRGM4bTVET1krem53MzdHcGt5MmwwMGtkOUdI?=
 =?utf-8?B?ang5eGtIcDBwMGJkcG05eFA3VzVBOHlJdkk0RTVBYTh5TlJnZEM2OEVqbWd4?=
 =?utf-8?B?NkNaTjhaSzdaZEVWQXduRExSWGhsc1Z2c2lXRWNPaGFhbDNTZVlsUkllNFVy?=
 =?utf-8?B?L0RoMCtocVZiSVlURm5SMlN2OU5rYjhCVW5FMHlISS9iVlM1WDk0cWxJOC94?=
 =?utf-8?B?QXhaNVlnbGczZzBaUHRtaTVaNys3b3hxN2k2anNaRnMvdWlSdGlwdkdHM3U1?=
 =?utf-8?B?ZGoxMXAzNEVrelUxbEQvS1BUMEJDR2lxNmtkbkMyS1hoMWsrMEJ5NVJwUm0r?=
 =?utf-8?B?MXF6bnlTWkttQ3dSWFJhdk1sRUVHbWdOd1RlSWx6d1pNbXZWcFNKbEJmQ3V4?=
 =?utf-8?B?bjdUc2x5dWY2d0l5TTJROGE4ajhxc1ZiUFhEMnRqTFp4a1NpSFkreng0aEFE?=
 =?utf-8?B?cDErTmpxdUsrWjJSWndBNWZyTDBMRDd2bU1BbzJIbXJzWEx6TnZCUFhXWFZi?=
 =?utf-8?B?MU5mdklKUS9wblROS0k4RXdZZ1ZPR2lMYUduUktwRGNyVGc4aFBQc1RiWi9j?=
 =?utf-8?B?RWlHUUozbDgzcDhJc2ZWUGhHbS90cUVwY3Bpd0RUR201bEc2SDQ4bjZmWE1J?=
 =?utf-8?B?QmNHUjJwMHNsb1JPWndJT24rZXhHUU9sSmxRUjFaVmUyVS93cHd3LzFCMjZu?=
 =?utf-8?B?Z0ZxdDB4VDhyKzVrMzhkM3E1QUdkWVVGQjZKVDNuWFhuNW9rc0p0QkdBcTB3?=
 =?utf-8?B?NmpYaDFJREQxU3FOaUw4R0ZxVFVkclVXUHBDTWdGNEIxWms1TjNIZWtLeVpq?=
 =?utf-8?B?bE95VWhOMVlKZWJXeThqMWN4RmNYSlVXWnFaOWs3eWZQVXUyWUZwemdLZm1u?=
 =?utf-8?B?UnM1L2ZOTzdDU21qa0Nic2dsVFRDREc3dFZwU0pRNGZmMktrbHYwY3BTWExT?=
 =?utf-8?B?cEMwYk5mSWgrMStKS2JielUvQ0JDV1NPcUEwWkZHN0dDL2VZRjJkWW9IOTJN?=
 =?utf-8?B?dWxCVGw4dmZrUnlkeE5KSnMyeTdBU3F4QXNFNUJxdjh3M3dnVFdwaUZTb3k2?=
 =?utf-8?B?UlF1Wi9kY1NOVkgzMDFiSXgrVkRGVkVPZ01RbmtuMTZaSEJ4MHJlL2dsOHdX?=
 =?utf-8?B?bkFOT3RsVzU3RDRXWWh2N2tqYU9zeFQ3dk1jRUR4UmJrdDdWWGJEMkJLdWJ2?=
 =?utf-8?B?SGFycjNRTEsyVjQyRnd2SU1tTG4zbVZMeHRoekcvM2JJMldMYmxiQ0JIdlpp?=
 =?utf-8?B?alRITUhycVZ5dGVpME4vZkZFSElkSWZUT3FyWncwT3NXNVJiOFFMbmlSN3Nx?=
 =?utf-8?B?MU0reGNOekFOR0JEb2NFRkRYcW5TaVBuZ2VtNE1jRklEMEdpaVk4RStQUWxM?=
 =?utf-8?Q?VGEMpQ5FyDIAm34nJ34aN/43T512i/FT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFHTXVqODM4amxydUZkV1I5WmNEUHMwWVdDWU9sWW5SczVyWklZaHIyc2RN?=
 =?utf-8?B?K0JjR21uNE9Bd1hicE1vY3N1WTRDRFRZNnc3YnBza0VVNk1WVXE4aEwvdGNG?=
 =?utf-8?B?Nno4T2VUOU91TGUvcEo3UUZhc2NzM1J3bFJxbW9GZUJxL2RzQTZTVmJDY0Y4?=
 =?utf-8?B?VTcyVC80WFQyc2d1RkJnOVduVUlQYmtPemFYT2RLc2Njb2RVenRlT1QyZWJS?=
 =?utf-8?B?WnNmOFV4K3BxTko2MDA0SWNaVGxPZ05ZWFZlRmRIWG83YnBMYVg3dFhjbXhq?=
 =?utf-8?B?MWkxdUtUOTQyQXM1U3VhQy92QlVaZDhqbFJwRTZmQk00eTArWEhlaEZKRE4x?=
 =?utf-8?B?dmQvSlFIM0k1dXdPUnY1QTFmQW9TQXl4NkpYZDRDeElRaDZ0Z2FrSWkvckdQ?=
 =?utf-8?B?SHlxeW5VZVRDOHFpZXkrc293QnB3cUxISG5WcXdhbFVCU21XclBFdUowdmFq?=
 =?utf-8?B?eThOQlZpWVRUbklMK05KbzhmRFV0cmZwRWRORUdsY1QrSXVabEI5NHlzeGZM?=
 =?utf-8?B?c0cyb1MvbUVPSk5RbVhUc08wVEducjZRRGxsZjRJWlMxdjJHYlVYVkNIbGNM?=
 =?utf-8?B?N0FVOG1rNS9KMEZyWFFLeHhLZllGVWs0aHlvYUd2L1BDV3kvNEdzNGExZ3Vo?=
 =?utf-8?B?QXprSUpyUm5BOU9RL1JHL0lLWSsxbWpwZGRHZHJ5bjY5bExGTzFXQlpLZEFP?=
 =?utf-8?B?dkY5SVZweDBORzlqVzczYSsrWmtUa2gxdFBPYW1mSndRYXFzUDhwckg1QVp6?=
 =?utf-8?B?MnhjWlBkOUdSeVRTZVVzbmdtN1dETHgvT0NiR0hmdG9LcDJjOEg5ODRjNnZD?=
 =?utf-8?B?Z0hMZTlaeFVzbnRaWHZGN1hPZTNRcCtSbks1alIwZFNGR1B1R3pLTUpsaEVy?=
 =?utf-8?B?S0ozdFlISllPM0dSM3FEeUNNMmt2RXd3c1VhYU81dWp5VEV5Y0lvcGNtK0Ew?=
 =?utf-8?B?ZHVOdjNMM3JWR2RVVkJrb2l4bjVjMWpNYlJRL2pHeVFlclBuY3NUSXJ2WDZn?=
 =?utf-8?B?WDJIRWk0STVlTDhOaHhWMWIxc3p2VnY5UmxNMVA4eDAwbDZyS0t1a3JGSFBR?=
 =?utf-8?B?Z2ZhbTJkYWxhOUxmdFFXMWdjN3FpbEp5UHUrRzRwOVlKZVd5MWc1ODRTU2Ri?=
 =?utf-8?B?NHhSeEpIYUJsV0N3MlpTZTZqeUpoSHNvUXdDV2FOOFM2L000SXRQRFBNRnI5?=
 =?utf-8?B?T2RGWEtFdC9FVlJvUGNvclhmS2kxazNpQkM5azJsU29jNTlOMkJRZjBmUVNv?=
 =?utf-8?B?WXlXajJHaC9tSFYzeW14Zy9lTmdyRm92Z01nWjhJbjBGUW5JSTdPeG12Ty9k?=
 =?utf-8?B?MFFPblNUMnJPSFNHQlJxeDZzUmpPQlBrZ0tpSTdCdVBhby9nT2dIZ1hDc05x?=
 =?utf-8?B?NkNEbllnZjVCYkkxdWdjdmdLbDU0SWV4RE9NVGJ5c0dpNVh6QlVGRVdBVmla?=
 =?utf-8?B?bUZCRE5xQ2Q1MXRNS3RZSWpFTGcwdXJhY2xQVTZVVmJpVFBIRDFzRSt6T1h3?=
 =?utf-8?B?dGRKSzNaMndSNUJpbm1jdUE1MDZSNVU0aHorZFFmS1Q3cURhZ3c3UFhiMm5n?=
 =?utf-8?B?Y3hSOEpMY3JITXM4d1Yranc2SHlvOGEvQk1jSngxcXZzMVgxa0FXaUNpMHRW?=
 =?utf-8?B?L2VwNDkrU2NZYlhkWFNYR3hObDF6bURCcEFWbWZBU2RaRjhpWWhGVGlqYVNN?=
 =?utf-8?B?YVlQVHh4cnZlK3lQQlJ3OWt6bnhqOEx1RGJVZVRZREh4MitmbTFtREF2UVpv?=
 =?utf-8?B?UTErVU9LK0RBVDJEZlk1Q1JaU1pLVGdVNTJhclFWNmdYMEt5RVJoNUtkd0ZZ?=
 =?utf-8?B?a3lKN1JMT0JVTTljMkxPZFpCVnYrSlpVeXVLKzRWc1JiaVNOYUxEUUExRUxS?=
 =?utf-8?B?OW1HNmI1UmdZdkV4UUNSeU5JdGt5MlVZUWxHRXJjTzhOUk9CTDN1NkVLSGo4?=
 =?utf-8?B?ekd3S0hoaFhncG1IKytTOG9RTjFpaFRWblduN1ZRSHl1WjAvcG9Bb1BaS0pn?=
 =?utf-8?B?RzBoK0dCeFdhNjI1TVRSK1o3aytpclFYb25pMDhBaFpNRHArYUx4U1NidG1I?=
 =?utf-8?B?OU5UTHc4Tk93dTlZWXZTc2xmQndMZS9heHg4a1pacWRpTlRhQ0xlNTBFRnVz?=
 =?utf-8?B?RjhoNlE5RW5TVUZaTzdNeG9GT09IYnladFJMREp2TUNjcnNJWmNsRUZXR0Rv?=
 =?utf-8?Q?6ENVpyCLVGX84IRA6KWAr2o=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: add054e2-2b39-4708-b426-08de334c6aa8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:47:23.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b05kaxfafuQYcxeQnH4b4Gv2AB3wuV1Un9iT6GCS3F2AO3uIMAhvi2HMCrnmENIxFaMLbHvYVhkKfv11vnctBCJrlCtJ5z1aJJG919IA8TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11453
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 04/23] configs: stm32: Enable LED config
 flags for stm32f429-disco
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
