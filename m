Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D91BECA4551
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:47:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 979FBC5F1FC;
	Thu,  4 Dec 2025 15:47:24 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7916AC58D77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwhtzj6SHA0SYQWxh64vIW+pWhtDjp5i1oEghnjM/DhORjDk5l8jkJugIHKKeUQhv9XLUZziaX/ldnmW4hOQSxrF/RgdtqdFlIoGMDvWYW6evIP5l9ru8sxsTzHzC0GOs6/lEsRUmKpAgEblbs2nla5OnT7cAJd5/nvLko38kmUZMeR2hsk+Z8b883HnJmRxVwX/9c97RBiMGSB0Q/l+G4OL1EccljONoEVuuRXGeo6hj6hVUURJvGD+ZqNIxZ4IcvN6N51+COEy7QKxGxGt8h4iL/khwRcDZZcDDPA3AJ5I2qAAY7Nu5qp9IW0G8TWSVAIXZNG0Z7I8KnleuYciOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=jjSoukl8Qx1FizBr52xmKYxmel01NUngymuCQVFsvLT27TgAy0L1nbI6UEOJmTzGTDCI4Xetq2Nr6H75qhEGggnyZSOZVD69Kcrtij7Fx4OKJRaqg4ha4BhDRqve3mXD+i6+tOaowiHH50yw0VUIH9OhEU7jDyu1Pcq/deqPCgiWUBbAYw8u+eEypo8pU21zKOlkb9xlmnQan4FqaR3+KnYKvI31rk9ckNOXLmln9pmhUgliOqogoIXiXM7Cz1fc3/VzDuJpeYWThckm8OKwpbad64iIICiuvard279ZsvaDMRVeGvhblcuzra0Pv6tqtJlKjmgtU6aGWYAUMYQZ0w==
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
 2025 15:47:21 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:47:21 +0000
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
X-MS-Office365-Filtering-Correlation-Id: dc1ca9e7-6309-43aa-7311-08de334c69a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTZFUjlMankzOWRVT0NZMFRTSk44UE4raUR4dHJPYXhaOHhjUk5PVWRBbHZ1?=
 =?utf-8?B?cHB4OEhCbjVsZWpEQlVDUjNaWnFtZ2cvVUYxdjdjSUxza1hXV2UwL2ZMR1h3?=
 =?utf-8?B?QnJCQTNwbXFCc1pHSjZScEhFLzJSMFlRbTNuN3RURmtHTWY2RnVkbHJNVG1Z?=
 =?utf-8?B?S0RVV3U5VmoxRmhQKzJwVS9OS2pPSUQ0elE4bHkrWStrSXdSOVZpNFkzZXhD?=
 =?utf-8?B?azBMay9nb0pDdnNNdWgyT21nUUFxZHRGeFZDTDEvaGZyQjBxRHI3VWJPcE5r?=
 =?utf-8?B?U25icWxyWlFsUVhaN25idDJFUkJMRGw0OE55VFJ5aFNCZXJGNlNSc0xvVFc5?=
 =?utf-8?B?d3k5ZHZQTURicm1BS1gwWU9hdkRteXJsVkI0b2ZIa3NVNFFvMGRlekJhZEE3?=
 =?utf-8?B?V1JZUVJxZFJydE5IdTZJb3lMY2ZJUXRkbm91RHBIOTJzeG03eElvdUZZRGZ3?=
 =?utf-8?B?dlc1R0MzOUoybFBlVVVTbzAzWjZQanQzUW1rREJJLzJaU2RzeFlLaUxaM1Rh?=
 =?utf-8?B?VVpqQjQ3WEppSm84YjlKeVpnNUZDMzRYOUx3R1MwenUyNGVHcXh5Y3oxZEl6?=
 =?utf-8?B?bGhPWUpxdjZNRnhRMUd5UndxRm1CN2owTGVLTFkxdXNaMmljOEhZK1M1Qlgw?=
 =?utf-8?B?NE9pMkgyOHhzRUhiTnp2Y2o0NkhsUFJjejYycFNKeG9sSUorN2JZeThSWmV1?=
 =?utf-8?B?N0pydlVocmhFQ045bkQrcEx5OU9QT1M2YnBrSGRnamhKSGx2NGRibEUveVVl?=
 =?utf-8?B?bmN6alpGUUlVSFBOcDAxSlF3NzNraWM2Tk9LMm5SdzlZNHBGbDRib0xNR2xl?=
 =?utf-8?B?cnZ2L1dJSUp6K200N1ZIMHJubXoydGpoaUdlWDEzWGh4YitYVXEwYmZvcVQz?=
 =?utf-8?B?SWpScW9TQTQ3VisxU3k1WHk0dFI5L05ySHVnMWg3d3VqVWtqb01mM1ZhaXVn?=
 =?utf-8?B?ZC9TWHVKSUxUVE1CK0ZUUmRGQzNpbXkrSWI4R0pMWmhaRVNFbUl1a0QwZjRm?=
 =?utf-8?B?Sm1tUldjM2FMRkpCeldQUEdvYUxDa0VDTUtsdWFQR2lqcWFhTlZGcXBrQkRv?=
 =?utf-8?B?ZTlLd1B2MDI3RCtqSGlZL0dYa3lPK1gvL1V1OENUclJ1S3BEN2NIZG5kc1U4?=
 =?utf-8?B?YjJRbzhnQnhwTGpYTEFTM1kva3ArRjBKWFFQQmR5RWZ1b0poRCtqa0JVZ0JB?=
 =?utf-8?B?bmVja2liWXJucDBhUm93ZFF4M05VcllzbFhHYmZBQitlN1VySFZNSHFDTzRz?=
 =?utf-8?B?RTJvcWM4VjNDdFpCby95NG5PV202MDdnNHY3T0syWEVmbGRITDJmc1A4Zkk1?=
 =?utf-8?B?MjJOT0tkOUMxak5lSU0yUEdMS20wMlpuRkMzM25PRURNM3pZRWtqVDJZbHJh?=
 =?utf-8?B?cm4zdUVDSlo0Wkk4cUdOS3lRbVZ6aEpYMnJVMmJSdmt0bVlOU3pORjh2bFhF?=
 =?utf-8?B?ay9pWGpXdlVqTDBjNDNGa1hpczhHQzFoaWVmanpXRURwTFdqNUFMc3AwQVYz?=
 =?utf-8?B?dU1ZVWhzaGhFaUt3cnZZQmRhTmlUN3ovVkI0SVlxZmxYRnZBMVBLL1MwUzdD?=
 =?utf-8?B?MXNGZW1HWGR6dFNVTUh2aVpscW5KUngyUHJLZEhIS0o5V3d2N2pzK1M3NDBC?=
 =?utf-8?B?QktmSWZpN0RZUCtuTzVkN24yYzRrVXZuZ1Qya1BtQzZxbGdjQUQ1S2RLVnpa?=
 =?utf-8?B?NTFwQUNzcDFWYW5ibHErOW02SEY2aG0yT09yajJOS1o5NWlTUC9qUWxOZWJo?=
 =?utf-8?B?Q0ltTXRDbG01ZGMxdlNXZy9BaTFBL0V3ZmtvUFRSYUx4V0dhODNjRkRka1E1?=
 =?utf-8?B?a1dQZm5WVXdlcUFDejFFWlNwSHp1V0xEV1VTa1dDZk5LdjBOWHl3a2dFSExC?=
 =?utf-8?B?Nlo3eUlkR21tT0dhVGhxUXI3bVVwNDhHdDRsSGMzVCsvSTQ5RWNDbWgxVHpO?=
 =?utf-8?Q?SGAfJHpxQs9HsZpdgsaEZaS6VzDNG0tg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1NBTG14bzJMRmJETUp3MmxKdkRLN3R5eHV2K24yMXNRa214NnBMVFlJVEFy?=
 =?utf-8?B?ZWhWTU10VDBzaHZWZWhRUmkxblM2NGU4OFVJamF5bGk2MWl0N3o0ajNpL3Rk?=
 =?utf-8?B?MFNaMk1OSldFSzVSRnFUeVpiZU5ubjk5bGQ1a2lQeFEzUCs5dEdMbWtEaE1M?=
 =?utf-8?B?dzIyTFhnVXdqRS9wOUZ1ZURGZUJXU3Jtb2pxR09QSVlHaXN4cUdGYS9EQVY0?=
 =?utf-8?B?UllSb1lDU3ZoNUFXNUd6TWlxL2RuSXVpU293cDJqdkhPbUY5RFRKbE1nRXMw?=
 =?utf-8?B?M3c1cVVnZjJBSXRNT2NVak4wTFFjZ0pWZnFCYTZLYjdZVUE1aFVPMWJvT2Q0?=
 =?utf-8?B?UzZkYnRnSUsrTHROWWwvZzZUbzY0QmtudVZ2R0pVQ2NaMlhKUlJUeDI4L3JV?=
 =?utf-8?B?R0hVQm96Z0xyaHcwQXJwbGFyK2dyOTlsSGp1aStLQllqaWIzMDNIS1p1eUtU?=
 =?utf-8?B?eDBvQndGbHNNbXVnM1R1ZCtQbmEvd0gzQkovcU1EaDlGL0lkNHhXNXJKWGFn?=
 =?utf-8?B?WW1aU1R5elh3TTBQME9sRUp2bVBLWkZEaGZBTWZOajlpYkRiYy8zZTd1SkRV?=
 =?utf-8?B?OHFRV0NuQW00UEQwYnoxVFl2WlFlVWtmeDBQYUE0MHQ1Z1AvYWdpRk9aQTFt?=
 =?utf-8?B?aXhPOWVFRklNS0RKOFdLVGZRcS9jVXhJa0hHODhqNm12NHd2RUliL2NKc1VS?=
 =?utf-8?B?RDVKOUx6d0ZQSjAvaVU0bitKbUUyNjJJbjhaR21yR043MDZQOWRINkhiUHA0?=
 =?utf-8?B?Qko3aHQ2WmdIalp1UVBWa2k2NzJ0TG5jc29EQzhGU29PcmdxV24zY3U1R2R2?=
 =?utf-8?B?YitKYzZQbm80VWY1bCswK2dZY3hBNVdvTnRLcXBnWmlzTlo2R01FNWRsTFYy?=
 =?utf-8?B?OUJkWHlqTWpoZlZWUzAwSkZEVm0wL2tPa0ExcnR5ZlJqcnJqN0hOOU1TVnZ3?=
 =?utf-8?B?OWpFcU12Sy9OcXR4NGgreDJYN25BNThWU0lvaG84Nk1FdDVCZmZPNWt2USts?=
 =?utf-8?B?T0lYQTBKWXl3bUpqM3IwRm5iUEQ3RGpwblBDZWpSUGpzZDlMOTVXREgxZFBL?=
 =?utf-8?B?di9peTRGTTZweGthYjV5cnpPa2syandtR3JTMjhkbmVxdzRXUDBjVVJBT1BV?=
 =?utf-8?B?dEV3M2pBc0Fzc3JpSnF4akZWR2NkemxMblZvOGVlNHZnZ200ZG5uemkzaUxW?=
 =?utf-8?B?OWhjTVhZOFRYbitUVC9EL2dmenZqSGJBeU01aVhYUGpSK1Q1THFWd2g3MUhr?=
 =?utf-8?B?c3lSWDhoaUpkOENURlYzN2Z6bmUxd1FROXZENmZ2MUoxcld1b0k4aFNVTGZl?=
 =?utf-8?B?dlAyOE5KRDJJR3Btb3hsd3JFZVdqMGJ3RkxKb3o2aUZrelRrSFI1ZzA4Vk5P?=
 =?utf-8?B?blpKdDJ5YUlpNVdUTW8xUUh3VjlsaEFmbHJGSk5XemVoMmRUZlNzRk9qK3cz?=
 =?utf-8?B?WDBuQjc1ZXdIeVBCQkwydzl3QVc5Z0JPazJVdmZCOWorZWhyazVRc08xS2Vz?=
 =?utf-8?B?WGVRdVMyS0dYQk1nWVcxMExmUG5TcGlhV2dPU0gwU2pHbGFnQWx6bVhQbTE3?=
 =?utf-8?B?QkUzREs3WGZxTDQ0OVFyQ2ZQMnFiQm1qU1psY1QwN0lFYi81OVR6SDVWMjg4?=
 =?utf-8?B?ZjZUWXU0VjNpaU5MVENwTWNYeGtXaGo0eEc3OXF2WWdncUlnbEhOd2pVd1lY?=
 =?utf-8?B?eWhpZ3NoTHRtQ0h0d3ViYWFxM2srZU9nZGtLZW1XSGZRT25icDRtMUpjL1hw?=
 =?utf-8?B?UFFDanFEVWxPTkxHUmFZZVltTW5KMEcremVjS3NudHNGNm5waWtPcjFyVVVY?=
 =?utf-8?B?MTFLMzlxV000TWFRSDZyUDJRaFhGOVM0Wi9TRDdYQUpMcWhFRGNGV01VbjZ2?=
 =?utf-8?B?MC9BNUhjaHpDOWdwRHFZemg3UFlLZmxRK0RZYnZsTndldVU4cVdPM01MSHRW?=
 =?utf-8?B?OGV4OUlmbHJSRFkyZjFjNW1ONVJDdE1wbXBoMUkxUW0vWEtSZXdzOVVUZExG?=
 =?utf-8?B?MWU1diswcFI3Q3pTbUhiaS9lUjk4eC9iMnNVakxnWXpaV2lzMzhucFB6WFVZ?=
 =?utf-8?B?WkpaSjBWUG9LSFlRTjhvVmd2Y0JEQ0V0dFZCOFRRZ0ZHUmxyQnVTbEs0cXJ5?=
 =?utf-8?B?MDlaVXAyb05HMWsxVmkrZGdobG1NMHNnR2RESklIQVEvTFpaMm9zS1FCVXFC?=
 =?utf-8?Q?eyyhH8WXe3LIyg/jQ29ayoU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1ca9e7-6309-43aa-7311-08de334c69a4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:47:21.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKXuWY5aNS3c9CiN1qM+TRG8i7RaMIuvGUfO/LEKFd+UaNC6MuzEhPqTolOdd78VQYuFxSuwllhok1szlEs/KUa3HUNxkkpVo+6mHh2ISfE=
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
