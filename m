Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFBACA4864
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:34:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73948C628D1;
	Thu,  4 Dec 2025 16:34:21 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA5B3C628D1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpukAWxsxNJQqeVzMkq3RVITCsCdYonUyubgYzNy/47zRo/9rIBDAHFzktcctJUvOzOGInA3FZOYZgT13RECx/DiupAYkg2hFXOIcjR2cMORXwy3N9Gi6Clg2syd4fW+OAIS/aQWmJDk+/P+Al5bVnDGCBg47NU3BXmIzgKH2IXHS/z8zmvFqtDSHLXlXluJDebn2m6en/2XEb2qHXfGhgyrSzgPNVDXBCDG7rOQX36sHc0AzQ/VdacLxU5Tf6+vbaHk7AeDL4u4tlkXEoSfatCiW8TPSW2IB23GH5fz2lcK0Xu0kWPqPn8s418Qd7kicK+B95pXTEpA3kL821iNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ+WVe/bHEHVE9tsLsTVtXZg/tbxGQJwLw7o9O3x2ME=;
 b=YUJe6x6gqHoAHk/rDqwC5lVknc2ruaM/HX0CgJvNS0xZlq0ttDZZFFnpFMZCrxqj4SY4prsbLg16DdPteo4T9GEkkvqoXrkAOKlzlsfnzSmDQg3xgG7KejeOnglrB8HNHAITYI1TTfN29VsAeu9/bxsawNIT57TyVoK4niyIQTaeBWnn0imxUtvduj3plV/7oDjmWcJ5MWr9Skj7pZkTudfAnNVG/iQZQpK/BdZuTZOKlaCJdvxr0VsV3kIty6nM0AoFVCBeTyKo6lYFqNWf8SpMj2WOikRJdcVTEzf5Uj7W9hRmNE8G9FHgoOdb8hU3bagtgfJniEmFro5acwtRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJ+WVe/bHEHVE9tsLsTVtXZg/tbxGQJwLw7o9O3x2ME=;
 b=ReSlN53IiGgtoScxmli0BtCr1bb95YA6C2H5ZzTr3w9bZkBkDWtpcR7xw+4NH2PYhmLUGkT24oEMJWq2GW0Sj0VyWgmBCpFwpgioXCBgAiYYm1xPCz2RnDp8qozD+yPBagS35wJXkq1Co8c7J95iNXgKTkb9zdGtqT3bQj5u3Qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV4PR04MB11290.eurprd04.prod.outlook.com (2603:10a6:150:28f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:34:17 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:34:17 +0000
Message-ID: <d132665c-bbb7-4182-a474-32c3aa7781bf@cherry.de>
Date: Thu, 4 Dec 2025 17:34:07 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-22-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-22-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV4PR04MB11290:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f14f35-78a0-4463-eccd-08de3352f7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUF6R0s3c3IyN2J6R3gzVFB0QW5lSVF2WmVWWXpjaXc4aDZPVGFhTEVUMTIr?=
 =?utf-8?B?a1cydTdxRjNtY2xjRk9NY3FFQTAzVTMxTzJSREFFNXpIRGVCU25NNTBBNGx6?=
 =?utf-8?B?dlJaWGp2SzVraXZ2d1BVVUJtSUh6eXU0S0hsMGdRUCttWWFlSTk4cS9sY3BY?=
 =?utf-8?B?ZmRCSnFwOGFFTlIwUGxJWDZUYkYwWmI2SkFhL0pzZHFMdlNGMG84L1lKMGEz?=
 =?utf-8?B?djVOSEhDdHo1NDlqV01PMm5jam1yeW4rNk9EZ1dvSStmaW9kU1V0SW9iZmpv?=
 =?utf-8?B?Skc2TUFjNmhnRjdKSUh1bGRtQjVYRGZkV2s4K0J6NzVuZzlEa0VTbkFFeld2?=
 =?utf-8?B?R3Z5WC90L0dlQXk5SVpDU2xoWmtNNyt3alRtWGFXOE9JeGFBZ1R1d0c3MU1w?=
 =?utf-8?B?SHV1ZXprenlINko3d0VjS25HQk0reERNaWZhbGVuSnVjT3BLNUdWWk40eEV5?=
 =?utf-8?B?WTdZMTdjbi9KMGlSdlQvVjNWdlNnR0pvaGNGRjYzcXNSRDdINHBJd0grKzFX?=
 =?utf-8?B?OElyYUFUV1BZQ2U4VDdvRGRCVEpaYTlvWmhob3BJMGF5bkdEMlpaWVNEa3Aw?=
 =?utf-8?B?VitBbnZzK2pQR21IYUwwMzdmNjUyMS9MS1VyZ0xnZ0ZxcGdLc0N2Wjdub2RG?=
 =?utf-8?B?ZUxwUWZMalcwVUVjeG9tT25qWkdDbEdkSC9XY2FaeWVKVEVyY1lVczA3L0RN?=
 =?utf-8?B?ZTVKVVNUZDJHblczQmlFaW4rTDc4UFhyZVlFQW1IdEsxSlVtSWI3MFVzY1lS?=
 =?utf-8?B?WUp6aG5Id1JnS1AzYlVkbksxZ21XQUlXUTkrTEJxK0pmVlU3U0tzV0lZOEdi?=
 =?utf-8?B?R2ZVQUlLT2U5M0U2YlJreXpGRitxcUYxb251ZERQZHBzeGRIVDFXZFlKalBs?=
 =?utf-8?B?Ymw2ZXVQZnM0NWlTR3RaVUNjd29Semt5VmNnTlFPT2VMVlNVeFNqTFh0dytK?=
 =?utf-8?B?TzZxRlA3R2RvVXJSM2JZVXc4MUtmc1FXTkgxMG1CcmxWcmNvQzM4ZmU1bG9K?=
 =?utf-8?B?ZGtNNytzZ1hkTVloazdBcWkwZHZuRmU0NmE5NGN2My81MVpBbkM2YWpkUGJQ?=
 =?utf-8?B?VXMrZlVtUWcwbTZpL1Y5YlRTbWIxenJRTXViZFFjd092enY3VTRmcDhoblVi?=
 =?utf-8?B?b0grNWxYSFhGR0lpT0doQU12cHE5VUZlYXd3V2lueHNwQmRlM2l4M0pxU2sv?=
 =?utf-8?B?VGVxZldBQ2YwTGhwaHpXVjRLK0l0MUZyR1lFVk0xdkRaVE90UkZ3WjNuZXdW?=
 =?utf-8?B?Ymc1cENFMFlGOUxtTm9IZno0YkowSVovdCtUVlQvREhhNGZEcVgwTFJDYi9E?=
 =?utf-8?B?QlhERTBuVGFOblBvWEpOZjYrdWFnMUduVkVUUDBBdDFNNmZQQnZZRnpSUkk0?=
 =?utf-8?B?ODN0ajV4MUVBQXQ2ejBIQVE3SkhWS3YvWlRLSExBbHA0blE3a1VuWklyakZO?=
 =?utf-8?B?d0ViMGNib3RyT0JVRXpOWElSbW9UdWR4c3Q4Tjh6WlNOQ0dFVDBkVjFZU0FS?=
 =?utf-8?B?STBtdjFIVCtwRXNpb0lraFBmM1pwSFZrQmtwVGZMMVUzZ0VBa1VQMGJ2WDAw?=
 =?utf-8?B?VkFDeVZBdXM5VlA4dUgzbXhhc3Qvd2xuQWNheG5YcXhkdms1YW8vLzdQaXhP?=
 =?utf-8?B?STVCTkRCZ0lBTjlPV2Q2N05PVk9KdFhaN0E2RERRU1Vac3FPazNDNUpmbURY?=
 =?utf-8?B?RjAyUitsMWM3UVo4WktiTjMvRGZ2d2d0Y0JIY1hvZXByKzZIbnBpWk90aGRw?=
 =?utf-8?B?WGRia0svV1d3SnIzUy82aVVBM3ZyY0ZLODVreWZBY1BEUlA5Z3FLNTJEQkxP?=
 =?utf-8?B?UGRGenh1UUwyVWl1aDhNd0toZGJLZkZWTmQ5ZFA4amcwZU0xZFIzdjI0ZTRa?=
 =?utf-8?B?djhFQ29EZDZHYmlka2p6bi92V1FMZXMrdHlQWDhKR2hNcEVNUXRtR0FVUGN6?=
 =?utf-8?Q?8wEMI+5Zi5eOEyOCamcLqlKERcZ+TpBK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0prS2FISkhhSktWUUtnNGxQRlprbVNqYVlHUVZXZzFDeVQxcU10em1TQUxV?=
 =?utf-8?B?WUR0a2JIWm96UmtQd09iaEVtcUpVclNCbGdqaFltTW1wSUR1SnJ6VXc0bG91?=
 =?utf-8?B?Rmc1RFN3UzB4QjFTWWpXTWR6eVZlVy9SRUY2aktiR1JwTlMyZ1RsWDM3UmRU?=
 =?utf-8?B?cFRQeEdabFBlVVVsTndqK1VSczUxUlpsRzdicHE4cklla1hxTjh6ZXVDY2dy?=
 =?utf-8?B?a0JtZTFCNHJqaDBQa1MwVHBpWlg5VG5xejNnd2cwSnpLUFlmdmZ3blVHZitm?=
 =?utf-8?B?eDNyeURUdHZySnJuVlRaeHA2NHVZK2o0eXVpU2RiMlNGeDFRTTJDdUNTZmJG?=
 =?utf-8?B?cHhqU1lFUEVabFJqV0c4WFhReDQ3bnFtQTJUNkkrQWZFYjVzZzBlemtTSXBY?=
 =?utf-8?B?bWZXVzlhcGMxTW1xMlkxcW1JT3RMeFcxQ2FBUjc3anpkVC8vbXpGMTFJcXo2?=
 =?utf-8?B?NHdiS3kyVXlJMUwxY3dhUWZrQUcydzBCS2hGb0NNSFZ1d2xiQUduUE41RHJs?=
 =?utf-8?B?czRYaWQxOW1zaDNEM3JydTlZYlBKY3BLK1VocG43K28xOFFTRmlSZkVnbjhr?=
 =?utf-8?B?WmlTRDlZRElRa3pUaHNyTVY3N0RMcW9xMnh1QzQ5UTJVTTAvZGJtNVZVbits?=
 =?utf-8?B?aDJyUlBJTno4QnRMSVJ2aERRd1dnVi9Falp4c0lmYzc0QzVBc2FxVE82L2Ry?=
 =?utf-8?B?M2hLdGUzZ3NkZElLNUladEJPcEJFU09oU1IrajZubWk3dnEzOE1PQW4vMVhF?=
 =?utf-8?B?YUNxZDlLa2ZOK0FvSlNuREJ4ZzF4MmRHSGZuWFhSYnBPYnJWK0NkZHFyam1z?=
 =?utf-8?B?Q1E4Ums1aTg2V0lYMk9Qd284dnlYWXovMXlBUDJESWsydVZQNThCTVhsVFZQ?=
 =?utf-8?B?T0JuSS9Ld1I3bEh0RnZveDFZTDYvMmM3QmZ1Y0hqREVXRDZsalIvdjNnY1RW?=
 =?utf-8?B?UjJZMXFIUEhFY3orZVF2NC96dkE0WFlBc013MWY0UWg0Vzc0QzJrVHNBZDVp?=
 =?utf-8?B?WGNQTm1DRVA1ZHdkTUcvNWxPYTIvb3dISUFTNzhSckNqTW4yR3ZGZDZpVGI0?=
 =?utf-8?B?czdCYzl6N0dhV2xFb1FnTUN4bTBjaFhrYjc4K1hGTlRnT3Y1V2o5M09oa09W?=
 =?utf-8?B?RFl2V1BKVUVnS3pSSTdERGNFNlVzSjBGbGhGay9ROHRaVGRRa25yd1oyVHhM?=
 =?utf-8?B?clA4bUJuaklRZGJwVXA3TGY5a3ladUxqVHdnOTNNK3dtTFd6VHR0Z0lSNC82?=
 =?utf-8?B?Y01RUTRtWTJFcFdCN3BDbHk3ZVZhU1RuQ29wRDJ0R2ltdHRpNmtpWWVUZWRJ?=
 =?utf-8?B?ckpKMGdoOFRiZXVIYkxGb1pWclV3LzU2L0J3ZlMwbStuOHpRNGN5ODJtNit4?=
 =?utf-8?B?VGtyVGQwOW5heFI0MXVUazlhWjV5RnhwNFBrbzFveVNOQm1nLzVmT0x0YW1D?=
 =?utf-8?B?T0NwRVArOVdiM1JPLzgvN2lHdjFuNGlDc1BZUmtyMzMwN3l4Y3M0MUx0Sjdr?=
 =?utf-8?B?NVJmQlZCWVY1Z0pKZWdMNmxYLzVtSC9QcDN0N3luVVFNZVNnU0NhUmh0b0FP?=
 =?utf-8?B?UDk1SDg3SHIxRG9XR3FSbXdwWHZtQ0VJU01VNUpTbGhpSGlvN1FMcjR0eGpy?=
 =?utf-8?B?eWJWM0lBb09qTFVSb2xmM3BDRU9lRjZJcTJVTnNXQXNzeHBzeTJoSC9jaDVh?=
 =?utf-8?B?UWIxcjBHZm1LTWQ0QnAxQ0dGa3hOSmk5ZjlwNHlYam14MENmaVROTDZiYitD?=
 =?utf-8?B?VEhReGRVWEhNbDc1R04wZittMkk1ckhNRWdwdGRIY1lDMzYrSEZQeGlFNlV1?=
 =?utf-8?B?cjFIU2x3K09tbzJ4eFZmTXcrRWl2VS9hK3Y0d2tjYVozMU50aEg2azFrVHZY?=
 =?utf-8?B?UW11RFVLclFSOG1iQnlCYkZJRWpJZWpySURPOGw4WFNyZXJ1L3gwUGFlTVVT?=
 =?utf-8?B?VlFTTjhTZ3k1bGxvQnpYR3l1QTBLWXhHb3ZkcTZ4R3RlVEFYeGQ2ZW5aR29O?=
 =?utf-8?B?b1NacjR5dDZabWxnWERydWw3eCtvZHVkNmNwRDlYTkZRUUR6SzMzU1VZcWZ4?=
 =?utf-8?B?NkRFL2QwekRHWWZ3dzNwbTMvbDdnZzQ5NXhUSDl2WjJHUnBRMERDV3Y1aFNt?=
 =?utf-8?B?SzVlZWttSHhxcnFqQngrWFN2cXdoN00wY1FLR0tVbXNhNTdUS0E3ZVI2TEFF?=
 =?utf-8?Q?13p3+UwOO+vpfSCFrVp5LT8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f14f35-78a0-4463-eccd-08de3352f7ef
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:34:17.4867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDH7CviAtJk+VQ/YwfhKuGa3/fKR/DFFSmFmWteTg6JbK91TEo9yzZ8AEa3lwPF7YmkIQwsu8OjE2Yy4S3NF+3e0E1ASkeOd2ZhLNaQhkOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11290
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 21/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp157c-ed1-u-boot
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
> from stm32mp157cf-ed1-u-boot.dtsi.
> 
> Remove led-red and led-blue nodes which are available in kernel DT.
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
