Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D7CA4688
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:08:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0C3EC628D1;
	Thu,  4 Dec 2025 16:08:32 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013055.outbound.protection.outlook.com
 [40.107.162.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7AA0C628D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyCx3DFy0EOs9DxlUbyMtQAWUnEI/o620CNHuO54hIdG2WsYUKHUeLlV8Q1VEeJL1XHW9d+x7KFVTwJuo5d92rjhNHZiTV8POr/xusVfbpG4OjTnwwc2490nEtMYCBZPTBclHrf6RqOBY5Od/KWNNY95zdNGEKQtZsZ5J1Uo15bm9jpNYYREtGcbVNYC5ZmkQyjy5rOfNlx+5cjSGEnzvE2GWOVEFvm04YQBOrJLFRbu1gnf5eDn5Wxq6m7IbcGR7/7xCdDCIYCXLj0mfP7oEeKCffCDfyY7AXKk5kRznYQ8ycA5ZawAp4DV8zjibn0YCXrlkfDl2EbcN9FDMUUD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnJtRSUDSDgITl8nj8JuDcBYDKqczRB33GyxkJpNCOs=;
 b=M7l0zCtP3g3tueRxaN6J7KNzYwVi0C4hrGFlBXpe6kr8k1H9YTlL1XkfJePmmVZX54lU86lnOuMgub7ERGLxTlhNzDjVwby1pc4nP+p5B0J//QYxb26Yknpj3ByJHm/gA39/wSVz1Gb//yfWnqaztZBAN7qHocItcv9+MjQNf7DDjk3UoIfYPIvo4ATEjS1jXo8m+6s2GraXgYh2Ajkzk/Vk5NagVy0iqLwjZjTm70vyLHmWDz5MRuu/pqNf3sMCtibyIK76H9Pi7KujyXeqhINqzUzmM6+9/Azl7zgvhyii9qlKz3462Kdz45xDumV2PQa93nrUZTiOlYILPZ12fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnJtRSUDSDgITl8nj8JuDcBYDKqczRB33GyxkJpNCOs=;
 b=BtpVkmsBLZlIPSJDQZz7KMDE+MQjPWybAtwD7ld7y3HiJDtbtSIo9V2Bc1Ku7YqG0SUphq4Pegh5GbzSL4Uub/9HfBYxMpJJPThrpbzpJbv4mOLiXvlmrdY0BjkCtuYKAluaR00wGbXJ0zcRJmDCCdEJSZCtFseoJUVzXnQt9N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10048.eurprd04.prod.outlook.com (2603:10a6:150:118::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:08:28 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:08:28 +0000
Message-ID: <658aa720-395d-40f4-aa5f-087eb0f2e70f@cherry.de>
Date: Thu, 4 Dec 2025 17:08:14 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-12-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-12-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10048:EE_
X-MS-Office365-Filtering-Correlation-Id: 188afbfc-54fa-4e73-2ba1-08de334f5c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDNOQjlSKzY5SFNoOFJOMC9qcHRzVElMdGpuODFKOXE4MTg2QnhoaGpvWGor?=
 =?utf-8?B?bmZSZWUyMXAzcjI4RTJPZ2t3WmFNRVg4dmZFK2F4cW9jMHRiSXhjdERidkxx?=
 =?utf-8?B?ZE8yUVFCOTg0d2xyTi9wZVp1ZlBBbEVyVFFiclFxbXlKMFN2b2FqdEJnOTJI?=
 =?utf-8?B?YnFjb0VmSXRvZXRuelZRa0Z4TVFkaEpkcXN5L2t6TE1HWmh5NGpiS2kyUE9B?=
 =?utf-8?B?NW8zNUxyWWVUSWJrUWVvaldMbkFUSGFQdE56Zm9UYURqSm1RbVM3Vy9ybUpD?=
 =?utf-8?B?Q3AwSk4rOUdDL2YxcEFCRWdOTnJkQzR1SU9JaXBoY1B0UmtlNkZ6UlIxQ0xH?=
 =?utf-8?B?WnFlcFhSL28wTGx1TmMyRkZvRGEvN0hlV1J6SHV3VElvWW5LelVoTFJiYWVu?=
 =?utf-8?B?R2RZbWZJWUg4dGd5TFp4endzaTd3aTNhNUxOL1p0U04xb0dUd3Bhenp0NTdU?=
 =?utf-8?B?NmVsenFsTXdzSUppNlozSHpibk14S29GU3ZFRThNZ3psd2ZNM0tCWDFUckQ4?=
 =?utf-8?B?L2I5YlRpVXFWUHpZa0U1T1ZSaEJ4K3p2M3UyTnQxNUxNMmJCa0Z6Z2ljakhB?=
 =?utf-8?B?eituWXdrYVVpcm9ZZ2lOYlF0WWtMM1dNakQyNlZQNURpYm51MzJlK3hYUkd2?=
 =?utf-8?B?SWMyeHZNR2hURVdhbWNCQnZoSDdPUVYwcFE5clVQTVc5STQ4SllGOVBsNyti?=
 =?utf-8?B?VlByTkUyYmZCZXM1YzFjRVdKVUlJYS8wQ0tCcmJjcUsyTU00eDROSU1WcjR1?=
 =?utf-8?B?bHpzNTRxMWZlNEJvL1JTU21wQ2dvU0RpQXpiQWFIcWNRdlBZRitDWUxVMEFu?=
 =?utf-8?B?UTRWRUZkVU5vWWhSK2V1Q1BCOWx2cElOczZrUk5SYXU3RHVYOGxCRHhuZGE1?=
 =?utf-8?B?dU12R216QzgzNE9zM053WVpIWXh6bFpGN0V1U2xSR2RYOG5mLzRtSUJFdjVT?=
 =?utf-8?B?SHk0Z0hMelBmRWtwbWEwenBnR09HNk9MU1U1b002dEJqMVg2cnFHYTFSVkND?=
 =?utf-8?B?aWRMS3M2N0lDZnJWenUrTXJKY2Y2QVlPdkFmWkgraU5GOWtTQzVPZ3pmOG1J?=
 =?utf-8?B?N3RkZVFEcFduRHNDNmx4U1FoNlJGN1NEaFVvdGxCS1dUNXJ6NlhPK1hta1BQ?=
 =?utf-8?B?c0VjaGcrY1VLM1NsWm9hbWJ1VW42VFFnWGY3Qm02OW1FSGNQMFpQaHV3Z2Ir?=
 =?utf-8?B?LzljbGttWndqSU1aRFdjR0doU2N2NkU3R251L2VJZEw4L2pHdnYzb2ZTTnFQ?=
 =?utf-8?B?THAyN0lsb2tFWThDQzhTQ1dqNks1NWRPVWlVYnVZN0tKbzM3M0FRelI4dTc2?=
 =?utf-8?B?RkRZc2U1Qk9kR01WT2pMTUd0SjZXaDZGQ3RnUkczYUZTUWJhL1VSS294bm01?=
 =?utf-8?B?UUJIVGRYcHQrcVdneVZZbWs3R3R5aGNvRFRFTko0NVd0TlBPaG9LM2c4cVho?=
 =?utf-8?B?Vi93Nk1Lcmp4Sk01VUJrR2hLSXNueVZKMXZRcGJ3WXk0aHBOUUxEZHppVTNu?=
 =?utf-8?B?aUs5ME9KMVMrd3lQOWN6ZTdPbTIwUTVYNzhmakEzdWRLNjlhYWI2TE5zSms3?=
 =?utf-8?B?RTJzMXB3OWlRQjlEMFVVN25WYkpqVTA1cUxJc2VYTHZLRGVyUGZHYTdMOFU4?=
 =?utf-8?B?UU1udDRXOTNkNGwzRC80MHBBUkZiSWJDUWNRNnhzSlJEcmh6R1cydXk1S2F3?=
 =?utf-8?B?ZEtlNURBdjgxTDhQRUxPMWRYYWUwMCtPc1dmQkFnUTUxM3dNL21UblFUeWpa?=
 =?utf-8?B?Q2xrNWtIY2txcTNkQXNWdGROSklYQm1xcW1VQmFpSittNWZvSnB0OGkxMjdM?=
 =?utf-8?B?eUhvMXFINEdLZzZ0ak5GYzkzTnB3UmpKbml1eExLaGsvaE90NnphV0dYaHJ1?=
 =?utf-8?B?ekJ2Y2NYKzJGbS9nZURyaVJxaGd1YVo4UHF1TmNWanFpRFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWZyaHFsaE5aRVVqdWFVMGI3NkR5WnY1MHJaRVVEREJvaDNBVFpnTzdMMTV3?=
 =?utf-8?B?RFIxQWZaTno1TndvVEh5bDRhejVESjFRdVZONEVEMFFFQ3FFRVRPTFBkckNu?=
 =?utf-8?B?dlhkZStWZStvcHNURjdJUlNCNWFVWjR4MDdaV3NiYWtHb1RMVnJYSzlaT3lX?=
 =?utf-8?B?a3Y1NloxVmhka1VicjdFRTRJZVU4RXRHMWdsOS9SVGZNcWY0bkpvUWJCWjB2?=
 =?utf-8?B?ZnBmTUNNRXhncUNCblF0cHhXL0J3ZTFUZVV0MWZEMnhhbmdqSUlOYmFXY2NZ?=
 =?utf-8?B?d09yT1JESllhWkVCNXljdWJGcUFNNVNya3QzOXNEcndwY3N2SmZWYnYxUmpS?=
 =?utf-8?B?Y1IzK1pHVmd6b1FSQ3QrcDZpNUJuUjMyOTZDOVRBSVppZmRSSmx5d3puOHdP?=
 =?utf-8?B?Sml5dVhvZTNzWStNU21Db0ZNZW43MkczL25TcGF1TmpmeXVOY3Jpa29IY3o3?=
 =?utf-8?B?cmR3N1VHOXNsdEtka1hkWXZiRHNBYTRiajhKdFJ2c0JBUnZFaXplUi9YbUpl?=
 =?utf-8?B?RXFyMXE1U05KRlNpdVBhejVveUhIUkx2OHdhcjNFNzlSdm1HM25HS1ZpRk1i?=
 =?utf-8?B?eTNiYm9uWEoxTEtBVlRJY0plSUhwS1lMVUd5Slh4RTZDSEh2L1NHalNZNTBW?=
 =?utf-8?B?VFByejRmQ2tteUFYMGJSREVxUWZydC9CM1BHSEs2aDJyN3A4ME95RGlUOHNC?=
 =?utf-8?B?WTNRSnFYNS9DMzE0OERoUTQvK1l5MDdVSlRMYUhFYlhrM3dMNXZiM01VTThG?=
 =?utf-8?B?VmM0Y3R4eWdhY3JETGtxMDJPNWdoVUI1b1l4MEV2aFpjZFA4Wm95OVpPcEtC?=
 =?utf-8?B?M3RUeUNHVUN6bytLRXo5aXdZV1g2bmcrT0xGYjNldGFRekZjK1k2L3lKWUVk?=
 =?utf-8?B?NTJtZ0FDaVFWK3M1Vm9BMVMzYVltWXRkSmMrNWxDZGxzVWZCVzNzWkJxRElv?=
 =?utf-8?B?WWVhMDh0aEY3UkNRdFU4K09mTDhlaDRlbm5uL2xsRjFFVnpmQVl3aCtkYllW?=
 =?utf-8?B?WFlpU2V5cHp5elYzRHZMQ1hOTkdEcXhOTkhqT1FXUmFPbmdWMldnZGQvS2sv?=
 =?utf-8?B?a0RNcGFKZzEwNmplaHVWa0t1UFBNSGRCbHJ5MVdBOUpEU2hRQmxaNk8xTEov?=
 =?utf-8?B?USs4SGRNcExQdmpiTWZwdTg0UXo1U21FMko2YWpSdldqdDZaemJIdEFGZEVS?=
 =?utf-8?B?MUlsS1ZkTzVEV3MzOXB2Y1ZnRzNQbUZQZ3VySDg5TGpXbUVHUGNmY3p4MFpw?=
 =?utf-8?B?QUVnbGJwckxhMzFxTVA5YUx6YlRPNmhBWGJvaWJmQVRyVUpTN0ZXU3lNRFBl?=
 =?utf-8?B?TG93RmFJYkxGcnk3TFQ0S0Q1RWpkMTVaeFNhMFpKSzZGZTR1Uk1vKzNqUXNO?=
 =?utf-8?B?TmRuZnBHSUZwNWkvcExrUWpQbUNOQmltWlJOdVF2Q2JlTEVMS3ZlbjB4UHNN?=
 =?utf-8?B?cytRTEV5SHVTNVdwMzczTThOaFVBc2lyVndmSkFwNUFtdUl5Y3NDNEcyS1Jm?=
 =?utf-8?B?WTVHR2g1OEJiMm4rTmlLQ0s2Qy9yaWJiMWpubndRM3k1cDUyejBPY011QkNk?=
 =?utf-8?B?MGtHUWZzbG8weUQxS2s2WlE4dm5RajZJN1ZLVjMzdEUvQTc4SGVJWHl6a1gz?=
 =?utf-8?B?dEtMdG1HWW1LZzBBOHZ1dEN0cXExZjhDMUZDUjVUN1B4WFNkR0NNdXpJODlt?=
 =?utf-8?B?aHY2Z1lCeW9IZHYxcTV2TTJXUURZNitPZFNvVTB1RENYVXlyOVlLK0NZS292?=
 =?utf-8?B?VElIdThNQ3pKQ0UrVEo1aUtDZ3B5UlJTVmdDa1Flc3JiUENlM2NsSm54aVpn?=
 =?utf-8?B?VE5FaXJmaUxZRWV0R0gwem00aTQxR0MzVjg3Yk9WdHpUeGFPbkZSTGhlb2NG?=
 =?utf-8?B?a3NBbmhsOHdwSlpiY2hrdUtlMEZHRnpPZUZWUEFWQmtXbkpmUFBTaGFnUGN0?=
 =?utf-8?B?RnU3ZVR1UWRTZUY5Z2pYMm1PdUE0ZmtBSUpWaUtQTmFBcVlpV3ZIVWRWTmp5?=
 =?utf-8?B?c04rUDhqV3hDUXlEcWZFK2pic3hZN0lZVzl3SXRwL28veUduY2RaZFErS25L?=
 =?utf-8?B?cjdHSDZ6R04wOEVoWmtsZXFaRmF3eHhQaGlJaTR6bENsMUNkVmRueWlSMWdE?=
 =?utf-8?B?VHFqUkk5WWNKSjZWSnYwRjR4YmtIU2tOVzhZT2w5eWxvOVNHSEhXNGdVN0pZ?=
 =?utf-8?Q?R8ieSQ3iwz/sXpNZNypJi8g=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 188afbfc-54fa-4e73-2ba1-08de334f5c9f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:08:28.3928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZ/wwwPf+fdcJ97zDcdPDW4Skj+YunRQ25csMyfTDQyR/KN3c08v64pTFM3fWmLKInhcOd3BvAkbHK9tLal4FLjgVTEqBTNo1yEPNc0yp4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10048
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 11/23] configs: stm32mp13: Enable LED_BOOT
 for stm32mp13_defconfig
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
> Enable LED_BOOT to use led_boot_on/off() API in board file.
> 

Note that the first BOOTP packet will turn off the boot LED, c.f. 
https://elixir.bootlin.com/u-boot/v2025.10/source/net/bootp.c#L392 which 
will be switched over to the new API, c.f. 
https://lore.kernel.org/u-boot/20251120-legacy-led-removal-v1-1-369d44338358@cherry.de/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
